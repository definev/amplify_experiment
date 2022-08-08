import 'package:amplify_experiment/_internal/logic_service.dart';
import 'package:amplify_experiment/register/controller/register_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotifRegisterLogicService implements LogicService<void> {
  const NotifRegisterLogicService(this.ref);

  final Ref ref;

  @override
  Future<void> run() async {
    ref.read(registerControllerProvider.notifier).loadRegisterState();
  }
}
