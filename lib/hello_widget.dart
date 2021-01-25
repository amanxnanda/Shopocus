import 'package:flutter/material.dart';

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
