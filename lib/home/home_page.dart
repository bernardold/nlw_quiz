import 'package:flutter/material.dart';
import 'package:nlw_quiz/core/core.dart';
import 'package:nlw_quiz/home/home_controller.dart';
import 'package:nlw_quiz/home/home_state.dart';
import 'package:nlw_quiz/home/widgets/app_bar/app_bar_widget.dart';
import 'package:nlw_quiz/home/widgets/level_button/level_button_widget.dart';
import 'package:nlw_quiz/home/widgets/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.getUser();
    controller.getQuizzes();

    controller.stateNotifier.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    // Loading
    if (controller.state == HomeState.loading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }

    // TODO: Error
    if (controller.state == HomeState.error) {
      return Scaffold(
        body: Container(),
      );
    }

    return Scaffold(
      appBar: AppBarWidget(user: controller.user!),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(label: 'Fácil'),
                LevelButtonWidget(label: 'Médio'),
                LevelButtonWidget(label: 'Difícil'),
                LevelButtonWidget(label: 'Perito'),
              ],
            ),
            SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: controller.quizzes
                    .map((e) => QuizCardWidget(quiz: e))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
