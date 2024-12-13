import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart'; // 권한 패키지 추가
import '/screens/launch_screen.dart'; // LaunchScreen import
import '/screens/main_screen.dart'; // MainScreen import

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 엔진 초기화
  await requestPermissions(); // 권한 요청
  runApp(const SkinDiseaseApp());
}

Future<void> requestPermissions() async {
  // 요청할 권한 목록
  final permissions = [
    Permission.storage, // 파일 저장 권한
    Permission.camera, // 카메라 권한
    Permission.photos, // 미디어 접근 권한 (Android 13 이상)
  ];

  for (var permission in permissions) {
    if (await permission.isDenied) {
      await permission.request(); // 권한 요청
    }
  }
}

class SkinDiseaseApp extends StatelessWidget {
  const SkinDiseaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const LaunchScreen(), // LaunchScreen을 첫 번째 화면으로 설정
      routes: {
        '/main': (context) => const MainScreen(),
      },
    );
  }
}
