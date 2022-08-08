import 'package:amplify_flutter/amplify_flutter.dart';

class AppAuthUser {
  const AppAuthUser(this.userId, this.username);

  final String userId;
  final String username;
}

extension AmplifyExt on AuthUser {
  AppAuthUser toAppAuthUser() {
    return AppAuthUser(userId, username);
  }
}
