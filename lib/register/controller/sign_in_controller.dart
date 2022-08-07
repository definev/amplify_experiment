import 'package:amplify_experiment/register/model/states/sign_in_state.dart';
import 'package:amplify_experiment/register/controller/register_controller.dart';
import 'package:amplify_experiment/register/view/sign_up_view.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signInControllerProvider =
    StateNotifierProvider<SignInController, SignInState>(
  (ref) => SignInController(ref),
);

class SignInController extends StateNotifier<SignInState> {
  SignInController(
    this.ref, [
    SignInState state = const SignInState(
      email: null,
      password: null,
    ),
  ]) : super(state);

  final Ref ref;

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void signIn(BuildContext context) async {
    final sm = ScaffoldMessenger.of(context);
    if (!state.isValid) {
      sm.showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    try {
      final result = await Amplify.Auth.signIn(
        username: state.email!,
        password: state.password!,
      );

      if (result.isSignedIn) {
        await ref.read(registerControllerProvider.notifier).loadRegisterState();
      }
    } catch (e) {
      sm.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  void signUp(BuildContext context) {
    final nav = Navigator.of(context);
    nav.push(
      MaterialPageRoute(
        builder: (_) => const SignUpView(),
      ),
    );
  }
}
