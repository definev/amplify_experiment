import 'package:amplify_experiment/models/Post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_feed_state.freezed.dart';

@freezed
class PostFeedState with _$PostFeedState {
  const factory PostFeedState({
    required Set<Post> posts,
    required int page,
    required bool isLoading,
  }) = _PostFeedState;
}
