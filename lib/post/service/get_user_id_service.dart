import 'package:amplify_experiment/_internal/service.dart';
import 'package:amplify_experiment/home/controller/home_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserIdService extends RefRequireService<String> {
  UserIdService(super.ref);

  @override
  String run() {
    final homeState = ref.watch(homeControllerProvider);
    return homeState.asData!.value.authUser.userId;
  }
}
