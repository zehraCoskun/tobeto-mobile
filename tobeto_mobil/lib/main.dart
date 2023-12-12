import 'package:flutter/material.dart';
import 'package:tobeto_mobil/colors/tobeto_colors.dart';
import 'package:tobeto_mobil/screens/alternate_login_screen.dart';
import 'package:tobeto_mobil/screens/deneme.dart';
import 'package:tobeto_mobil/screens/login_screens.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: myColors,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginScreen(),
      },
    ),
  );
}
