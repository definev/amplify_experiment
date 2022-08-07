import 'package:amplify_experiment/home/model/states/home_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeLoadingContent extends StatelessWidget {
  const HomeLoadingContent(AsyncLoading<HomeState> data, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
