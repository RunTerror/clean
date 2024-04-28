import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map/config/routes/route_imports.gr.dart';
import 'package:map/service_locator.dart';
import 'package:map/core/services/size_config.dart';
import 'package:map/features/presentation/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:map/features/presentation/pages/onboarding/onboarding_page.dart';

@RoutePage()
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnBoradingCubit, int>(
        builder: (context, page) {
          return Stack(
            children: [
              _pageView(page),
              if (page != 2) _skipButton(),
              _pageIndicator(page),
              _nextButton(),
            ],
          );
        },
      ),
    );
  }

  Widget _pageView(int page) {
    return PageView(
      onPageChanged: (page) {
        BlocProvider.of<OnBoradingCubit>(context).setPage(page);
      },
      controller: _controller,
      children: const [OnBoardingPage(), OnBoardingPage(), OnBoardingPage()],
    );
  }

  Widget _skipButton() {
    return Positioned(
      right: 40,
      top: 40,
      child: InkWell(
        onTap: () {
          _controller.jumpToPage(2);
        },
        child: const Text('Skip'),
      ),
    );
  }

  Widget _pageIndicator(int page) {
    return Positioned(
      bottom: 50 + SizeConfig.screenWidth / 20,
      left: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(3, (int index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: page == index ? Colors.white : Colors.green,
            ),
          );
        }),
      ),
    );
  }

  Future<void> save() async {
    await sharedPreferencesService.saveData('visited', true);
    // ignore: use_build_context_synchronously
    AutoRouter.of(context).replace(const AuthScreenRoute());
  }

  Widget _nextButton() {
    return Positioned(
      bottom: 50,
      right: 40,
      child: Nextbutton(
        function: () {
          (_controller.page!.round() == 2)
              ? save()
              : _controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                );
        },
      ),
    );
  }
}
