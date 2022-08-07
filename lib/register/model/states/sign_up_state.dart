import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    String? email,
    String? password,
    String? confirmPassword,
  }) = _SignUpState;
}

extension SignUpExt on SignUpState {
  bool get isValid =>
      email != null &&
      password != null &&
      confirmPassword != null &&
      password == confirmPassword;
}
