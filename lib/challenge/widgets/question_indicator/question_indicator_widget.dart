import 'package:flutter/material.dart';
import 'package:nlw_quiz/core/core.dart';
import 'package:nlw_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatefulWidget {
  final int currentQuestion;
  final int total;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentQuestion,
    required this.total,
  }) : super(key: key);

  @override
  _QuestionIndicatorWidgetState createState() =>
      _QuestionIndicatorWidgetState();
}

class _QuestionIndicatorWidgetState extends State<QuestionIndicatorWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant QuestionIndicatorWidget oldWidget) {
    _initAnimation(
      from: oldWidget.currentQuestion / widget.total,
      to: widget.currentQuestion / widget.total,
    );
    super.didUpdateWidget(oldWidget);
  }

  void _initAnimation({double from = 0, double to = 0}) {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween<double>(begin: from, end: to).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Questão ${widget.currentQuestion + 1}',
                  style: AppTextStyles.body),
              Text('de ${widget.total}', style: AppTextStyles.body),
            ],
          ),
          SizedBox(height: 16),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, _) =>
                ProgressIndicatorWidget(value: _animation.value),
          ),
        ],
      ),
    );
  }
}
