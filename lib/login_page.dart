import 'dart:convert';
import 'dart:ui';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shopocus_task/arguments.dart';
import 'package:shopocus_task/hello_widget.dart';
import 'package:shopocus_task/text_field_widget.dart';

import 'constants.dart';

bool _isLoading = false;

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
  @override
  void dispose() {
    _isLoading = false;
    super.dispose();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromARGB(255, 3, 4, 94),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/shopping.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: new Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 3, 4, 94).withOpacity(0.3)),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HelloWidget(),
                TextFieldWidget(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        LoadingIndicator(
                          isLoading: _isLoading,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 40.0,
                            color: logoColor,
                            fontFamily: 'Blauer',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 60.0,
                            decoration: BoxDecoration(
                              color: logoColor,
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            child: IconButton(
                              onPressed: () async {
                                setState(() {
                                  _isLoading = true;
                                });
                                final String email = emailController.text;
                                final String password = passwordController.text;
                                Map user;
                                //Map user  = await checkUser(email, password);
                                bool result =
                                    await DataConnectionChecker().hasConnection;

                                if (result) {
                                  // user = await checkUser(
                                  //     'abhishekedu4979@gmail.com', "Shopocus@123");
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
                                      context, '/second',
                                      arguments: ScreenArguments(
                                          _user["user"]["name"]));
                                } else {
                                  setState(() {
                                    _isLoading = false;
                                  });
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key key,
    @required this.isLoading,
  }) : super(key: key);
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 100,
      ),
      child: Visibility(
        visible: isLoading,
        child: LinearProgressIndicator(
          minHeight: 10.0,
        ),
      ),
    );
  }
}
