import 'package:amplify_experiment/register/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SignUpAppBar(),
      body: SignUpBody(),
    );
  }
}

class SignUpAppBar extends StatelessWidget with PreferredSizeWidget {
  const SignUpAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Sign Up'),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class SignUpBody extends ConsumerWidget {
  const SignUpBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(signUpControllerProvider.notifier);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
          onChanged: (email) => controller.setEmail(email),
        ),
        const Gap(8),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Password',
          ),
          onChanged: (password) => controller.setPassword(password),
          obscureText: true,
        ),
        const Gap(8),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Confirm Password',
          ),
          onChanged: (password) => controller.setConfirmPassword(password),
          obscureText: true,
        ),
        const Gap(16),
        ElevatedButton(
          onPressed: () => controller.signUp(context),
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}
