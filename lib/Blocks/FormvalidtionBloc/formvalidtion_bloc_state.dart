import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../Models/validationModel.dart';

class MyFormState extends Equatable {
  final Email email;

  final Password password;
  final FormzStatus status;
  const MyFormState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  @override
  List<Object> get props => [email, password, status];

  MyFormState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
  }) {
    return MyFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
