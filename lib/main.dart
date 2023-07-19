import 'package:flutter/material.dart';
import 'package:physical_health/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Rokh",
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF00C6CF),
          onPrimary: Colors.white,
          secondary: Color(0xFFF6F6F6),
          onSecondary: Color(0xFFADADAD),
          error: Colors.redAccent,
          onError: Color(0xFF3C3C3C),
          background: Color(0xFFFFFFFF),
          onBackground: Color(0xFF3C3C3C),
          surface: Color(0xFFF6F6F6),
          onSurface: Color(0xFFABABAB),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
