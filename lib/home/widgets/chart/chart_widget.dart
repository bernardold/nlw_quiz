import 'package:flutter/material.dart';
import 'package:nlw_quiz/core/core.dart';

class ChartWidget extends StatelessWidget {
  final int percent;

  const ChartWidget({Key? key, required this.percent})
      : assert(percent >= 0 && percent <= 100),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: (percent / 100),
                backgroundColor: AppColors.chartSecondary,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
          ),
          Center(child: Text('$percent%', style: AppTextStyles.heading)),
        ],
      ),
    );
  }
}
