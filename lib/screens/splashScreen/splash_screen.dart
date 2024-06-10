import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundtool_app/utils/app_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_constants.dart';
import '../../constants/asset_path.dart';
import '../../utils/app_router.gr.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    controller.forward();

    animation.addStatusListener((status) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isLogin = prefs.getBool(AppConstants.ISLOGIN);
      if (isLogin == true) {
        if (mounted) {
          AutoRouter.of(context).replace(const HomeRoute());
        }
      } else {
        if (mounted) {
          AutoRouter.of(context).replace(const LoginRoute());
        }
      }
    });
  }

  @override
  void dispose() {
    // Don't forget to dispose the controller when the widget is removed
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Image.asset(
              ImageAssetPath.background,
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Center(
              child: FadeTransition(
                opacity: animation,
                child: Hero(tag: 'I1', child: Image.asset(ImageAssetPath.appLogoName, height: 55.h, width: 270.w)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
