import 'package:flutter/material.dart';
import 'dart:io';
import '../widgets/logo_widget.dart'; // LogoWidget import
import 'main_screen.dart';

class ResultScreen extends StatelessWidget {
  final String diseaseName; // 진단 결과 텍스트
  final String description; // 상세 설명 텍스트
  final File image; // DiagnosisScreen에서 업로드한 이미지

  const ResultScreen({
    required this.diseaseName,
    required this.description,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FC),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // LogoWidget 사용
            const Center(child: LogoWidget()),
            SizedBox(height: screenHeight * 0.03),
            // 첫 번째 이미지
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                image,
                height: screenHeight * 0.25,
                width: screenWidth * 0.5,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            // 진단 결과 텍스트
            Text(
              "진단 결과 : $diseaseName 가 의심됩니다!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            // 진단 결과에 대한 상세 설명 텍스트
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: screenWidth * 0.8, // 텍스트 폭 제한
              ),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Spacer(),
            // 버튼들
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // 재촬영 버튼 클릭 시 이전 화면으로 돌아가기
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    '재촬영',
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    '닫기',
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.07),
          ],
        ),
      ),
    );
  }
}
