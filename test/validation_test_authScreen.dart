
import 'package:flutter_test/flutter_test.dart';
import 'package:task/view/AuthScreen.dart';

void main()
{
  test('Full Name Test', () {
    var result  = FullNameValidation.validate('');
    expect( result , 'please enter your full name ');
  });
  test('Email Test', () {
    var result  = EmailValidation.validate(null);
    expect( result , 'please enter the email');
  });
  test('Password Test', () {
    var result  = PasswordValidation.validate(null);
    expect( result , 'you must enter password');
  });
}