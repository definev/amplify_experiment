import 'package:amplify_experiment/_internal/dependencies_state_notifier.dart';
import 'package:amplify_experiment/post/model/states/post_feed_state.dart';
import 'package:amplify_experiment/post/repository/post_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final postFeedControllerProvider =
    StateNotifierProvider<PostFeedController, PostFeedState>((ref) {
  return PostFeedController(ref);
});

class PostFeedController extends DependenciesStateNotifier<PostFeedState> {
  PostFeedController(Ref ref)
      : super(
          ref,
          const PostFeedState(
            posts: {},
            page: -1,
            isLoading: true,
          ),
        ) {
    loadMore();
  }

  /// ---Repository---
  @override
  void getDependencies() {
    _repository = ref.read(postRepositoryProvider);
  }

  late final PostRepository _repository;

  int getCurrentPage() {
    if (state.page == -1) {
      return 0;
    }
    if (state.posts.length == (state.page + 1) * 25) {
      return state.page + 1;
    }

    return state.page;
  }

  Future<void> loadMore() async {
    state = state.copyWith(isLoading: true);
    final currPage = getCurrentPage();
    final newPosts = await _repository.getPosts(currPage);
    if (newPosts.isEmpty) {
      state = state.copyWith(isLoading: false);
      return;
    }

    state = state.copyWith(
      isLoading: false,
      page: currPage,
      posts: {...state.posts, ...newPosts},
    );
  }
}
