import 'package:flutter/material.dart';
import 'package:nlw_quiz/core/core.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({
    Key? key,
    required this.title,
    this.isSelected = false,
    this.isCorrect = false,
  }) : super(key: key);

  final String title;
  final bool isSelected;
  final bool isCorrect;

  Color get _selectedColor =>
      isCorrect ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorder =>
      isCorrect ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCard =>
      isCorrect ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCard => isCorrect ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyle =>
      isCorrect ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIcon => isCorrect ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? _selectedColorCard : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(
              color: isSelected ? _selectedBorderCard : AppColors.border,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: isSelected ? _selectedTextStyle : AppTextStyles.body,
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected ? _selectedColor : AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.fromBorderSide(
                  BorderSide(
                    color: isSelected ? _selectedBorder : AppColors.border,
                  ),
                ),
              ),
              child: isSelected
                  ? Icon(
                      _selectedIcon,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
