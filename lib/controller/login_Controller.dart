import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;

  final emailValidate = false.obs;
  final passwordValidate = false.obs;

  final validated = false.obs;

  final valid1 = false.obs;
  final valid2 = false.obs;
  final valid3 = false.obs;
  final valid4 = false.obs;

  // static LoginController get to => Get.find();

  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    passwordValidate.value = false;
    emailValidate.value = false;
    super.onInit();
  }

  // String passwordValidates(String value) {
  //   var patternoneSpecial = r'^(?=.*?[!@#\$&*~]).{8,}$';
  //   var patternOneUppercase = r'^(?=.*[A-Z])';
  //   var patternOneDigit = r'^(?=.*?[0-9])';
  //   var regex1 = RegExp(patternoneSpecial);
  //   var regex2 = RegExp(patternOneUppercase);
  //   var regex3 = RegExp(patternOneDigit);

  //   if (value == null || value.length <= 5) {
  //     valid1.value = false;
  //     return 'Password must contains atleast 6 chracters';
  //   } else if (!regex1.hasMatch(value)) {
  //     valid2.value = false;
  //     return 'Password must contains atleast 1 Special chracters';
  //   } else if (!regex2.hasMatch(value)) {
  //     valid3.value = false;
  //     return 'Password must contains atleast 1 Uppercase chracters';
  //   } else if (!regex3.hasMatch(value)) {
  //     valid4.value = false;
  //     return 'Password must contains atleast 1 numeric chracters';
  //   } else {
  //     valid1.value = true;
  //     valid2.value = true;
  //     valid3.value = true;
  //     valid4.value = true;
  //     return 'Password is correct';
  //   }
  // }

  void passwordValidation(String value) {
    var patternoneSpecial = r'^(?=.*?[!@#\$&*~]).{8,}$';
    var patternOneUppercase = r'^(?=.*[A-Z])';
    var patternOneDigit = r'^(?=.*?[0-9])';
    var regex1 = RegExp(patternoneSpecial);
    var regex2 = RegExp(patternOneUppercase);
    var regex3 = RegExp(patternOneDigit);

    if (value == null || value.length <= 5) {
      passwordValidationChracters(value);
      valid1.value = false;
    } else {
      valid1.value = true;
    }

    if (!regex1.hasMatch(value)) {
      passwordValidationSpecial(value);
      valid2.value = false;
    } else {
      valid2.value = true;
    }
    update();
    if (!regex2.hasMatch(value)) {
      passwordValidationUppercase(value);
      valid3.value = false;
    } else {
      valid3.value = true;
    }
    if (!regex3.hasMatch(value)) {
      passwordValidationNumericChracter(value);
      valid4.value = false;
    } else {
      valid4.value = true;
    }

    if (valid1.value == true &&
        valid2.value == true &&
        valid3.value == true &&
        valid4.value == true) {
      passwordValidate.value = true;
    } else {
      passwordValidate.value = false;
    }

    update();
    checkLogin();
  }

  String passwordValidationChracters(String value) {
    if (value == null || value.length <= 5) {
      return null;
    } else {
      return 'Password contains minimum 6 chracters';
    }
  }

  String passwordValidationSpecial(String value) {
    var patternoneSpecial = r'^(?=.*?[!@#\$&*~]).{8,}$';

    var regex1 = RegExp(patternoneSpecial);

    if (regex1.hasMatch(value)) {
      return 'Password contains 1 Special Characters';
    } else {
      return null;
    }
  }

  String passwordValidationUppercase(String value) {
    var patternOneUppercase = r'^(?=.*[A-Z])';
    var regex2 = RegExp(patternOneUppercase);

    if (regex2.hasMatch(value)) {
      return 'Password contains 1 Uppercase Characters';
    } else {
      return null;
    }
  }

  String passwordValidationNumericChracter(String value) {
    var patternOneDigit = r'^(?=.*?[0-9])';
    var regex2 = RegExp(patternOneDigit);

    if (regex2.hasMatch(value)) {
      return 'Password contains 1 Numeric Characters';
    } else {
      return null;
    }
  }

  String emailValidation(String value) {
    var pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r'{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]'
        r'{0,253}[a-zA-Z0-9])?)*$';
    var regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      emailValidate.value = false;
      update();
      // checkLogin();
      return 'Email is not Valid';
    } else {
      emailValidate.value = true;
      update();
      // checkLogin();
      return 'Email is valid';
    }
  }

  @override
  void onClose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }

  bool checkLogin() {
    print('password ${passwordValidate.value}');

    print('email ${emailValidate.value}');
    if (passwordValidate.value == true && emailValidate.value == true) {
      validated.value = true;
    } else {
      validated.value = false;
    }
    update();
    return validated.value;
  }
}
