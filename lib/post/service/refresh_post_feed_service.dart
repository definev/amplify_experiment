import 'package:amplify_experiment/_internal/service.dart';
import 'package:amplify_experiment/post/controller/post_feed_controller.dart';

class LoadMorePostFeedService extends RefRequireService<void> {
  const LoadMorePostFeedService(super.ref);

  @override
  void run() {
    ref.read(postFeedControllerProvider.notifier).loadMore();
  }
}
