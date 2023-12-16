import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_color.dart';
import '../text_styles.dart';

class Button extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const Button({required this.text, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      height: 35,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(6.0),
          shadowColor: MaterialStateProperty.all<Color?>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color?>(AppConst.base),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: raleway16W600(color: Colors.black),
        ),
      ),
    );
  }
}
