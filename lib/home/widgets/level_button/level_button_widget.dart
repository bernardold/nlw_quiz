import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlw_quiz/core/core.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;

  LevelButtonWidget({Key? key, required this.label})
      : assert(['Fácil', 'Médio', 'Difícil', 'Perito'].contains(label)),
        super(key: key);

  final config = {
    'Fácil': {
      'color': AppColors.levelButtonFacil,
      'border': AppColors.levelButtonBorderFacil,
      'textColor': AppColors.levelButtonTextFacil,
    },
    'Médio': {
      'color': AppColors.levelButtonMedio,
      'border': AppColors.levelButtonBorderMedio,
      'textColor': AppColors.levelButtonTextMedio,
    },
    'Difícil': {
      'color': AppColors.levelButtonDificil,
      'border': AppColors.levelButtonBorderDificil,
      'textColor': AppColors.levelButtonTextDificil,
    },
    'Perito': {
      'color': AppColors.levelButtonPerito,
      'border': AppColors.levelButtonBorderPerito,
      'textColor': AppColors.levelButtonTextPerito,
    },
  };

  Color get backgroundColor => config[label]!['color']!;
  Color get borderColor => config[label]!['border']!;
  Color get textColor => config[label]!['textColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(28),
        border: Border.fromBorderSide(BorderSide(color: borderColor)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            color: textColor,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
