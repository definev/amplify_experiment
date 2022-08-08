import 'dart:async';

import 'package:amplify_experiment/_internal/service.dart';
import 'package:amplify_experiment/home/model/app_auth_user.dart';
import 'package:amplify_experiment/home/repository/remote_home_repository.dart';
import 'package:amplify_experiment/user/user_repository.dart';

class AddUserModelService extends RefRequireService<void> {
  AddUserModelService(super.ref, this.email);

  final String email;

  @override
  Future<void> run() async {
    final userRepository = ref.read(userRepositoryProvider);
    final homeRepository = ref.read(homeRepositoryProvider);
    final authUser = await homeRepository.getCurrentUser();
    final user = await userRepository.getUserById(authUser.userId);

    if (user == null) {
      await userRepository.createUser(AppAuthUser(authUser.userId, email));
    }
  }
}
