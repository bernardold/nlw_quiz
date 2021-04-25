import 'package:flutter/material.dart';
import 'package:nlw_quiz/challenge/widgets/answer/answer_widget.dart';
import 'package:nlw_quiz/core/core.dart';
import 'package:nlw_quiz/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizWidget({Key? key, required this.question, required this.onSelected})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 64),
          Text(widget.question.title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          for (var i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
                answer: widget.question.answers[i],
                isSelected: i == selectedIndex,
                disabled: selectedIndex != null,
                onTap: (isCorrect) {
                  selectedIndex = i;
                  widget.onSelected(isCorrect);
                  setState(() {});
                }),
        ],
      ),
    );
  }
}
