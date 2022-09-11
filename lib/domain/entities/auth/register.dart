import 'package:equatable/equatable.dart';

class Register extends Equatable {
  final String placeId;
  final String description;

  const Register(this.placeId, this.description);

  @override
  List<Object?> get props => [placeId, description];
}
