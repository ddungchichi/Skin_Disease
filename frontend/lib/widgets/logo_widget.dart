import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 로고 텍스트
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'SKIN F',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'OOO',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: screenWidth * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'D',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        // 아래에 검은 줄 추가
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          height: 2,
          width: screenWidth * 0.6, // 줄의 길이를 화면 크기에 맞게 조절
          color: Colors.black,
        ),
      ],
    );
  }
}
