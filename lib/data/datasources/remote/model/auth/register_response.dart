import 'package:ayiconnect_test/domain/domain.dart';
import 'package:equatable/equatable.dart';

class RegisterResponse extends Equatable {
  final String? placeId;
  final String? description;

  const RegisterResponse({
    this.placeId,
    this.description,
  });

  RegisterResponse.fromJson(dynamic json)
      : placeId = json['place_id'] as String?,
        description = json['description'] as String?;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['place_id'] = placeId;
    map['description'] = description;

    return map;
  }

  Location toEntity() => Location(placeId: placeId, description: description);

  @override
  List<Object?> get props => [
        placeId,
        description,
      ];
}
