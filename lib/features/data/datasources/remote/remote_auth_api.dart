import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql/client.dart';
import 'package:map/core/constants/auth_queries.dart';
import 'package:map/core/resources/data_state.dart';
import 'package:map/features/data/datasources/local/local_api.dart';
import 'package:map/features/data/models/user_model/user.dart';
import 'package:map/service_locator.dart';

class AuthApiService {
  late LocalApiService localapiService;
  late ValueNotifier<GraphQLClient> clientNonAuth;
  late GraphQLClient clientAuth;
  late AuthQueries authQueries;

  AuthApiService(this.authQueries, this.clientNonAuth, this.clientAuth,
      this.localapiService);

  Future<DataState<User>> fetchUserInfo() async {
    clientAuth = await graphqlConfig.authClient();
    try {
      // api call
      final result = await clientAuth
          .mutate(MutationOptions(document: gql(authQueries.fetchUserInfo())));

      if (result.data != null && result.isConcrete) {
        final json = result.data!['me'];
        final user = User.fromJson(json);

        // storing data locally
        final tokenUser = await localapiService.getUser();

        log('token: ${tokenUser.authtoken.toString()}');

        final newUser = User(
            authtoken: tokenUser.authtoken,
            email: user.email,
            id: user.id,
            name: user.name);

        // await localapiService.saveUser(newUser);

        log(result.data.toString());
        return DataSuccess(newUser);
      } else {
        return DataFailed(result.exception!);
      }
    } on OperationException catch (e) {
      return DataFailed(e);
    }
  }

  Future<DataState<User>> register(
      String name, String email, String password) async {
    try {
      // REGISTER API CALL

      final result = await clientNonAuth.value.mutate(
        MutationOptions(
          document: gql(authQueries.registerUser(name, email, password)),
        ),
      );

      if (result.data != null && result.isConcrete) {
        // LOGIN API CALL
        final dataState = await login(email, password);

        if (dataState is DataFailed) {
          return DataFailed(dataState.error!);
        }
        return dataState;
      } else if (result.hasException) {
        return DataFailed(result.exception!);
      }

      return DataFailed(OperationException(graphqlErrors: [
        const GraphQLError(
            message: 'An unexpected error occurred during registration.')
      ]));
    } on OperationException catch (e) {
      return DataFailed(e);
    }
  }

  Future<DataState<User>> login(String email, String password) async {
    try {
      final QueryResult result = await clientNonAuth.value.mutate(
          MutationOptions(
              document: gql(authQueries.loginUser(email, password))));

      if (result.data != null && result.isConcrete) {
        final token = "Bearer ${result.data!['login']}";

        // storing auth token
        final user = User(authtoken: token);
        await localapiService.saveUser(user);

        // fetching User Info
        final userDataState = await fetchUserInfo();

        if (userDataState is DataFailed) {
          return DataFailed(userDataState.error!);
        }

        return userDataState;
      } else if (result.hasException) {
        return DataFailed(result.exception!);
      }

      return DataFailed(OperationException(graphqlErrors: [
        const GraphQLError(message: 'An unexpected error occured.')
      ]));
    } on OperationException catch (e) {
      return DataFailed(e);
    }
  }
}
