import 'package:amplify_experiment/home/model/states/home_state.dart';
import 'package:amplify_experiment/home/repository/home_repository.dart';
import 'package:amplify_experiment/home/repository/remote_home_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, AsyncValue<HomeState>>(
  (ref) => HomeController(ref, const AsyncValue.loading()),
);

class HomeController extends StateNotifier<AsyncValue<HomeState>> {
  HomeController(Ref ref, super.state) {
    _init();

    _homeRepository = ref.read(homeRepositoryProvider);
  }

  late final HomeRepository _homeRepository;

  void _init() async {
    try {
      final authUser = await _homeRepository.getCurrentUser();
      state = AsyncValue.data(HomeState(authUser));
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
