import 'package:ayiconnect_test/core/core.dart';
import 'package:ayiconnect_test/domain/domain.dart';
import 'package:dartz/dartz.dart';

class SearchLocation extends UseCase<Location, SearchLocationParams> {
  final RegisterRepository _repo;

  SearchLocation(this._repo);

  @override
  Future<Either<Failure, Location>> call(SearchLocationParams params) =>
      _repo.searchLocation(params);
}

class SearchLocationParams {
  final String input;
  final String language;

  SearchLocationParams({
    this.input = "",
    this.language = "",
  });

  Map<String, dynamic> toJson() => {
        "input": input,
        "language": language,
      };
}
