import 'package:ayiconnect_test/core/core.dart';
import 'package:ayiconnect_test/domain/domain.dart';
import 'package:dartz/dartz.dart';

class PostRegister extends UseCase<Register, RegisterParams> {
  final AuthRepository _repo;

  PostRegister(this._repo);

  @override
  Future<Either<Failure, Register>> call(RegisterParams params) =>
      _repo.register(params);
}

class RegisterParams {
  final String email;
  final String password;

  RegisterParams({
    this.email = "",
    this.password = "",
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
