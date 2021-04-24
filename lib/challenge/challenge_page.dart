import 'package:flutter/material.dart';
import 'package:nlw_quiz/challenge/challenge_controller.dart';
import 'package:nlw_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:nlw_quiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:nlw_quiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:nlw_quiz/shared/models/quiz_model.dart';

class ChallengePage extends StatefulWidget {
  final QuizModel quiz;

  const ChallengePage({Key? key, required this.quiz}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(
      () => controller.currentQuestion = pageController.page!.toInt(),
    );
    super.initState();
  }

  bool lastQuestion() =>
      controller.currentQuestion == widget.quiz.questions.length - 1;

  void _nextPage() {
    if (lastQuestion()) {
      return;
    }

    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentQuestionNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentQuestion: value,
                  total: widget.quiz.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: widget.quiz.questions
              .map((e) => QuizWidget(
                  question: e,
                  onSelected: () => Future.delayed(Duration(milliseconds: 300))
                      .then((_) => _nextPage())))
              .toList()),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentQuestionNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // TODO: arrumar os dois botoes na tela da ultima pergunta
                lastQuestion()
                    ? Expanded(
                        child: NextButtonWidget.primary(
                        label: 'Finalizar',
                        onTap: () => Navigator.pop(context),
                      ))
                    : Expanded(
                        child: NextButtonWidget.secondary(
                        label: 'Pular',
                        onTap: _nextPage,
                      ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
