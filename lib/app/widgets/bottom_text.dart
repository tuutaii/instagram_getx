import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bottom extends StatelessWidget {
  const Bottom({
    Key? key,
    this.text,
    this.textOnTap,
  }) : super(key: key);
  final String? text, textOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: context.mediaQueryViewPadding.bottom > 0 ? 20 : 10),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: text ?? 'Don’t have an account? ',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            TextSpan(
                text: textOnTap ?? 'Sign up.',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {}),
          ],
        ),
      ),
    );
  }
}
