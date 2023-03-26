import 'package:bloc/bloc.dart';

class Counter extends Cubit<int> {
  Counter({this.initialdata = 0}) : super(initialdata);
  int initialdata;
  int? current;
  int? next;

  void tambahData() {
    if (state != 10) {
      emit(state + 1);
    }
  }

  void kurangData() {
    if (state != 0) {
      emit(state - 1);
    }
  }

  @override
  void onChange(Change<int> change) {
    current = change.currentState;
    next = change.nextState;
    super.onChange(change);
  }
}
