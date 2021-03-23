import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_getx2/utility/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'GetX app',
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
        getPages: Routers.route,
        initialRoute: '/loginView',
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            appBarTheme: AppBarTheme(
                color: Colors.deepOrange,
                textTheme: TextTheme(
                    headline6: GoogleFonts.exo2(
                        color: Colors.deepOrange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)))),
      );
}
