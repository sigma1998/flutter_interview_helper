import 'package:bloc/bloc.dart';
import 'package:flutter_interview_helper/service/fire_db.dart';
import 'package:flutter_interview_helper/values/models/question_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_event.dart';

part 'menu_state.dart';

part 'menu_bloc.freezed.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final db = FireDb();

  MenuBloc() : super(const MenuState()) {
    on<InitMenu>((event, emit) async {
      final res = await db.getQuestions();
      emit(state.copyWith(questions: res));
    });
  }
}
