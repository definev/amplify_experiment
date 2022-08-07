import 'package:flutter/material.dart';

class SignInAppBar extends StatelessWidget with PreferredSizeWidget {
  const SignInAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: const Text('Register'));
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
