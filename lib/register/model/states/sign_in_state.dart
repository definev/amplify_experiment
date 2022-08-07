import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    String? email,
    String? password,
  }) = _SignInState;
}

extension SignInExt on SignInState {
  bool get isValid => email != null && password != null;
}
