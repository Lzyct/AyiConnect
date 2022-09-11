import 'package:ayiconnect_test/core/core.dart';
import 'package:ayiconnect_test/data/data.dart';
import 'package:ayiconnect_test/domain/domain.dart';

abstract class AuthRemoteDatasource {
  Future<RegisterResponse> register(RegisterParams registerParams);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final DioClient _client;

  AuthRemoteDatasourceImpl(this._client);

  @override
  Future<RegisterResponse> register(
    RegisterParams registerParams,
  ) async {
    try {
      final response = await _client.postRequest(
        ListApi.register,
        data: registerParams.toJson(),
      );

      final result = RegisterResponse.fromJson(response.data);
      if (response.statusCode == 200) {
        return result;
      } else {
        throw ServerException(result.error);
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
