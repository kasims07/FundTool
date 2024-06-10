import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundtool_app/utils/app_dependencies.dart';
import 'package:fundtool_app/utils/app_router.dart';

import 'constants/app_style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  setupDependencies();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'FundTool',
          theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff275473))).copyWith(
              splashColor: Colors.transparent, hoverColor: Colors.transparent, scaffoldBackgroundColor: AppStyle.white),
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
