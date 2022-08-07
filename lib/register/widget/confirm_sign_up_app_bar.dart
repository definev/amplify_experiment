import 'package:flutter/material.dart';

class ConfirmSignUpAppBar extends StatelessWidget with PreferredSizeWidget {
  const ConfirmSignUpAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: const Text('Confirm sign up'));
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
