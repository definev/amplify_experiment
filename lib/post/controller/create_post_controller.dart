import 'package:amplify_experiment/_internal/dependencies_state_notifier.dart';
import 'package:amplify_experiment/post/repository/post_repository.dart';
import 'package:amplify_experiment/post/service/get_user_id_service.dart';
import 'package:amplify_experiment/post/service/refresh_post_feed_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final createPostControllerProvider = Provider<CreatePostController>((ref) {
  return CreatePostController(ref);
});

class CreatePostController with DependenciesMixin {
  CreatePostController(this.ref) {
    getDependencies();
  }

  final Ref ref;

  /// ---Repository---
  @override
  void getDependencies() {
    _repository = ref.read(postRepositoryProvider);
  }

  late final PostRepository _repository;

  /// ---Services---
  late final getUserIdService = UserIdService(ref);

  Future<void> createPost(BuildContext context, String content) async {
    final sm = ScaffoldMessenger.of(context);
    final nav = Navigator.of(context);

    try {
      final userId = getUserIdService.run();
      await _repository.createPost(userId, content);
      LoadMorePostFeedService(ref).run();
      nav.pop();
    } catch (e) {
      sm.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
}
