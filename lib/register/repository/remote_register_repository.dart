import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_experiment/register/repository/register_repository.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class RemoteRegisterRepository implements RegisterRepository {
  @override
  Future<T> confirmSignUp<T>(String username, String confirmationCode) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: username,
        confirmationCode: confirmationCode,
      );
      return result as T;
    } on AuthException catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<bool> isSignedIn() async {
    final result = await Amplify.Auth.fetchAuthSession();
    return result.isSignedIn;
  }

  @override
  Future<T> signIn<T>(String username, String password) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );

      return result as T;
    } on AuthException catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<T> signUp<T>(String username, String password) async {
    try {
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.email: username,
        // additional attributes as needed
      };
      final result = await Amplify.Auth.signUp(
        username: username,
        password: password,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );

      return result as T;
    } on AuthException catch (e) {
      return Future.error(e);
    }
  }
}
