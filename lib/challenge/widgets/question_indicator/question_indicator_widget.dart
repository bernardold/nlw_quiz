import 'package:flutter/material.dart';
import 'package:nlw_quiz/core/core.dart';
import 'package:nlw_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentQuestion;
  final int total;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentQuestion,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Questão ${currentQuestion + 1}', style: AppTextStyles.body),
              Text('de $total', style: AppTextStyles.body),
            ],
          ),
          SizedBox(height: 16),
          ProgressIndicatorWidget(value: currentQuestion / total),
        ],
      ),
    );
  }
}
