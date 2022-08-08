import 'package:amplify_experiment/_internal/dependencies_state_notifier.dart';
import 'package:amplify_experiment/home/model/states/home_state.dart';
import 'package:amplify_experiment/home/repository/home_repository.dart';
import 'package:amplify_experiment/home/repository/remote_home_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, AsyncValue<HomeState>>(
  (ref) => HomeController(ref, const AsyncValue.loading()),
);

class HomeController extends DependenciesStateNotifier<AsyncValue<HomeState>> {
  HomeController(Ref ref, AsyncValue<HomeState> state) : super(ref, state) {
    _init();
  }

  @override
  void getDependencies() {
    _repository = ref.read(homeRepositoryProvider);
  }

  late final HomeRepository _repository;

  void _init() async {
    try {
      final authUser = await _repository.getCurrentUser();
      state = AsyncValue.data(HomeState(authUser));
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
