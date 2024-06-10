import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundtool_app/constants/app_style.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Hero(
        tag: 'B1',
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            height: 54.h,
            width: 289.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppStyle.gradiant1,
                  AppStyle.gradiant2,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppStyle.gradiant1.withOpacity(0.3),
                  offset: Offset(2, 4),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppStyle.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
