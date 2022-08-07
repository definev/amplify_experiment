import 'package:amplify_experiment/home/model/states/home_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeErrorContent extends StatelessWidget {
  const HomeErrorContent(this.data, {super.key});

  final AsyncError<HomeState> data;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Error: ${data.error}'));
  }
}
