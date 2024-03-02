import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview_helper/features/menu/bloc/menu_bloc.dart';
import 'package:flutter_interview_helper/features/menu/screen/widget/menu_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuBloc()..add(InitMenu()),
      child: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          return Scaffold(
            body: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 10,
              itemBuilder: (_, index) {
                return MenuWidget(question: state.questions?[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
