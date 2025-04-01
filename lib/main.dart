import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/station_list_page.dart';
import 'pages/seat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '기차 예매',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[200],
        primarySwatch: Colors.purple,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
          ),
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      themeMode: ThemeMode.system, // 시스템 다크/라이트 설정에 따라 자동 적용
      home: const HomePage(),
    );
  }
}
