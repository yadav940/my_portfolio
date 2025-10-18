import 'package:flutter/material.dart';
import 'package:my_portfolio/view/portfolio_screen.dart';
import 'package:url_launcher/url_launcher.dart';

// --- MAIN APP ENTRY POINT ---
void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vinod Yadav Portfolio',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xff0A192F),
        scaffoldBackgroundColor: const Color(0xff0A192F),
        fontFamily: 'Poppins',
        cardColor: const Color(0xff112240),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Color(0xffCCD6F6), fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(color: Color(0xff8892B0), height: 1.5),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0A192F),
          elevation: 0,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: const Color(0xff64FFDA).withOpacity(0.1),
          labelStyle: const TextStyle(color: Color(0xff64FFDA), fontWeight: FontWeight.w500),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: Colors.transparent)
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xffCCD6F6)),
      ),
      home: const PortfolioScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


