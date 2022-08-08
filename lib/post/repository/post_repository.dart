import 'package:amplify_experiment/models/Post.dart';
import 'package:amplify_experiment/post/repository/amplify_post_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final postRepositoryProvider = Provider<PostRepository>((ref) {
  return AmplifyPostRepository();
});

abstract class PostRepository {
  Future<List<Post>> getPosts(int page);

  Future<Post?> getPost(String id);

  Future<void> createPost(String userID, String content);

  Future<void> deletePost(String id);
}
