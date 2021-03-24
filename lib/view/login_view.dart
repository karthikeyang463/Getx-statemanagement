import 'package:flutter/material.dart';
import 'package:flutter_getx2/controller/login_controller.dart';
import 'package:flutter_getx2/view/home_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Getx Login',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: GetBuilder<LoginController>(
            init: Get.put(LoginController()),
            builder: (_loginController) => Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _loginController.emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          filled: true,
                          hintText: 'Email',
                          hintStyle: GoogleFonts.exo2(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0))),
                      style: GoogleFonts.exo2(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                      onChanged: (value) {
                        _loginController.emailValidation(value);
                      },
                    ),
                    Obx(() => Column(
                          children: [
                            Row(
                              children: [
                                _loginController.emailValidate.value
                                    ? const Icon(Icons.check,
                                        color: Colors.green)
                                    : const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                                Text('Please Enter the Valid Email',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            _loginController.emailValidate.value
                                                ? Colors.green
                                                : Colors.red)),
                              ],
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _loginController.passwordTextController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          filled: true,
                          hintText: 'Password',
                          hintStyle: GoogleFonts.exo2(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0))),
                      autovalidateMode: AutovalidateMode.always,
                      // validator: (val) {
                      //   _loginController.passwordValidation(val);
                      // },
                      onChanged: (value) {
                        _loginController.passwordValidation(value);
                      },
                      style: GoogleFonts.exo2(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                    Container(
                        height: 100,
                        child: Obx(() => ListView(
                              children: [
                                Row(
                                  children: [
                                    _loginController.valid1.value
                                        ? const Icon(Icons.check,
                                            color: Colors.green)
                                        : const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                    Text(
                                        'Password must contains atleast 6 chracters',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: _loginController.valid1.value
                                                ? Colors.green
                                                : Colors.red)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    _loginController.valid2.value
                                        ? const Icon(Icons.check,
                                            color: Colors.green)
                                        : const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                    Text(
                                        'Password must contains atleast 1 Special chracters',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: _loginController.valid2.value
                                                ? Colors.green
                                                : Colors.red)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    _loginController.valid3.value
                                        ? const Icon(Icons.check,
                                            color: Colors.green)
                                        : const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                    Text(
                                        'Password must contains atleast 1 Uppercase chracters',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: _loginController.valid3.value
                                                ? Colors.green
                                                : Colors.red)),
                                  ],
                                ),
                                // Text('${_loginController.valid2.value}'),
                                Row(
                                  children: [
                                    _loginController.valid4.value
                                        ? const Icon(Icons.check,
                                            color: Colors.green)
                                        : const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                    Text(
                                        'Password must contains atleast 1 number chracters',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: _loginController.valid4.value
                                                ? Colors.green
                                                : Colors.red)),
                                  ],
                                ),
                              ],
                            ))),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(
                      () => MaterialButton(
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        color: Colors.deepOrangeAccent,
                        splashColor: Colors.white,
                        height: 45,
                        minWidth: Get.width / 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: _loginController.validated.value == false
                            ? null
                            : () => Get.to<LoginController>(() => HomeView()),
                        child: Text(
                          'Login',
                          style: GoogleFonts.exo2(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ),
      );
}
