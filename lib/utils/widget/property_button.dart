import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../text_styles.dart';

class PropertyButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function()? onTap;

  const PropertyButton({
    required this.color,
    required this.text,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: quicksand16W600(
            color: color == Colors.white12 ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
