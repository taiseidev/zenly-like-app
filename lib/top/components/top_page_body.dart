import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class TopPageBody extends StatelessWidget {
  const TopPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Simply',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            SignInButton(
              Buttons.Google,
              text: "Googleで登録",
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
