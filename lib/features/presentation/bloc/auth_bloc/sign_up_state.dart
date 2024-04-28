import 'package:graphql/client.dart';
import 'package:map/features/data/models/user_model/user.dart';

abstract class SignUpState {
  final User? signInUser;
  final String? authToken;
  final OperationException? error;

  SignUpState({this.authToken, this.error, this.signInUser});
}


class SignUpLoadingState extends SignUpState{
  
}

class SignUpErrorState extends SignUpState{
  
}

class SignUpLoginState extends SignUpState{
  
}

class SignUpInitialState  extends SignUpState{
  
}