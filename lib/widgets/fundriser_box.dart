import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_style.dart';
import '../constants/asset_path.dart';

class FundriserBox extends StatelessWidget {
  final String foundName;
  final String goal;
  final String currentValue;
  final String image;
  final String members;
  const FundriserBox(
      {super.key,
      required this.foundName,
      required this.goal,
      required this.currentValue,
      required this.image,
      required this.members});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 112.h,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.red,
            boxShadow: [BoxShadow(color: AppStyle.fontGray.withOpacity(0.2), blurRadius: 13.h, spreadRadius: 1)],
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: AssetImage(ImageAssetPath.homeContainer), fit: BoxFit.fill)),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70.h,
              width: 70.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: CachedNetworkImageProvider('$image'))),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  '$foundName',
                  style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w600, color: AppStyle.white),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp, fontWeight: FontWeight.w300, color: AppStyle.fontGray),
                              children: <TextSpan>[
                                TextSpan(text: 'Goal: '),
                                TextSpan(
                                  text: '\$$currentValue',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppStyle.fontGray),
                                ),
                                TextSpan(text: '/$goal'),
                              ],
                            )),
                        SizedBox(
                          height: 5.h,
                        ),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp, fontWeight: FontWeight.w300, color: AppStyle.fontGray),
                              children: <TextSpan>[
                                TextSpan(text: 'Members: '),
                                TextSpan(
                                  text: '$members',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppStyle.fontGray),
                                ),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 70.w,
                    ),
                    Container(
                      height: 36.h,
                      width: 36.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, border: Border.all(color: AppStyle.gradiant1, width: 3)),
                      child: Center(
                          child: Icon(
                        CupertinoIcons.right_chevron,
                        color: AppStyle.appColor,
                        size: 19.h,
                      )),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
