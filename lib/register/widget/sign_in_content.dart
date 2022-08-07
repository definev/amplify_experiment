import 'package:amplify_experiment/register/controller/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInContent extends HookConsumerWidget {
  const SignInContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final controller = ref.watch(signInControllerProvider.notifier);

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
          onChanged: (email) => controller.setEmail(email),
        ),
        const Gap(8),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(
            labelText: 'Password',
          ),
          obscureText: true,
          onChanged: (password) => controller.setPassword(password),
        ),
        const Gap(16),
        ElevatedButton(
          onPressed: () => controller.signIn(context),
          child: const Text('Sign In'),
        ),
        OutlinedButton(
          onPressed: () => controller.signUp(context),
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}
