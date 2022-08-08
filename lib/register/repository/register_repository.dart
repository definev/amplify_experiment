import 'package:amplify_experiment/register/repository/remote_register_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registerRepositoryProvider = Provider<RegisterRepository>((ref) {
  return RemoteRegisterRepository();
});

abstract class RegisterRepository {
  Future<bool> isSignedIn();

  Future<T> signIn<T>(String username, String password);

  Future<T> signUp<T>(String username, String password);

  Future<T> confirmSignUp<T>(String username, String confirmationCode);
}
