import 'package:amplify_experiment/models/Post.dart';
import 'package:amplify_experiment/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _userNamePostProvider = FutureProvider.family<String?, String>(
  (ref, arg) async {
    final repository = ref.read(userRepositoryProvider);

    final user = await repository.getUserById(arg);

    return user?.username;
  },
);

class PostCard extends ConsumerWidget {
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final userName = ref.read(_userNamePostProvider(post.userID));

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2),
      shape: const RoundedRectangleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            userName.map(
              data: (data) => Text(
                data.value == null ? 'Something wrong' : data.value!,
                style: theme.textTheme.bodySmall!.copyWith(
                  decoration: TextDecoration.underline,
                  color: theme.colorScheme.secondary,
                ),
              ),
              error: (_) => const Text('Error'),
              loading: (_) => const Text('Loading ...'),
            ),
            Text(
              post.content,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
