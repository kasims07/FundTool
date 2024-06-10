import 'package:auto_route/auto_route.dart';
import 'package:fundtool_app/screens/loginScreen/login_screen.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        CustomRoute(page: SplashRoute.page, initial: true),
        CustomRoute(
          page: LoginRoute.page,
        ),
        CustomRoute(
          page: HomeRoute.page,
        ),
      ];
}
