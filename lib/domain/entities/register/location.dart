import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String? placeId;
  final String? description;

  const Location({this.placeId, this.description});

  @override
  List<Object?> get props => [placeId, description];
}
