import 'package:amplify_experiment/home/model/app_auth_user.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'home_repository.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return RemoteHomeRepository();
});

class RemoteHomeRepository extends HomeRepository {
  @override
  Future<AppAuthUser> getCurrentUser() async {
    final user = await Amplify.Auth.getCurrentUser();
    return user.toAppAuthUser();
  }
}
