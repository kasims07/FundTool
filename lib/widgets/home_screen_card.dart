import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../constants/app_style.dart';
import '../constants/asset_path.dart';

class HomeScreenCard extends StatelessWidget {
  HomeScreenCard({super.key});

  TextEditingController otpController = TextEditingController();

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172.h,
      width: 335.w,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImageAssetPath.otpCard))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Join a Fundraiser',
            style: GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.bold, color: AppStyle.white),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            'Join your group fundraiser',
            style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppStyle.white),
          ),
          SizedBox(
            height: 26.h,
          ),
          Text(
            'Enter invitation code',
            style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w300, color: AppStyle.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Directionality(
                textDirection: TextDirection.ltr,
                child: Pinput(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  length: 6,
                  pinContentAlignment: Alignment.center,
                  controller: otpController,
                  focusNode: focusNode,
                  defaultPinTheme: PinTheme(
                    width: 38,
                    height: 38,
                    textStyle: GoogleFonts.lexend(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppStyle.white.withOpacity(0.3), // Change this to your desired color
                          width: 2.0, // Change this to your desired width
                        ),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  separatorBuilder: (index) => SizedBox(width: 5.w),
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) async {
                    debugPrint('onChanged: $value');
                    if (value.length == 6) {
                      FocusScope.of(context).requestFocus(new FocusNode());
                    }
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 9), width: 1, height: 22, color: AppStyle.appColor),
                    ],
                  ),
                  focusedPinTheme: PinTheme(
                    width: 38,
                    height: 38,
                    textStyle: GoogleFonts.lexend(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppStyle.appColor, // Change this to your desired color
                          width: 2.0, // Change this to your desired width
                        ),
                      ),
                    ),
                  ),
                  submittedPinTheme: PinTheme(
                    width: 38,
                    height: 38,
                    textStyle: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w300, color: AppStyle.white),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppStyle.appColor, // Change this to your desired color
                          width: 2.0, // Change this to your desired width
                        ),
                      ),
                    ),
                  ),
                  errorPinTheme: PinTheme(
                    width: 38,
                    height: 38,
                    textStyle: GoogleFonts.lexend(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.red.withOpacity(0.3), // Change this to your desired color
                          width: 2.0, // Change this to your desired width
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 36.h,
                width: 36.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [AppStyle.gradiant4, AppStyle.gradiant3])),
                child: Center(
                    child: Icon(
                  CupertinoIcons.right_chevron,
                  size: 19.h,
                )),
              )
            ],
          )
        ],
      ),
    );
  }

  //
}
