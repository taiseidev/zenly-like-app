import 'package:flutter/material.dart';

class PrefectureText extends StatelessWidget {
  PrefectureText(this.prefecture, this.backgroundColor, {super.key});

  String prefecture;
  Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        32,
        60,
        0,
        0,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.5,
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Text(
            prefecture,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 40,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
