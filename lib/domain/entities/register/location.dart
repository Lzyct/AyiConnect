import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String? name;

  const Location({this.name});

  @override
  List<Object?> get props => [name];
}
