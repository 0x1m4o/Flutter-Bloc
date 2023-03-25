import 'package:bloc/bloc.dart';

class Counter extends Cubit<int> {
  Counter({this.initialData = 0}) : super(initialData);

  int initialData;

  int? current;
  int? next;

  void removeData() {
    if (state != 0) {
      emit(state - 1);
    }
  }

  void addData() {
    emit(state + 1);
  }

  @override
  void onChange(Change<int> change) {
    print(change);
    current = change.currentState;
    next = change.nextState;
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    super.onError(error, stackTrace);
  }
}
