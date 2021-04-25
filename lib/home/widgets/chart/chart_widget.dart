import 'package:flutter/material.dart';
import 'package:nlw_quiz/core/core.dart';

class ChartWidget extends StatefulWidget {
  final int percent;

  const ChartWidget({Key? key, required this.percent})
      : assert(percent >= 0 && percent <= 100),
        super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  void _initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<double>(begin: 0.0, end: widget.percent.toDouble())
        .animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) => Stack(
          children: [
            Center(
              child: Container(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: (_animation.value / 100),
                  backgroundColor: AppColors.chartSecondary,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                ),
              ),
            ),
            Center(
                child:
                    Text('${_animation.value.toInt()}%', style: AppTextStyles.heading)),
          ],
        ),
      ),
    );
  }
}
