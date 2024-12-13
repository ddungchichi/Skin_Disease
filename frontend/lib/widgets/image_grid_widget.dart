import 'package:flutter/material.dart';
import '../styles/app_styles.dart'; // 스타일을 적용하기 위해 import

class ImageGridWidget extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const ImageGridWidget({
    required this.screenWidth,
    required this.screenHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // "피부 질환을 빠르게 분석하여 생활 관리 솔루션을 제공합니다." 텍스트 추가
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: Text(
            '피부 질환을 빠르게 분석하여\n생활 관리 솔루션을 제공합니다.',
            textAlign: TextAlign.center, // 텍스트 중앙 정렬
            style: AppStyles.subtitleStyle(screenWidth).copyWith(
              fontSize: screenWidth * 0.04, // 텍스트 크기 조정
              fontWeight: FontWeight.w400, // 텍스트 두께 조정
            ),
          ),
        ),
        // 텍스트와 그리드 사이의 간격을 줄임
        SizedBox(height: screenHeight * 0.0001), // 간격을 더 줄임

        // 이미지 그리드
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.12, // 왼쪽, 오른쪽 간격을 더 넓히기
            vertical: screenHeight * 0.01, // 위쪽, 아래쪽 간격을 더 줄이기
          ),
          child: GridView.count(
            crossAxisCount: 2, // 2열 그리드
            crossAxisSpacing: screenWidth * 0.03, // 가로 간격
            mainAxisSpacing: screenHeight * 0.01, // 세로 간격
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // 스크롤 비활성화
            childAspectRatio: 1.0, // 비율을 그대로 유지
            children: [
              'assets/images/main1.png',
              'assets/images/main2.png',
              'assets/images/main3.png',
              'assets/images/main4.png',
            ].map((imagePath) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(screenWidth * 0.03),
                child: SizedBox(
                  // width: screenWidth * 0.08, // 이미지 너비를 8%로 설정 (크기 줄임)
                  // height: screenHeight * 0.06, // 이미지 높이를 6%로 설정 (크기 줄임)
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain, // 이미지 크기를 비율을 유지하면서 축소
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
