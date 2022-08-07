import 'package:amplify_experiment/register/widget/confirm_sign_up_app_bar.dart';
import 'package:amplify_experiment/register/widget/confirm_sign_up_body.dart';
import 'package:flutter/material.dart';

class ConfirmSignUpView extends StatelessWidget {
  const ConfirmSignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ConfirmSignUpAppBar(),
      body: ConfirmSignUpBody(),
    );
  }
}
