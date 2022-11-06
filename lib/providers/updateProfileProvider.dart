// ignore_for_file: unused_import, avoid_print

import 'package:flutter/material.dart';
import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserDetails {
  final String? name;
  String? phNo;
  String? email;
  String? knownTechnologies;
  String? userDesc;
  String? imgData;

  UserDetails({
    required this.name,
    required this.phNo,
    required this.email,
    required this.knownTechnologies,
    required this.userDesc,
    this.imgData,
  });
}

class UpdateProfileDetails with ChangeNotifier {
  List<UserDetails> _userDetails = [];

  List<UserDetails> get orders {
    return [..._userDetails];
  }

  final String authToken;
  final String userId;

  UpdateProfileDetails(this.authToken, this.userId, this._userDetails);

  Future addUsersProfileDetails(UserDetails userData) async {
    final url = Uri.parse(
        "https://portfolio-app-3187c-default-rtdb.firebaseio.com/UserDetails.json");
    final response = await http.get(url);
    List<UserDetails> usersProfileDetails = [];
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'name': userData.name,
          'phoneNumner': userData.phNo,
          'email': userData.email,
          'knownTechnologies': userData.knownTechnologies,
          'userDesc': userData.userDesc
        }),
      );
      print(response.toString());
      final userId = json.decode(response.body)['name'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("UserId", userId);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("UserId");
    try {
      final url = Uri.parse(
          "https://portfolio-app-3187c-default-rtdb.firebaseio.com/UserDetails/$userId.json");
      final response = await http.get(url);
      final extractedData = json.decode(response.body); //as Map< dynamic>;
      final List<UserDetails> userData = [];
      if (extractedData == null || extractedData.isEmpty) {
        return;
      }
      for (var i = 0; i < extractedData.length; i++) {
        userData.add(UserDetails(
          name: extractedData['name'],//value['id']['name'],
          phNo: extractedData['phoneNumner'],
          email: extractedData['email'],
          knownTechnologies: extractedData['knownTechnologies'],
          userDesc: extractedData['userDesc'],
        ));
        print(userData);
      }
      //extractedData.forEach((key, value) {});
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
