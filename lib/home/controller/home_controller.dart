import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_experiment/amplifyconfiguration.dart';
import 'package:amplify_experiment/home/model/states/home_state.dart';
import 'package:amplify_experiment/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, AsyncValue<HomeState>>(
  (ref) => HomeController(const AsyncValue.loading()),
);

class HomeController extends StateNotifier<AsyncValue<HomeState>> {
  HomeController(super.state) {
    _init();
  }

  void _init() async {
    try {
      final authUser = await Amplify.Auth.getCurrentUser();
      state = AsyncValue.data(HomeState(authUser));
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
