import 'package:amplify_experiment/_internal/amplify_initialize.dart';
import 'package:flutter/material.dart';

Future<void> appInitialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await amplifyInitialize();
}
