import 'package:flutter/material.dart';
import 'package:nlw_quiz/core/core.dart';
import 'package:nlw_quiz/shared/models/answer_model.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final bool disabled;
  final ValueChanged<bool> onTap;

  const AnswerWidget({
    Key? key,
    required this.answer,
    required this.isSelected,
    required this.disabled,
    required this.onTap,
  }) : super(key: key);

  Color get _selectedColor =>
      answer.isCorrect ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorder =>
      answer.isCorrect ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCard =>
      answer.isCorrect ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCard =>
      answer.isCorrect ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyle => answer.isCorrect
      ? AppTextStyles.bodyDarkGreen
      : AppTextStyles.bodyDarkRed;

  IconData get _selectedIcon => answer.isCorrect ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: GestureDetector(
        onTap: disabled
            ? null
            : () {
                onTap(answer.isCorrect);
              },
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
                  answer.title,
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
      ),
    );
  }
}
