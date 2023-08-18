import 'package:festival_post/Views/details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Views/bhagwat_quote.dart';
import 'Views/home_page.dart';
import 'Views/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color(0xff70cbe9),
      ),
      routes: {
        '/': (context) => Splash_screen(),
        'home': (context) => Home_Page(),
        'all_Quotes': (context) => All_Quotes(),
        'details_page': (context) => Detail_Page(),


      },
    ),
  );
}
