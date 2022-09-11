import 'package:ayiconnect_test/domain/domain.dart';
import 'package:equatable/equatable.dart';

class RegisterResponse extends Equatable {
  final int? id;
  final String? token;
  final String? error;

  const RegisterResponse({
    this.id,
    this.token,
    this.error,
  });

  RegisterResponse.fromJson(dynamic json)
      : id = json['id'] as int?,
        token = json['token'] as String?,
        error = json['error'] as String?;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['token'] = token;
    map['error'] = error;

    return map;
  }

  Register toEntity() => const Register("", "");

  @override
  List<Object?> get props => [
        id,
        token,
        error,
      ];
}
