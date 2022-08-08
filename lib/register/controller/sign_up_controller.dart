import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_experiment/_internal/dependencies_state_notifier.dart';
import 'package:amplify_experiment/home/view/home_view.dart';
import 'package:amplify_experiment/register/model/states/sign_up_state.dart';
import 'package:amplify_experiment/register/repository/register_repository.dart';
import 'package:amplify_experiment/register/view/confirm_sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signUpControllerProvider =
    StateNotifierProvider<SignUpController, SignUpState>(
  (ref) => SignUpController(ref),
);

class SignUpController extends DependenciesStateNotifier<SignUpState> {
  SignUpController(
    Ref ref, [
    SignUpState state = const SignUpState(
      email: null,
      password: null,
      confirmPassword: null,
    ),
  ]) : super(ref, state);

  late final RegisterRepository _repository;

  @override
  void getDependencies() {
    _repository = ref.read(registerRepositoryProvider);
  }

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
      final result = await _repository.signUp<SignUpResult>(
        state.email!,
        state.password!,
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
      final result =
          await _repository.confirmSignUp<SignUpResult>(state.email!, value);
      if (result.isSignUpComplete) {
        final result = await _repository.signIn<SignInResult>(
          state.email!,
          state.password!,
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
