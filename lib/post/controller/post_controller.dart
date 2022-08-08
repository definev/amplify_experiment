import 'package:amplify_experiment/_internal/dependencies_state_notifier.dart';
import 'package:amplify_experiment/models/Post.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostController extends DependenciesStateNotifier<List<Post>> {
  PostController(Ref ref) : super(ref, []);

  @override
  void getDependencies() {}
}
