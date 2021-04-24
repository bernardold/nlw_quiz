import 'package:flutter/material.dart';
import 'package:nlw_quiz/core/core.dart';
import 'package:nlw_quiz/shared/models/quiz_model.dart';
import 'package:nlw_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz;

  final VoidCallback onTap;

  const QuizCardWidget({Key? key, required this.quiz, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double progress = quiz.questionsAnswered / quiz.questions.length;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(BorderSide(color: AppColors.border))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(child: Image.asset(quiz.image.toAppImage)),
            SizedBox(height: 24),
            Text(quiz.title, style: AppTextStyles.heading15),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    '${quiz.questionsAnswered} de ${quiz.questions.length}',
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ProgressIndicatorWidget(value: progress),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
