import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map/config/routes/route_imports.gr.dart';
import 'package:map/core/resources/data_state.dart';
import 'package:map/features/domain/entities/user_entity/user_entity.dart';
import 'package:map/features/domain/usecases/auth_usecase.dart';
import 'package:map/features/presentation/pages/home/home.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoginLoading extends AuthState {}

class Authenticated extends AuthState {}

class AuthErrorState extends AuthState {
  String error;

  AuthErrorState({required this.error});
}

class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase _authUseCase;

  AuthCubit(this._authUseCase) : super(AuthInitial());

  Future<UserEntity?> register(
      String name, String email, String password, BuildContext context) async {
    emit(AuthLoading());

    final dataState = await _authUseCase.registerUseCase(name, email, password);

    if (dataState is DataSuccess && dataState.data != null) {
      emit(AuthInitial());

      context.mounted
          ? AutoRouter.of(context).replace(const HomeScreenRoute())
          : null;

      return dataState.data!;
    } else if (dataState is DataFailed) {
      emit(AuthInitial());
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(dataState.error!.graphqlErrors.first.message)));
      }
    }
    return null;
  }

  Future<UserEntity?> login(
      String email, String password, BuildContext context) async {
    emit(AuthLoginLoading());
    final dataState = await _authUseCase.loginUserCase(email, password);

    if (dataState is DataFailed) {
      emit(AuthInitial());
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(dataState.error!.graphqlErrors.first.message)));
      }
    } else {
      emit(AuthInitial());
      context.mounted
          ? AutoRouter.of(context).replace(const HomeScreenRoute())
          : null;
      return dataState.data!;
    }
    return null;
  }
}
