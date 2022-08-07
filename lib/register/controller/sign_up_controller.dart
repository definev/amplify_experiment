import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_experiment/home/view/home_view.dart';
import 'package:amplify_experiment/register/model/states/sign_up_state.dart';
import 'package:amplify_experiment/register/view/confirm_sign_up_view.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signUpControllerProvider =
    StateNotifierProvider<SignUpController, SignUpState>(
  (ref) => SignUpController(),
);

class SignUpController extends StateNotifier<SignUpState> {
  SignUpController([
    SignUpState state = const SignUpState(
      email: null,
      password: null,
      confirmPassword: null,
    ),
  ]) : super(state);

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setConfirmPassword(String confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
  }

  void signUp(BuildContext context) async {
    final sm = ScaffoldMessenger.of(context);
    final nav = Navigator.of(context);
    if (!state.isValid) {
      sm.showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    try {
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.email: state.email!,
        // additional attributes as needed
      };
      final result = await Amplify.Auth.signUp(
        username: state.email!,
        password: state.password!,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );

      if (result.isSignUpComplete) return;
      nav.push(
        MaterialPageRoute(
          builder: (_) => const ConfirmSignUpView(),
        ),
      );
    } on AuthException catch (e) {
      if (e.message == 'An account with the given email already exists.') {
        nav.push(
          MaterialPageRoute(
            builder: (_) => const ConfirmSignUpView(),
          ),
        );
      }
      sm.showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  void confirmSignUp(BuildContext context, String value) async {
    final sm = ScaffoldMessenger.of(context);
    final nav = Navigator.of(context);
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: state.email!,
        confirmationCode: value,
      );
      if (result.isSignUpComplete) {
        final result = await Amplify.Auth.signIn(
          username: state.email!,
          password: state.password!,
        );
        if (result.isSignedIn) {
          nav.push(
            MaterialPageRoute(
              builder: (_) => const HomeView(),
            ),
          );
        }
      }
    } on AuthException catch (e) {
      sm.showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
