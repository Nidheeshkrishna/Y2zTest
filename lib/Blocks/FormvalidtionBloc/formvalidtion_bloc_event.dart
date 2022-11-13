import 'package:equatable/equatable.dart' show Equatable;

class EmailChanged extends MyFormEvent {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class EmailUnfocused extends MyFormEvent {}

class FormSubmitted extends MyFormEvent {}

abstract class MyFormEvent extends Equatable {
  const MyFormEvent();

  @override
  List<Object> get props => [];
}

class PasswordChanged extends MyFormEvent {
  final String password;

  const PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class PasswordUnfocused extends MyFormEvent {}
