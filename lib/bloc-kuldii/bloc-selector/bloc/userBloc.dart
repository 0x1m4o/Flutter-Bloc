import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Cubit<Map<String, dynamic>> {
  UserBloc() : super({'name': '', 'age': 0});

  void newUser(String name) {
    emit({'name': name, 'age': state['age']});
  }

  void newAge(int age) {
    if (age >= 0 && age <= 10) {
      emit({'name': state['name'], 'age': age});
    }
  }
}
