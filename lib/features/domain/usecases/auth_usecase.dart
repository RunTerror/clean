import 'package:map/core/resources/data_state.dart';
import 'package:map/features/domain/entities/user_entity/user_entity.dart';
import 'package:map/features/domain/repositories/auth_repository.dart';

enum AuthOperation { register, login }

class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase(this.authRepository);

  Future<DataState<UserEntity>> registerUseCase(
      String name, String email, String password) async {
    return await authRepository.register(name, email, password);
  }

  Future<DataState<UserEntity>> loginUserCase(
      String email, String password) async {
    return await authRepository.login(email, password);
  }

  Future<DataState<UserEntity>> getUserInfoUseCase() async {
    return await authRepository.getUser();
  }

  // @override
  // Future call(paramas) {
  //   throw UnimplementedError();
  // }
}
