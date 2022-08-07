import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(AuthUser authUser) = _HomeState;
}
