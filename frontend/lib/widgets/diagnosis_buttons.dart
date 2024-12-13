import 'package:flutter/material.dart';

class DiagnosisButtons extends StatelessWidget {
  final VoidCallback onPickImage;
  final VoidCallback onStartAnalysis;
  final double screenWidth;

  const DiagnosisButtons({
    required this.onPickImage,
    required this.onStartAnalysis,
    required this.screenWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPickImage,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            '파일 업로드',
            style: TextStyle(fontSize: screenWidth * 0.04),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: onStartAnalysis,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            '진단 받기',
            style: TextStyle(fontSize: screenWidth * 0.045),
          ),
        ),
      ],
    );
  }
}
