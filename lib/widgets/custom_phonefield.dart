import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundtool_app/constants/app_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

import '../constants/asset_path.dart';

class CustomPhoneField extends StatefulWidget {
  final TextInputType type;
  final TextEditingController controller;
  final String hintText;

  final Function(CountryCode?)? onCountryCode;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  late dynamic countryCode;

  final int? maxLength;

  CustomPhoneField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.onCountryCode,
    required this.type,
    this.countryCode,
    this.onSubmitted,
    this.maxLength,
  }) : super(key: key);

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  bool isEditing = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      isEditing = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
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
        focusNode: _focusNode,
        maxLength: widget.maxLength ?? 10,
        keyboardType: widget.type,
        textInputAction: TextInputAction.done,
        controller: widget.controller,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          counterText: '',
          prefixIcon: SizedBox(
            width: 95.w,
            child: CountryListPick(
              appBar: AppBar(
                backgroundColor: AppStyle.appColor,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                title: Text(
                  'Select your country',
                  style: GoogleFonts.poppins(fontSize: 24.sp, fontWeight: FontWeight.w500, color: AppStyle.white),
                ),
              ),
              pickerBuilder: (context, CountryCode? countryCode) {
                return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(countryCode?.dialCode ?? '',
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp, fontWeight: FontWeight.normal, color: AppStyle.black)),
                      SvgPicture.asset(
                        ImageAssetPath.icDawonRound,
                        height: 20.h,
                        width: 20.h,
                      ),
                    ],
                  ),
                );
              },
              theme: CountryTheme(
                alphabetSelectedBackgroundColor: AppStyle.appColor,
                isShowFlag: true,
                isShowTitle: true,
                isShowCode: false,
                isDownIcon: true,
                showEnglishName: true,
                labelColor: AppStyle.appColor,
              ),
              initialSelection: widget.countryCode,
              onChanged: widget.onCountryCode,
            ),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: SvgPicture.asset(
              ImageAssetPath.icPhoneF,
              height: 24.h,
              width: 24.h,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16.h),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
              fontSize: 16.sp, fontWeight: FontWeight.normal, color: AppStyle.fontGray.withOpacity(0.5)),
          border: InputBorder.none,
          focusedBorder: GradientOutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(colors: [AppStyle.gradiant1, AppStyle.gradiant2]),
              width: 1),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppStyle.fontGray.withOpacity(0.2)),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.normal, color: AppStyle.black),
        onChanged: (newValue) {
          if (widget.onChanged != null) {
            widget.onChanged!(newValue);
          }
        },
        onSubmitted: (value) {
          if (widget.onSubmitted != null) {
            widget.onSubmitted!(value);
          }
        },
      ),
    );
  }
}
