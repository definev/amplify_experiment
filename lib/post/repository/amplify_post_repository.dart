import 'package:amplify_experiment/models/ModelProvider.dart';
import 'package:amplify_experiment/models/Post.dart';
import 'package:amplify_experiment/post/repository/post_repository.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class AmplifyPostRepository implements PostRepository {
  @override
  Future<void> createPost(String userID, String content) async {
    final post = Post(
      userID: userID,
      content: content,
    );

    await Amplify.DataStore.save<Post>(post);
  }

  @override
  Future<void> deletePost(String id) async {
    final post = await getPost(id);
    if (post == null) return;
    await Amplify.DataStore.delete<Post>(post);
  }

  @override
  Future<Post?> getPost(String id) async {
    final posts = await Amplify.DataStore.query(
      Post.classType,
      where: Post.ID.eq(id),
    );
    if (posts.isEmpty) return null;
    return posts.first;
  }

  @override
  Future<List<Post>> getPosts(int page) async {
    final posts = await Amplify.DataStore.query(
      Post.classType,
      pagination: QueryPagination(page: page),
    );

    return posts;
  }
}
