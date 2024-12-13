import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'result_screen.dart';
import '../widgets/logo_widget.dart';

class LoadingScreen extends StatelessWidget {
  final File image;

  const LoadingScreen({required this.image, super.key});

  // 서버로 이미지 전송 후 응답을 기다리는 함수
  Future<String> _sendImageToServer(File image) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://SongNathan.pythonanywhere.com/test'),
      );
      request.files.add(await http.MultipartFile.fromPath('image', image.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        return await response.stream.bytesToString();
      } else {
        throw Exception('서버에 연결할 수 없습니다. 상태 코드: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('이미지 전송 중 오류 발생: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FC),
      body: Column(
        children: [
          // 로고
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.1),
            child: const LogoWidget(),
          ),
          // Divider 제거됨
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 화살표
                  SizedBox(
                    height: screenHeight * 0.1,
                    width: screenHeight * 0.1,
                    child: const CircularProgressIndicator(
                      strokeWidth: 3.0, // 화살표 두께
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // 화살표와 텍스트 간격
                  // 텍스트
                  const Text(
                    "분석 중",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // FutureBuilder 로직 (변경 없음)
          FutureBuilder<String>(
            future: _sendImageToServer(image),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox.shrink(); // 로딩 중 빈 상태
              }
              if (snapshot.hasError) {
                return Text(
                  '오류 발생: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                );
              }
              if (snapshot.hasData) {
                try {
                  final result =
                      jsonDecode(snapshot.data!) as Map<String, dynamic>;
                  final diseaseName =
                      result["disease_name"] ?? "No Disease Name available";
                  final description =
                      result["description"] ?? "No description available";

                  Future.microtask(() {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          diseaseName: diseaseName,
                          description: description,
                          image: image,
                        ),
                      ),
                    );
                  });
                  return const SizedBox.shrink();
                } catch (e) {
                  return Text(
                    '데이터 파싱 오류: $e',
                    style: const TextStyle(color: Colors.red),
                  );
                }
              }
              return const Text('예기치 않은 오류가 발생했습니다.');
            },
          ),
        ],
      ),
    );
  }
}
