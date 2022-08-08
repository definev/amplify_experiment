import 'package:amplify_experiment/home/model/app_auth_user.dart';
import 'package:amplify_experiment/models/User.dart';
import 'package:amplify_experiment/user/user_repository.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class AmplifyUserRepository extends UserRepository {
  @override
  Future<AppAuthUser?> getUserById(String id) async {
    final users = await Amplify.DataStore.query(
      User.classType,
      where: User.ID.eq(id),
    );

    if (users.isEmpty) return null;
    return AppAuthUser(
      users.first.id,
      users.first.name,
    );
  }
}
