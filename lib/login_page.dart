import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shopocus_task/hello_widget.dart';
import 'package:shopocus_task/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

Future<Map> checkUser(String email, String password) async {
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
    return responseMap;
  } else {
    print('sending null');

    return {"message": "No_Connection"};
  }
}

class _LoginPageState extends State<LoginPage> {
  Map _user;

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
            TextFieldWidget(emailController: emailController, passwordController: passwordController),
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
                            Map user;
                            bool result =
                                await DataConnectionChecker().hasConnection;

                            if (result) {
                              user = await checkUser(email, password);
                            } else {
                              print('no internet connection');
                              Flushbar(
                                title: 'No Internet connection',
                                message: 'No Internet connection',
                                duration: Duration(seconds: 2),
                              )..show(context);
                            }

                            setState(() {
                              _user = user;
                            });

                            if (_user['message'] == "loggedIn") {
                              Navigator.pushReplacementNamed(
                                  context, '/second');
                            } else {
                              Flushbar(
                                // title: 'Incorrect email/Password',
                                message: 'Incorrect email/Password',
                                duration: Duration(seconds: 2),
                              )..show(context);
                            }
                            print(_user['message']);
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

