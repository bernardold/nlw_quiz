import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlw_quiz/core/core.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final bool hasBorder;

  final VoidCallback onTap;

  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.hasBorder,
    required this.onTap,
  }) : super(key: key);

  NextButtonWidget.primary({required this.label, required this.onTap})
      : this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.hasBorder = false;

  NextButtonWidget.secondary({required this.label, required this.onTap})
      : this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.lightGrey,
        this.hasBorder = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
          side: hasBorder
              ? MaterialStateProperty.all(BorderSide(color: AppColors.border))
              : null,
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
