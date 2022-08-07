import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl();
});
