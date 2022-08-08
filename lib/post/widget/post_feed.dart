import 'package:amplify_experiment/post/controller/post_feed_controller.dart';
import 'package:amplify_experiment/post/widget/post_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostFeed extends ConsumerWidget {
  const PostFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postFeedControllerProvider);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final posts = state.posts;

          if (index == posts.length) {
            return const SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return PostCard(post: posts.elementAt(index));
        },
        childCount: state.posts.length + (state.isLoading ? 1 : 0),
      ),
    );
  }
}
