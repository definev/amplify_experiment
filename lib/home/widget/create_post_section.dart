import 'package:amplify_experiment/home/controller/create_post_controller.dart';
import 'package:amplify_experiment/home/controller/home_controller.dart';
import 'package:amplify_experiment/models/Post.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final postContentControllerProvider =
    Provider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

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

class CreatePostSection extends ConsumerWidget {
  const CreatePostSection({
    Key? key,
    required this.openSection,
  }) : super(key: key);

  final VoidCallback openSection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textController = ref.watch(postContentControllerProvider);

    return SizedBox(
      height: 120,
      width: double.maxFinite,
      child: Column(
        children: [
          Flexible(
            flex: 5,
            child: Stack(
              children: [
                TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: 'What\'s on your mind?',
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  maxLines: 10,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    style: theme.textButtonTheme.style!.copyWith(
                      shape: MaterialStateProperty.all(const StadiumBorder()),
                    ),
                    onPressed: openSection,
                    child: const Icon(Icons.expand),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: theme.colorScheme.surfaceTint.withOpacity(0.3),
                  ),
                ),
                color: Colors.transparent,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Flexible(
                    child: PostActionButton(
                      icon: Icons.image,
                      title: 'Gallery',
                    ),
                  ),
                  Flexible(
                    child: PostActionButton(
                      icon: Icons.mic,
                      title: 'Voice',
                    ),
                  ),
                  Flexible(
                    child: PostActionButton(
                      icon: Icons.camera_alt,
                      title: 'Camera',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PostActionButton extends StatelessWidget {
  const PostActionButton({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20),
          const Gap(16),
          Text(
            title,
            style: theme.textTheme.button!.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class CreatePostView extends ConsumerWidget {
  const CreatePostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = ref.watch(postContentControllerProvider);
    final controller = ref.watch(createPostControllerProvider);
    final homeState = ref.watch(homeControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 5,
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: 'What\'s on your mind?',
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                maxLines: null,
                expands: true,
              ),
            ),
            const Flexible(
              child: SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () => controller.createPost(
                  Post(
                    userID: homeState.asData!.value.authUser.userId,
                    content: textController.text,
                  ),
                ),
                child: const Text('Post'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
