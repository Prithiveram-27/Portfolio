import 'package:flutter/material.dart';
import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class UserDetails {
  String name;
  String phNo;
  String email;
  String knownTechnologies;
  String userDesc;
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
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }


  Future getUserDetails() async{
    final url = Uri.parse(
        "https://portfolio-app-3187c-default-rtdb.firebaseio.com/UserDetails.json");
  }
}

