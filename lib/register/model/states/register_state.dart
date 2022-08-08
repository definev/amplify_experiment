import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState.signedIn() = _SignedIn;
  const factory RegisterState.notSignedIn() = _NotSignedIn;
  const factory RegisterState.loading() = _Loading;
}
