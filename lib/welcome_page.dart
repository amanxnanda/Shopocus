import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shopocus_task/arguments.dart';

import 'constants.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Center(
                //child: Text('Welcome, ${args.name} to Flutter'),
                child: TyperAnimatedTextKit(
                  text: ['Welcome to Flutter ${args.name}'],
                  isRepeatingAnimation: false,
                  speed: Duration(milliseconds: 100),
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontSize: 55.0,
                    color: logoColor,
                    fontFamily: 'Blauer',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
