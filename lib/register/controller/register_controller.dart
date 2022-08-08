import 'package:amplify_experiment/_internal/dependencies_state_notifier.dart';
import 'package:amplify_experiment/register/model/states/register_state.dart';
import 'package:amplify_experiment/register/repository/register_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registerControllerProvider =
    StateNotifierProvider.autoDispose<RegisterController, RegisterState>(
  (ref) => RegisterController(ref),
);

class RegisterController extends DependenciesStateNotifier<RegisterState> {
  RegisterController(Ref ref) : super(ref, const RegisterState.loading()) {
    _loadAmplifyConfiguration();
  }

  late final RegisterRepository _repository;

  @override
  void getDependencies() {
    _repository = ref.read(registerRepositoryProvider);
  }

  Future<void> _loadAmplifyConfiguration() async {
    await loadRegisterState();
  }

  Future<void> loadRegisterState() async {
    try {
      final signIn = await _repository.isSignedIn();
      if (!signIn) {
        state = const RegisterState.notSignedIn();
        return;
      }
      state = RegisterState.signedIn();
    } catch (e) {
      state = const RegisterState.notSignedIn();
    }
  }
}
