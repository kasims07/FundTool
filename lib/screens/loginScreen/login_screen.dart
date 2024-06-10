import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:country_list_pick/support/code_country.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fundtool_app/constants/app_constants.dart';
import 'package:fundtool_app/constants/app_style.dart';
import 'package:fundtool_app/utils/alert_utils.dart';
import 'package:fundtool_app/utils/app_helper.dart';
import 'package:fundtool_app/widgets/custome_loadin.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:platform_device_id_v3/platform_device_id.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/asset_path.dart';
import '../../utils/app_router.gr.dart';
import '../../widgets/button.dart';
import '../../widgets/custom_phonefield.dart';
import '../../widgets/custom_passwordfiled.dart';
import 'bloc/login_screen_bloc.dart';

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    // TODO: implement wrappedRoute
    return MultiBlocProvider(providers: [
      BlocProvider<LoginScreenBloc>(create: (_) => LoginScreenBloc()),
    ], child: LoginScreen());
  }
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController password = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController contryCode = TextEditingController(text: '+91');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    password.dispose();
    phoneController.dispose();
    contryCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginScreenBloc, LoginScreenState>(
        listener: (context, state) async {
          // TODO: implement listener
          if (state.isCompleted) {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setBool(AppConstants.ISLOGIN, true);
            pref.setString(AppConstants.TOKEN, state.model!.data!.token!);
            AutoRouter.of(context).replace(const HomeRoute());
          } else if (state.isFailed) {
            AlertUtils.showSimpleToast('${state.errorMsg ?? 'Something went wrong'}');
          }
        },
        builder: (context, state) {
          return IgnorePointer(
            ignoring: state.isLoading,
            child: Stack(
              children: [
                Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(ImageAssetPath.background), fit: BoxFit.cover)),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 154.h,
                        left: 0,
                        right: 0,
                        child: Hero(
                          tag: 'I1',
                          child: Image.asset(
                            ImageAssetPath.appLogoName,
                            height: 55.h,
                            width: 270.w,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 433.h,
                          decoration: BoxDecoration(
                              color: AppStyle.white,
                              borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Login',
                                style: GoogleFonts.poppins(
                                    fontSize: 24.sp, fontWeight: FontWeight.bold, color: AppStyle.black),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                'Please login your account.',
                                style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.normal,
                                    color: AppStyle.fontGray.withOpacity(0.5)),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: CustomPhoneField(
                                  controller: phoneController,
                                  hintText: 'Phone number',
                                  type: TextInputType.phone,
                                  countryCode: '+1',
                                  onCountryCode: (CountryCode? code) {
                                    contryCode.text = code?.dialCode ?? '';
                                    //countryCode.add(code?.dialCode ?? '');
                                  },
                                  onChanged: (value) {
                                    //phoneNo.add(phoneNoController.text);
                                    print('Length - ${phoneController.text.length}');
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: PasswordFiled(
                                  type: TextInputType.text,
                                  controller: password,
                                  hindText: 'Password',
                                ),
                              ),
                              SizedBox(
                                height: 19.h,
                              ),
                              Text(
                                'Forgot Password?',
                                style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppStyle.fontGray.withOpacity(0.5)),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              GradientButton(
                                text: 'Login',
                                onPressed: () {
                                  validation();
                                },
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Didn’t get any account ?",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15.sp, fontWeight: FontWeight.normal, color: AppStyle.black),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'Sign Up',
                                    style: GoogleFonts.poppins(
                                        fontSize: 15.sp, fontWeight: FontWeight.w600, color: AppStyle.gradiant2),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (state.isLoading) CustomLoadingScr()
              ],
            ),
          );
        },
      ),
    );
  }

  //Mehtods
  validation() async {
    if (phoneController.text.isEmpty) {
      AlertUtils.showSimpleToast('Please enter phone number.');
      return;
    }
    if (password.text.isEmpty) {
      AlertUtils.showSimpleToast('Please enter password.');
      return;
    }
    String deviceId = await PlatformDeviceId.getDeviceId ?? '';
    FormData data = FormData.fromMap({
      "country_code": contryCode.text,
      "mobile": phoneController.text.trim(),
      "password": password.text.trim(),
      "push_token": '',
      "device_type": Platform.isAndroid ? 'android' : 'ios',
      "device_id": '$deviceId'
    });
    var internet = await AppHelper.checkInternet();
    if (internet) {
      BlocProvider.of<LoginScreenBloc>(context).add(
        PerformLoginScreenEvent(data: data),
      );
    } else {
      AlertUtils.showNotInternetDialogue(context);
    }
  }
}
