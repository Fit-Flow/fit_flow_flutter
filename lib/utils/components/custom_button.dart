import 'package:flutter/material.dart';

import '../app_colors.dart';

/**
 * @authors Jackie, Christoffer & Jakob
 */
class CustomButton extends StatelessWidget {
  String text;
  Color color;
  Color textColor;
  final VoidCallback onTap;

  CustomButton({
    required this.text,
    required this.color,
    required this.textColor,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: AppColors.lightGreyColor, width: 1.0),
          ),
        ),
      ),
    );
  }
}