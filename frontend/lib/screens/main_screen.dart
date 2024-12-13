import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../widgets/disease_search_bar.dart';
import '../widgets/categories_widget.dart';
import '../widgets/diagnosis_button.dart';
import '../widgets/image_grid_widget.dart'; // 수정된 ImageGridWidget 임포트
import '../styles/app_styles.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
          children: [
            const Center(child: LogoWidget()),
            SizedBox(height: screenHeight * 0.05),
            DiseaseSearchBar(
                screenWidth: screenWidth * 0.9, screenHeight: screenHeight),
            SizedBox(height: screenHeight * 0.04),
            CategoriesWidget(
                screenWidth: screenWidth * 0.9, screenHeight: screenHeight),
            SizedBox(height: screenHeight * 0.04),

            // QuickDiagnosisButton 위젯
            QuickDiagnosisButton(
                screenWidth: screenWidth, screenHeight: screenHeight),

            SizedBox(height: screenHeight * 0.05), // 텍스트와 이미지 간 간격

            // 수정된 ImageGridWidget
            ImageGridWidget(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          ],
        ),
      ),
    );
  }
}
