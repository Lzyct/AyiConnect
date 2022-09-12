import 'package:ayiconnect_test/core/core.dart';
import 'package:ayiconnect_test/domain/domain.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepository {
  Future<Either<Failure, Location>> currentLocation();
}
