import 'package:ayiconnect_test/core/core.dart';
import 'package:ayiconnect_test/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final CurrentLocation _currentLocation;

  RegisterCubit(this._currentLocation) : super(const RegisterState());

  Future<void> currentLocation() async {
    emit(state.copyWith(status: RegisterStatus.loading));
    final data = await _currentLocation.call(NoParams());
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(
            state.copyWith(status: RegisterStatus.failure, message: l.message),
          );
        }
      },
      (r) => emit(state.copyWith(status: RegisterStatus.success, location: r)),
    );
  }
}
