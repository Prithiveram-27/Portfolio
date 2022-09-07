// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import '../screens/signup_screen.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthCard(),
    );
  }
}

class AuthCard extends StatefulWidget {
  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  @override
  Widget build(BuildContext context) {
    final _passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey();
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          child: Image.asset("assets/images/login.jpg"),
        ),
        Container(
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'E-Mail'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                      return null;
                    },
                    onSaved: (emailValue) {
                      print(emailValue);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 5) {
                        return 'Password is too short!';
                      }
                    },
                    onSaved: (passwordValue) {
                      print(passwordValue);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(SignUpScreen.routeName);
                          },
                          child: Text("Signup"))
                    ],
                  ),
                  SignInButton(
                    Buttons.Google,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    text: "Sign in with Google",
                    elevation: 15,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SignInButton(
                    Buttons.LinkedIn,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    text: "Sign in with LinkedIn",
                    elevation: 15,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
