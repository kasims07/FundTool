import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_style.dart';

class CustomLoadingScr extends StatelessWidget {
  const CustomLoadingScr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100.h,
        width: 100.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: AppStyle.white, boxShadow: [
          BoxShadow(color: AppStyle.fontGray.withOpacity(0.3), blurRadius: 10, blurStyle: BlurStyle.outer)
        ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: AppStyle.appColor,
              backgroundColor: AppStyle.gradiant1,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Please wait..",
              style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppStyle.fontGray),
            ),
            SizedBox(height: 2.0),
          ],
        ),
      ),
    );
  }
}
