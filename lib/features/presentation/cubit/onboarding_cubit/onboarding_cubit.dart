import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoradingCubit extends Cubit<int> {
  OnBoradingCubit() : super(0);

  void setPage(int page) {
    emit(page);
  }
}
