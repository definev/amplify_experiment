import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class DependenciesStateNotifier<T> extends StateNotifier<T>
    with DependenciesMixin {
  DependenciesStateNotifier(this.ref, super.state) {
    getDependencies();
  }

  final Ref ref;
}

mixin DependenciesMixin {
  @protected
  void getDependencies();
}
