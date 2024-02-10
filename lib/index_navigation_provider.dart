import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndexNavigationProvider extends StateNotifier<int> {
  IndexNavigationProvider() : super(0);

  void navigate(int page) {
    state = page;
  }
}

final indexNavigationProvider =
    StateNotifierProvider<IndexNavigationProvider, int>(
  (ref) => IndexNavigationProvider(),
);
