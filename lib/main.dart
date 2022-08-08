import 'package:amplify_experiment/_internal/initialize.dart';
import 'package:amplify_experiment/app.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await appInitialize();
  runApp(const ProviderScope(child: AmplifyApp()));
}
