import 'package:amplify_experiment/post/controller/create_post_controller.dart';
import 'package:amplify_experiment/post/widget/create_post_section.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreatePostView extends ConsumerWidget {
  const CreatePostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = ref.watch(postContentControllerProvider);
    final controller = ref.watch(createPostControllerProvider);

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
                onPressed: () => controller.createPost(textController.text),
                child: const Text('Post'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
