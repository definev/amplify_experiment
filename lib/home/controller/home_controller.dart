import 'dart:developer';

import 'package:amplify_experiment/_internal/dependencies_state_notifier.dart';
import 'package:amplify_experiment/home/model/states/home_state.dart';
import 'package:amplify_experiment/home/repository/home_repository.dart';
import 'package:amplify_experiment/home/repository/remote_home_repository.dart';
import 'package:amplify_experiment/register/repository/register_repository.dart';
import 'package:amplify_experiment/register/view/register_view.dart';
import 'package:amplify_experiment/user/user_repository.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
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
    _userRepository = ref.read(userRepositoryProvider);
  }

  late final HomeRepository _repository;
  late final UserRepository _userRepository;

  void _init() async {
    try {
      final authUser = await _repository.getCurrentUser();
      final pingUser = await _userRepository.getUserById(authUser.userId);
      if (pingUser == null) {
        await _userRepository.createUser(authUser);
      }
      state = AsyncValue.data(HomeState(authUser));
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }

  void signOut(BuildContext context) async {
    final nav = Navigator.of(context);

    try {
      await _repository.logout<SignOutResult>();
      nav.pushReplacement(
        MaterialPageRoute(
          builder: (_) => const RegisterView(),
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  void deleteUser(BuildContext context) async {
    final nav = Navigator.of(context);

    try {
      await _repository.logout<SignOutResult>();
      await _userRepository.deleteUser(state.value!.authUser);
      nav.pushReplacement(
        MaterialPageRoute(
          builder: (_) => const RegisterView(),
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
