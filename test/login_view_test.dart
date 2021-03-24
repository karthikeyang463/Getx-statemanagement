import 'package:flutter/material.dart';
import 'package:flutter_getx2/controller/login_controller.dart';
import 'package:flutter_getx2/main.dart';
import 'package:flutter_getx2/view/login_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('Test to see the GetmaterialApp is there',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byType(GetMaterialApp), findsWidgets);
  });
  testWidgets('Test to see the Column is there', (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(home: LoginView()));
    expect(find.byType(Column), findsWidgets);
  });
  testWidgets('Test to see the TextFormField is there',
      (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(home: LoginView()));
    expect(find.byType(TextFormField), findsWidgets);
  });

  testWidgets('login page Contains 2 input fields and 1 button',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(home: LoginView()),
    );

    final inputTextFieldsCounts = find.byType(TextFormField);
    final inputButtonCounts = find.byType(MaterialButton);

    expect(inputTextFieldsCounts, findsNWidgets(2));
    expect(inputButtonCounts, findsNWidgets(1));
  });

  group('Email Validator', () {
    final controller = LoginController();

    test('Email validation', () {
      expect(controller.emailValidation('karthik'), 'Email is not Valid');
      expect(controller.emailValidation('karthik@gmail.com'), 'Email is valid');
    });
  });

  group('password Validator', () {
    final controller = LoginController();

    test('Password Validation', () {
      expect(controller.passwordValidationChracters('karthi'),
          'Password contains minimum 6 chracters');
      expect(controller.passwordValidationSpecial('karthik@'),
          'Password contains 1 Special Characters');
      expect(controller.passwordValidationUppercase('karthikG@'),
          'Password contains 1 Uppercase Characters');
      expect(controller.passwordValidationNumericChracter('karthikG@2'),
          'Password contains 1 Numeric Characters');
    });
  });
}
