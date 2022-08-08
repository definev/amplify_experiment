import 'package:amplify_experiment/post/widget/post_action_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final postContentControllerProvider =
    Provider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

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
