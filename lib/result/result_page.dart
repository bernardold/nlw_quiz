import 'package:flutter/material.dart';
import 'package:nlw_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:nlw_quiz/core/core.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String challengeName;
  final int correctAnswers;
  final int totalQuestions;

  const ResultPage({
    Key? key,
    required this.challengeName,
    required this.correctAnswers,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shareMsg = 'DezQuiz\n Acabei de terminar o quiz $challengeName e ' +
        'acertei $correctAnswers de $totalQuestions perguntas';

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 68, right: 68, top: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text('Parabéns!', style: AppTextStyles.heading40),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    text: 'Você concluiu\n',
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                          text: challengeName, style: AppTextStyles.bodyBold),
                      TextSpan(
                          text:
                              '\ncom $correctAnswers de $totalQuestions acertos.',
                          style: AppTextStyles.body)
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(children: [
                  Expanded(
                    child: NextButtonWidget.primaryPurple(
                      label: 'Compartilhar',
                      onTap: () => Share.share(shareMsg),
                    ),
                  )
                ]),
                SizedBox(height: 24),
                Row(children: [
                  Expanded(
                    child: NextButtonWidget.ghost(
                      label: 'Voltar ao início',
                      onTap: () => Navigator.pop(context),
                    ),
                  )
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
