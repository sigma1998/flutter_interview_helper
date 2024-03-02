import 'package:flutter/material.dart';
import 'package:flutter_interview_helper/features/detail/screen/detail_screen.dart';
import 'package:flutter_interview_helper/values/models/question_model.dart';

class MenuWidget extends StatefulWidget {
  final QuestionModel? question;

  const MenuWidget({
    super.key,
    required this.question,
  });

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  bool opened = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if ((widget.question?.answer?.length ?? 0) > 200) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(question: widget.question),
            ),
          );
        } else {
          setState(() {
            opened = !opened;
          });
        }
      },
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            widget.question?.question ?? '',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          opened ? const SizedBox(height: 10) : const SizedBox(),
          opened
              ? Text(
                  widget.question?.answer ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.black38,
          )
        ],
      ),
    );
  }
}
