import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:map/config/routes/route_imports.gr.dart';
import 'package:map/service_locator.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  late bool isVisited;

  @override
  void initState() {
    super.initState();
    fetchData();
    timer = Timer(const Duration(seconds: 2), () async {
      AutoRouter.of(context).replace(
        isVisited == true
            ? await check() == true
                ? const HomeScreenRoute()
                : const AuthScreenRoute()
            : const OnBoardingScreenRoute(),
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future<void> fetchData() async {
    await sharedPreferencesService.init();
    isVisited = await sharedPreferencesService.loadData('visited') ?? false;
  }

  Future<bool> check() async {
    final user = await localApiService.getUser();
    if (user.authtoken == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Image.asset('assets/images/icon.jpg'),
        ),
      ),
    );
  }
}
