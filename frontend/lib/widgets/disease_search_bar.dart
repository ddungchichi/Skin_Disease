import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class DiseaseSearchBar extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const DiseaseSearchBar({
    required this.screenWidth,
    required this.screenHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05, // Categories와 동일한 여백을 적용
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: screenHeight * 0.06, // 높이를 화면 비율에 맞게 조정
              decoration: AppStyles.boxDecoration(screenWidth),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.03),
                    child: Icon(Icons.search,
                        color: Colors.grey, size: screenWidth * 0.06),
                  ),
                  SizedBox(width: screenWidth * 0.005), // 간격 더 줄이기
                ],
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.015), // 간격 더 줄이기
          Container(
            width: screenWidth * 0.07, // 버튼 너비 더 줄이기
            height: screenWidth * 0.07, // 버튼 높이 더 줄이기
            decoration: AppStyles.boxDecoration(screenWidth),
            child:
                Icon(Icons.add, color: Colors.black, size: screenWidth * 0.06),
          ),
        ],
      ),
    );
  }
}
