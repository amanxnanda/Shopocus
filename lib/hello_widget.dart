import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: TyperAnimatedTextKit(
                
                text: ['SHOPOCUS'],
                speed: Duration(milliseconds: 100),
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  fontSize: 55.0,
                  color: logoColor,
                  fontFamily: 'Blauer',
                ),
              ),
            ),
            //Text('Sign in to your account'),
          ],
        ),
      ),
    );
  }
}
