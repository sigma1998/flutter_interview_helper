part of 'menu_bloc.dart';

@freezed
class MenuState with _$MenuState {
  const factory MenuState({
    List<QuestionModel>? questions,
  }) = _Initial;

  const MenuState._();
}
