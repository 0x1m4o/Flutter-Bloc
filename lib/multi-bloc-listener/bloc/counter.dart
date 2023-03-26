import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends Cubit<int> {
  Counter() : super(0);

  void addData() {
    if (state != 10) {
      emit(state + 1);
    }
  }

  void removeData() {
    if (state != 0) {
      emit(state - 1);
    }
  }
}
