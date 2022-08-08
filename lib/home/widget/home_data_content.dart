import 'package:amplify_experiment/home/model/states/home_state.dart';
import 'package:amplify_experiment/post/widget/create_post.dart';
import 'package:amplify_experiment/post/widget/post_feed.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomeDataContent extends StatelessWidget {
  const HomeDataContent(AsyncData<HomeState> data, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MultiSliver(
          children: const [
            CreatePost(),
            PostFeed(),
          ],
        ),
      ],
    );
  }
}
