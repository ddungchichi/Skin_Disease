import 'package:flutter/material.dart';
import 'dart:async';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    //3초 후 MainScreen으로 이동하도록 한다
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/main');
    });
  }

  @override
  Widget build(BuildContext context) {
    // 화면 크기 가져오기
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white, // 배경색을 흰색으로 설정
      body: Center(
        child: Image.asset(
          'assets/images/launching_img.png', // 이미지 경로
          width: screenWidth * 0.6, // 화면 너비의 60%로 설정
          fit: BoxFit.contain, // 이미지 크기 조정을 유지하며 화면에 맞춤
        ),
      ),
    );
  }
}
