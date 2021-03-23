import 'package:flutter/material.dart';
import 'package:flutter_getx2/controller/login_Controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  final LoginController _loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    print(_loginController.emailTextController.text);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'DashBoard',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Welcome ',
                  style: GoogleFonts.exo2(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Text('${_loginController.emailTextController.text}',
                  style: GoogleFonts.exo2(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
