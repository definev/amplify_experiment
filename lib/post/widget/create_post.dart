import 'package:amplify_experiment/post/view/create_post_view.dart';
import 'package:amplify_experiment/post/widget/create_post_section.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OpenContainer(
      openBuilder: (context, action) => const CreatePostView(),
      closedBuilder: (context, action) => TextButtonTheme(
        data: TextButtonThemeData(
          style: theme.textButtonTheme.style!.copyWith(
            shape: MaterialStateProperty.all(const RoundedRectangleBorder()),
          ),
        ),
        child: CreatePostSection(openSection: action),
      ),
      closedColor: theme.colorScheme.surfaceVariant,
      openColor: theme.scaffoldBackgroundColor,
      middleColor: theme.scaffoldBackgroundColor,
    );
  }
}
