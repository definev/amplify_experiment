import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class DependenciesStateNotifier<T> extends StateNotifier<T> {
  DependenciesStateNotifier(
    this.ref,
    super.state,
  ) {
    getDependencies();
  }

  final Ref ref;

  @protected
  void getDependencies();
}
