import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:map/config/routes/routes.dart';
import 'package:map/features/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:map/service_locator.dart';
import 'package:map/features/presentation/cubit/onboarding_cubit/onboarding_cubit.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await setupLocator();
  await localApiService.init();
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    // final authApiService = locator<AuthApiService>();
    // final response =
    //     authApiService.register('abhisehk', 'bansai@gmail.com', '123455');
    // log(response.toString());
    return MultiBlocProvider(
        providers: [
          BlocProvider<OnBoradingCubit>(
            create: (context) => OnBoradingCubit(),
          ),
          BlocProvider<AuthCubit>(
            create: (context) => locator<AuthCubit>(),
          )
        ],
        child: MaterialApp.router(
          theme: customTheme.myTheme,
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
