part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final Username username;
  final bool isValid;
  final String email;
  final Password password;
  final FormStatus formStatus;

  const RegisterFormState({
    this.isValid = false,
    this.formStatus = FormStatus.invalid,
    this.username = const Username.pure(),
    this.email = '',
    this.password = const Password.pure(),
  });

  RegisterFormState copyWith(
      {bool? isValid,
      Username? username,
      String? email,
      Password? password,
      FormStatus? formStatus}) {
    return RegisterFormState(
      isValid: isValid ?? this.isValid,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object> get props => [
        isValid,
        username,
        email,
        password,
        formStatus,
      ];
}
