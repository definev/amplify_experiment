import 'package:amplify_experiment/register/model/states/sign_in_state.dart';
import 'package:amplify_experiment/register/repository/register_repository.dart';
import 'package:amplify_experiment/register/service/add_user_model_service.dart';
import 'package:amplify_experiment/register/service/notif_register_service.dart';
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
  ]) : super(state) {
    _getDependencies(ref);
  }

  final Ref ref;
  late final RegisterRepository _repository;

  void _getDependencies(Ref ref) {
    _repository = ref.read(registerRepositoryProvider);
  }

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
      final result = await _repository.signIn<SignInResult>(
        state.email!,
        state.password!,
      );

      if (result.isSignedIn) {
        await NotifRegisterService(ref).run();
        await AddUserModelService(ref, state.email!).run();
      }
    } catch (e) {
      sm.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  void pushSignUpView(BuildContext context) {
    final nav = Navigator.of(context);
    nav.push(
      MaterialPageRoute(
        builder: (_) => const SignUpView(),
      ),
    );
  }
}
