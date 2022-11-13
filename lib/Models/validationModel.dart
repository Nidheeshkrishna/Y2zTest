import 'package:formz/formz.dart';

class Email extends FormzInput<String, EmailValidationError> {
  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  const Email.dirty([super.value = '']) : super.dirty();

  const Email.pure([super.value = '']) : super.pure();

  @override
  EmailValidationError? validator(String? value) {
    return _emailRegex.hasMatch(value ?? '')
        ? null
        : EmailValidationError.invalid;
  }
}

enum EmailValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  static final _passwordRegex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{3,}$');
  const Password.dirty([super.value = '']) : super.dirty();

  const Password.pure([super.value = '']) : super.pure();

  @override
  PasswordValidationError? validator(String? value) {
    return _passwordRegex.hasMatch(value ?? '')
        ? null
        : PasswordValidationError.invalid;
  }
}

enum PasswordValidationError { invalid }
