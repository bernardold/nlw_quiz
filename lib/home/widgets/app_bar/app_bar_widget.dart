import 'package:flutter/material.dart';
import 'package:nlw_quiz/core/core.dart';
import 'package:nlw_quiz/home/widgets/scorecard/scorecard_widget.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          child: Container(
            child: Stack(
              children: [
                Container(
                  height: 161,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(gradient: AppGradients.linear),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Olá, ',
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: 'Bernardo Duarte',
                              style: AppTextStyles.titleBold,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://avatars.githubusercontent.com/u/11081407'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: ScorecardWidget(),
                ),
              ],
            ),
            height: 250,
          ),
          preferredSize: Size.fromHeight(250),
        );
}
