import 'package:amplify_experiment/home/model/app_auth_user.dart';
import 'package:amplify_experiment/user/amplify_user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return AmplifyUserRepository();
});

abstract class UserRepository {
  Future<AppAuthUser?> getUserById(String id);
}
