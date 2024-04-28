import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:map/core/constants/auth_queries.dart';
import 'package:map/core/services/shared_prefrence_service.dart';
import 'package:map/core/services/size_config.dart';
import 'package:map/config/graphql/graphql_config.dart';
import 'package:map/config/theme/theme.dart';
import 'package:map/features/data/datasources/local/local_api.dart';
import 'package:map/features/data/datasources/remote/remote_auth_api.dart';
import 'package:map/features/data/repositories/auth_repository_impl.dart';
import 'package:map/features/domain/repositories/auth_repository.dart';

import 'package:map/features/domain/usecases/auth_usecase.dart';
import 'package:map/features/presentation/cubit/auth_cubit/auth_cubit.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // sizing
  locator.registerLazySingleton(() => SizeConfig());
  locator.registerSingleton<CustomTheme>(CustomTheme());
  locator.registerSingleton<AuthQueries>(AuthQueries());

  // local storage services
  locator
      .registerSingleton<SharedPreferencesService>(SharedPreferencesService());

  // graph
  locator.registerSingleton<GraphQLConfig>(GraphQLConfig());
  // local db
  locator.registerSingleton<LocalApiService>(LocalApiService());
  // api
  locator.registerSingleton(AuthApiService(
      locator<AuthQueries>(),
      ValueNotifier(graphqlConfig.clientToQuery()),
      await graphqlConfig.authClient(),
      locator<LocalApiService>()));

  // locator.registerSingleton<AuthRepositoryImplementation>(
  //     AuthRepositoryImplementation(authApiService));

  // // locator.registerSingleton<AuthRepositoryImplementation>(
  // //     AuthRepositoryImplementation(locator<AuthApiService>()));

  locator.registerSingleton<AuthRepository>(
      AuthRepositoryImplementation(locator<AuthApiService>()));

  // authusecase

  locator
      .registerSingleton<AuthUseCase>(AuthUseCase(locator<AuthRepository>()));

  // bloc and cubit
  locator.registerFactory(() => AuthCubit(locator<AuthUseCase>()));

  // local db
}

final sizeConfig = locator<SizeConfig>();
final sharedPreferencesService = locator<SharedPreferencesService>();
final customTheme = locator<CustomTheme>();
final graphqlConfig = locator<GraphQLConfig>();
final localApiService = locator<LocalApiService>();
