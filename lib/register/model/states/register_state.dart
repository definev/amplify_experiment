import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState.signedIn({required AuthUser user}) = _SignedIn;
  const factory RegisterState.notSignedIn() = _NotSignedIn;
  const factory RegisterState.loading() = _Loading;
}
