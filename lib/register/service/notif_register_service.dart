import 'package:amplify_experiment/_internal/service.dart';
import 'package:amplify_experiment/register/controller/register_controller.dart';

class NotifRegisterService extends RefRequireService<void> {
  const NotifRegisterService(super.ref);

  @override
  Future<void> run() async {
    ref.read(registerControllerProvider.notifier).loadRegisterState();
  }
}
