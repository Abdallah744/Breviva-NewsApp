// ignore_for_file: use_key_in_widget_constructors, unnecessary_import

import 'dart:io' show Platform;

import 'package:breviva_app/shared/network/remote/dio_helper.dart';
import 'package:breviva_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layout/news_layout/home_layout.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows) {}
  DioHelper.init();
  runApp(NewsApp());
}

class NewsApp extends StatefulWidget {
  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  ThemeMode appMode = ThemeMode.light;

  void changeAppMode() {
    setState(() {
      if (appMode == ThemeMode.light) {
        appMode = ThemeMode.dark;
      } else {
        appMode = ThemeMode.light;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.red,
            fontSize: appBarTitleFontSize,
            fontWeight: appBarTitleFontWeight,
          ),
          iconTheme: IconThemeData(color: Colors.black87),
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.black87,
          backgroundColor: Colors.white,
          elevation: 20,
        ),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black87)),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: HexColor('333739'),
        appBarTheme: AppBarTheme(
          backgroundColor: HexColor('333739'),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.redAccent,
            fontSize: appBarTitleFontSize,
            fontWeight: appBarTitleFontWeight,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.black87,
          elevation: 20,
        ),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      themeMode: appMode,
      home: HomePage(changeTheme: changeAppMode),
    );
  }
}
