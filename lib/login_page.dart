import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shopocus_task/generic_model.dart';
import 'package:shopocus_task/user_model.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

Future checkUser(String email, String password) async {
  final String apiURL =
      'https://ecommerce-calculator.herokuapp.com/api/MPC/login';
  final response = await http.post(
    apiURL,
    body: {"email": email, "password": password},
  );
  if (response.statusCode <= 299) {
    print(response.statusCode);

    final String responseStirng = response.body;
    final Map responseMap = jsonDecode(responseStirng);
    print(responseMap['message']);
    if (responseMap['message'] == 'loggedIn') {
      return userModelFromJson(responseStirng);
    } else {
      return genericModelFromJson(responseStirng);
    }
  } else {
    print('sending null');
    return null;
  }
}

class _LoginPageState extends State<LoginPage> {
  UserModel _user;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HelloWidget(),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.teal,
                                width: 20.0,
                                style: BorderStyle.solid,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              gapPadding: 10.0),
                          counterText: "",
                          labelText: "email",
                          labelStyle: TextStyle(
                            color: Colors.amber,
                            letterSpacing: 5.0,
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            size: 35.0,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      TextField(
                        controller: passwordController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.teal,
                                width: 20.0,
                                style: BorderStyle.solid,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              gapPadding: 10.0),
                          counterText: "",
                          labelText: "password",
                          labelStyle: TextStyle(
                            color: Colors.amber,
                            letterSpacing: 5.0,
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 35.0,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Sign in",
                        style: Theme.of(context).textTheme.headline3),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 60.0,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            final String email = emailController.text;
                            final String password = passwordController.text;

                            final UserModel user =
                                await checkUser(email, password);

                            setState(() {
                              _user = user;
                            });
                            print(_user.message);
                            //Navigator.pushReplacementNamed(context, '/second');
                          },
                          color: Colors.white,
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(FontAwesomeIcons.arrowRight),
                        ),
                      ),
                    ),
                    //_user == null ? Container() : Text('${_user.user.name}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HelloWidget extends StatelessWidget {
  const HelloWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello',
              style: TextStyle(
                fontSize: 100.0,
                color: Colors.amber,
              ),
            ),
            Text('Sign in to your account'),
          ],
        ),
      ),
    );
  }
}
