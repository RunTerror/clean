import 'package:auto_route/auto_route.dart';
import 'package:map/config/routes/route_imports.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthScreenRoute.page),
        AutoRoute(page: OnBoardingScreenRoute.page),
        AutoRoute(page: SplashScreenRoute.page, initial: true),
        AutoRoute(page: HomeScreenRoute.page)
      ];
}
