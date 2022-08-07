import 'package:amplify_experiment/register/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';

class ConfirmSignUpBody extends HookConsumerWidget {
  const ConfirmSignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinCode = useState<String>('');
    final controller = ref.watch(signUpControllerProvider.notifier);

    return Column(
      children: [
        Pinput(
          length: 6,
          onChanged: (text) => pinCode.value = text,
        ),
        const Gap(16),
        ElevatedButton(
          onPressed: () => controller.confirmSignUp(context, pinCode.value),
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
