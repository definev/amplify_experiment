import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_experiment/amplifyconfiguration.dart';
import 'package:amplify_experiment/register/model/states/register_state.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registerControllerProvider =
    StateNotifierProvider<RegisterController, RegisterState>(
  (ref) => RegisterController(),
);

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController() : super(const RegisterState.loading()) {
    _loadAmplifyConfiguration();
  }

  Future<void> _loadAmplifyConfiguration() async {
    await loadRegisterState();
  }

  Future<void> loadRegisterState() async {
    try {
      final signIn = await isSignedIn;
      if (!signIn) {
        state = const RegisterState.notSignedIn();
      }
      final user = await Amplify.Auth.getCurrentUser();
      state = RegisterState.signedIn(user: user);
    } catch (e) {
      state = const RegisterState.notSignedIn();
    }
  }

  Future<bool> get isSignedIn async {
    final result = await Amplify.Auth.fetchAuthSession();
    return result.isSignedIn;
  }
}
