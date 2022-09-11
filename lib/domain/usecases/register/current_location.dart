import 'package:ayiconnect_test/core/core.dart';
import 'package:ayiconnect_test/domain/domain.dart';
import 'package:dartz/dartz.dart';

class CurrentLocation extends UseCase<Location, NoParams> {
  final RegisterRepository _repo;

  CurrentLocation(this._repo);

  @override
  Future<Either<Failure, Location>> call(NoParams params) =>
      _repo.currentLocation();
}
