import 'package:amplify_experiment/register/widget/sign_in_app_bar.dart';
import 'package:amplify_experiment/register/widget/sign_in_content.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SignInAppBar(),
      body: SignInContent(),
    );
  }
}
