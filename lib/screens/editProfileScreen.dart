// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_key_in_widget_constructors, non_constant_identifier_names, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_app/constants.dart';
import 'package:provider/provider.dart';
import '../providers/googleSignInProvider.dart';
import '../providers/updateProfileProvider.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = "/editProfile";

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _knownTechFocusNode = FocusNode();
  final _descTechFocusNode = FocusNode();

  var _editedUserDetails = UserDetails(
    name: "",
    phNo: "",
    email: "",
    knownTechnologies: "",
    userDesc: "",
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    _knownTechFocusNode.dispose();
    _nameFocusNode.dispose();

    super.dispose();
  }

  Future<void> _saveUserDetails() async {
    final validate = _formKey.currentState?.validate();
    if (validate == false) {
      return;
    }
    _formKey.currentState?.save();
    setState(
      () {
        //_isLoading = true;
      },
    );
    final provider =
        await Provider.of<UpdateProfileDetails>(context, listen: false);
    provider.addUsersProfileDetails(_editedUserDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: appLinearGradient,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              //Name TextField
              TextFormField(
                initialValue: "", // _initialValues['title'].toString(),
                decoration: InputDecoration(labelText: 'Name'),
                textInputAction: TextInputAction.next,
                focusNode: _nameFocusNode,
                validator: (value) {
                  if (value == "") {
                    return "Please provide the Title";
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_phoneFocusNode);
                },
                onSaved: (value) {
                  _editedUserDetails = UserDetails(
                    name: value.toString(),
                    phNo: _editedUserDetails.phNo,
                    email: _editedUserDetails.email,
                    knownTechnologies: _editedUserDetails.knownTechnologies,
                    userDesc: _editedUserDetails.userDesc,
                  );
                },
              ),
              //Phone TextField
              TextFormField(
                initialValue: "", // _initialValues['title'].toString(),
                decoration: InputDecoration(labelText: 'Phone Number'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _phoneFocusNode,
                validator: (value) {
                  if (value == "") {
                    return "Please provide Phone Number";
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                },
                onSaved: (value) {
                  _editedUserDetails = UserDetails(
                    name: _editedUserDetails.name,
                    phNo: value.toString(),
                    email: _editedUserDetails.email,
                    knownTechnologies: _editedUserDetails.knownTechnologies,
                    userDesc: _editedUserDetails.userDesc,
                  );
                },
              ),
              //Email TextField
              TextFormField(
                initialValue: "", // _initialValues['title'].toString(),
                decoration: InputDecoration(labelText: 'email'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                focusNode: _emailFocusNode,
                validator: (value) {
                  if (value == "") {
                    return "Please provide email";
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_knownTechFocusNode);
                },
                onSaved: (value) {
                  _editedUserDetails = UserDetails(
                    name: _editedUserDetails.name,
                    phNo: _editedUserDetails.phNo,
                    email: value.toString(),
                    knownTechnologies: _editedUserDetails.knownTechnologies,
                    userDesc: _editedUserDetails.userDesc,
                  );
                },
              ),
              //Known Technologies
              TextFormField(
                initialValue: "", // _initialValues['title'].toString(),
                decoration: InputDecoration(labelText: 'Known Technologies'),
                textInputAction: TextInputAction.next,
                focusNode: _knownTechFocusNode,
                validator: (value) {
                  if (value == "") {
                    return "Please provide Known Technologies";
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descTechFocusNode);
                },
                onSaved: (value) {
                  _editedUserDetails = UserDetails(
                    name: _editedUserDetails.name,
                    phNo: _editedUserDetails.phNo,
                    email: _editedUserDetails.email,
                    knownTechnologies: value.toString(),
                    userDesc: _editedUserDetails.userDesc,
                  );
                },
              ),
              //UserDesc TextField
              TextFormField(
                initialValue: "", // _initialValues['title'].toString(),
                decoration: InputDecoration(labelText: 'Description'),
                textInputAction: TextInputAction.next,
                focusNode: _descTechFocusNode,
                validator: (value) {
                  if (value == "") {
                    return "Please provide Description";
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (_) {},
                onSaved: (value) {
                  _editedUserDetails = UserDetails(
                    name: _editedUserDetails.name,
                    phNo: _editedUserDetails.phNo,
                    email: _editedUserDetails.email,
                    knownTechnologies: _editedUserDetails.knownTechnologies,
                    userDesc: value.toString(),
                  );
                },
              ),
              // SizedBox(
              //   height: 100,
              // ),
              const Spacer(),
              //Submit Button
              Container(
                height: 60,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  gradient: LinearGradient(
                      colors: [Colors.deepPurpleAccent, Colors.cyan]),
                ),
                child: InkWell(
                  onTap: _saveUserDetails,
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
