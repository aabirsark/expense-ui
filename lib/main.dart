import 'package:expense/app/constants.app.dart';
import 'package:expense/meta/views/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ExpenseApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: scaffoldColor));
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: scaffoldColor,
          fontFamily: GoogleFonts.lato().fontFamily,
          appBarTheme: AppBarTheme(
              color: Colors.transparent,
              elevation: 0.0,
              titleTextStyle: TextStyle(
                  fontFamily: GoogleFonts.lato().fontFamily, fontSize: 18))),
      home: const HomePage(),
    );
  }
}
