import 'package:amplify_experiment/home/model/app_auth_user.dart';

abstract class HomeRepository {
  Future<AppAuthUser> getCurrentUser();
}
