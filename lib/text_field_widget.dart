import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key key,
    @required this.emailController,
    @required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
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
                    FontAwesomeIcons.userAlt,
                    size: 25.0,
                    color: Colors.amber,
                  ),
                ),
              ),
              TextField(
                controller: passwordController,
                //textAlign: TextAlign.center,
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
                    FontAwesomeIcons.lock,
                    size: 25.0,
                    color: Colors.amber,
                  ),
                  // suffixIcon: Icon(
                  //   FontAwesomeIcons.eye,
                  //   size: 25.0,
                  //   color: Colors.amber,
                  // ),
                  
                ),
                

              ),
            ],
          ),
        ),
      ),
    );
  }
}

