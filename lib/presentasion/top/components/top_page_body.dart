import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zenly_like_app/feature/auth.dart';
import 'package:zenly_like_app/utils/constants/string.dart';

class TopPageBody extends HookConsumerWidget {
  const TopPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              appTitleStr,
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
              text: googleButtonStr,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () => ref.read(signInGoogleProvider).call(),
            ),
          ],
        ),
      ),
    );
  }
}
