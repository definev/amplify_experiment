import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_experiment/amplifyconfiguration.dart';
import 'package:amplify_experiment/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

Future<void> amplifyInitialize() async {
  await Amplify.addPlugins(
    [
      AmplifyDataStore(modelProvider: ModelProvider.instance),
      AmplifyAuthCognito(),
    ],
  );
  await Amplify.configure(amplifyconfig);
}
