import 'package:flutter/material.dart';
import '../screens/diagnosis_screen.dart';
import '../styles/app_styles.dart';

class QuickDiagnosisButton extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const QuickDiagnosisButton({
    required this.screenWidth,
    required this.screenHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      //위젯들 중앙에 위치하도록 함
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // "피부 질환 분석 시스템" Text
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.005),
            child: Text(
              '피부 질환 분석 시스템',
              style: AppStyles.subtitleStyle(screenWidth * 0.9),
            ),
          ),
          SizedBox(height: screenHeight * 0.001), // 텍스트와 버튼 간 간격을 더 줄임

          // "빠른 진단 받기" 버튼
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DiagnosisScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppStyles.buttonBackgroundColor,
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.025,
                horizontal: screenWidth * 0.2, // 버튼 가로 크기 조정
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min, // Row의 크기를 텍스트와 아이콘의 크기에 맞게 조정
              children: [
                Icon(
                  Icons.touch_app, // 손 모양 아이콘
                  color: Colors.black,
                  size: screenHeight * 0.03,
                ),
                SizedBox(width: screenWidth * 0.02), // 아이콘과 텍스트 간의 간격
                Text(
                  '빠른 진단 받기',
                  style: AppStyles.buttonTextStyle(screenWidth),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
