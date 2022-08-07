import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_experiment/amplifyconfiguration.dart';
import 'package:amplify_experiment/app.dart';
import 'package:amplify_experiment/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Amplify.addPlugins(
    [
      AmplifyDataStore(modelProvider: ModelProvider.instance),
      AmplifyAuthCognito(),
    ],
  );
  await Amplify.configure(amplifyconfig);

  runApp(const ProviderScope(child: AmplifyApp()));
}
