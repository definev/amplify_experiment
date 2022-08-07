import 'package:amplify_experiment/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final createPostControllerProvider = Provider<CreatePostController>((ref) {
  return CreatePostController();
});

class CreatePostController {
  Future<void> createPost(Post post) async {}
}
