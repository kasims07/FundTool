import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

import '../constants/app_style.dart';
import '../constants/asset_path.dart';

class PasswordFiled extends StatefulWidget {
  final String? hindText;
  final Widget? suffixIcon;

  final FocusNode? node;
  final TextEditingController? controller;
  final TextInputType? type;
  final List<TextInputFormatter>? inputformate;

  const PasswordFiled({
    super.key,
    required this.type,
    required this.controller,
    this.hindText,
    this.suffixIcon,
    this.node,
    this.inputformate,
  });

  @override
  State<PasswordFiled> createState() => _PasswordFiledState();
}

class _PasswordFiledState extends State<PasswordFiled> {
  FocusNode node = FocusNode();

  bool showPass = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
      elevation: 5.0,
      shadowColor: AppStyle.fontGray.withOpacity(0.2),
      child: TextField(
          cursorColor: AppStyle.gradiant1,
          controller: widget.controller,
          focusNode: node,
          keyboardType: widget.type,
          obscureText: showPass,
          keyboardAppearance: Theme.of(context).brightness,
          textInputAction: TextInputAction.done,
          inputFormatters: widget.inputformate ?? null,
          style: GoogleFonts.poppins(fontSize: 16.sp, color: AppStyle.fontGray, fontWeight: FontWeight.normal),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            filled: false,
            hintText: widget.hindText,
            hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500, color: AppStyle.fontGray.withOpacity(0.5)),
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  showPass = !showPass;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: SvgPicture.asset(
                  showPass ? ImageAssetPath.icEyeO : ImageAssetPath.icEyeC,
                  height: 24.h,
                  width: 24.h,
                ),
              ),
            ),
            //suffixIconConstraints: BoxConstraints(maxWidth: 30.h, maxHeight: 30.h, minHeight: 30.h, minWidth: 30.h),
            focusedBorder: GradientOutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                gradient: LinearGradient(colors: [AppStyle.gradiant1, AppStyle.gradiant2]),
                width: 1),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppStyle.fontGray.withOpacity(0.2)),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          )),
    );
  }
}
