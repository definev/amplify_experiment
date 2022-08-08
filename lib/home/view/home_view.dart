import 'package:amplify_experiment/home/controller/home_controller.dart';
import 'package:amplify_experiment/home/widget/home_data_content.dart';
import 'package:amplify_experiment/home/widget/home_error_content.dart';
import 'package:amplify_experiment/home/widget/home_loading_content.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);

    return Scaffold(
      appBar: const HomeAppBar(),
      body: state.map(
        data: HomeDataContent.new,
        error: HomeErrorContent.new,
        loading: HomeLoadingContent.new,
      ),
    );
  }
}

class HomeAppBar extends ConsumerWidget with PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homeControllerProvider.notifier);

    return AppBar(
      title: const Text('Home'),
      leading: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => controller.deleteUser(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => controller.signOut(context),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
