import 'package:amplify_experiment/home/model/app_auth_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(AppAuthUser authUser) = _HomeState;
}
