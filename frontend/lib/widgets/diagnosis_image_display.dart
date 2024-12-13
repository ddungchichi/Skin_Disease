import 'package:flutter/material.dart';
import 'dart:io';

class DiagnosisImageDisplay extends StatelessWidget {
  final File? image;
  final double screenWidth;
  final double screenHeight;

  const DiagnosisImageDisplay({
    required this.image,
    required this.screenWidth,
    required this.screenHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: screenHeight * 0.3,
            width: screenWidth * 0.6,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(8),
            ),
            child: image == null
                ? Icon(
                    Icons.add,
                    size: screenWidth * 0.1,
                    color: Colors.red,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      image!,
                      height: screenHeight * 0.3,
                      width: screenWidth * 0.6,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
