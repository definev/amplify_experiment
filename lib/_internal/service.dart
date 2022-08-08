import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class LogicService<T> {
  FutureOr<T> run();
}

abstract class RefRequireService<T> {
  const RefRequireService(this.ref);
  final Ref ref;

  FutureOr<T> run();
}
