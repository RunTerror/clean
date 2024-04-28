import 'package:map/core/resources/data_state.dart';
import 'package:map/features/domain/entities/user_entity/user_entity.dart';

abstract class AuthRepository {
  Future<DataState<UserEntity>> getUser();

  // Signup function
  Future<DataState<UserEntity>> register(
      String name, String email, String password);

  // Login function
  Future<DataState<UserEntity>> login(String email, String password);
}
