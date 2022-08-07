import 'package:amplify_experiment/home/model/states/home_state.dart';
import 'package:amplify_experiment/home/widget/create_post_section.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeDataContent extends StatelessWidget {
  const HomeDataContent(AsyncData<HomeState> data, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CreatePost(),
      ],
    );
  }
}
