import 'package:ayiconnect_test/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class AppCubit extends Cubit<Either<Failure, Position>> {
  AppCubit(super.initialState);
}
