import 'package:amplify_experiment/home/view/home_view.dart';
import 'package:amplify_experiment/register/model/states/register_state.dart';
import 'package:amplify_experiment/register/controller/register_controller.dart';
import 'package:amplify_experiment/register/view/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterView extends ConsumerWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerControllerProvider);
    ref.listen<RegisterState>(
      registerControllerProvider,
      (previous, next) async {
        final nav = Navigator.of(context);
        next.mapOrNull(
          signedIn: (value) async {
            await Future.delayed(const Duration(milliseconds: 1000));
            return nav.pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ),
            );
          },
        );
      },
    );

    return state.map(
      signedIn: (_) => const Scaffold(
        body: Center(child: FlutterLogo()),
      ),
      notSignedIn: (_) => const SignInView(),
      loading: (_) =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
