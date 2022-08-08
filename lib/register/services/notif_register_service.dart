import 'package:amplify_experiment/_internal/service.dart';
import 'package:amplify_experiment/register/controller/register_controller.dart';

class NotifRegisterLogicService extends RefRequireService<void> {
  const NotifRegisterLogicService(super.ref);

  @override
  Future<void> run() async {
    ref.read(registerControllerProvider.notifier).loadRegisterState();
  }
}
