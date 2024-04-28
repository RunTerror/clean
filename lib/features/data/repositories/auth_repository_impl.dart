import 'package:map/core/resources/data_state.dart';
import 'package:map/features/data/datasources/remote/remote_auth_api.dart';
import 'package:map/features/data/models/user_model/user.dart';
import 'package:map/features/domain/repositories/auth_repository.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthApiService authApiService;

  AuthRepositoryImplementation(this.authApiService);

  @override
  Future<DataState<User>> getUser() async {
    return authApiService.fetchUserInfo();
  }

  @override
  Future<DataState<User>> login(String email, String password) async {
    return authApiService.login(email, password);
    // return authApiService.login(email, password);
  }

  @override
  Future<DataState<User>> register(
      String name, String email, String password) async {
    return authApiService.register(name, email, password);
  }
}
