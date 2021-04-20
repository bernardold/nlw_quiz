import 'package:flutter/material.dart';
import 'package:nlw_quiz/core/core.dart';

class QuizCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(BorderSide(color: AppColors.border))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(height: 24),
          Text('Titulo', style: AppTextStyles.heading15),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text('3 de 10', style: AppTextStyles.body11),
              ),
              Expanded(
                flex: 2,
                child: LinearProgressIndicator(
                  value: 0.3,
                  backgroundColor: AppColors.chartSecondary,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
