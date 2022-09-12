part of 'register_cubit.dart';

enum RegisterStatus {
  loading,
  success,
  failure;

  bool get isLoading => this == RegisterStatus.loading;

  bool get isSuccess => this == RegisterStatus.success;

  bool get isFailure => this == RegisterStatus.failure;
}

class RegisterState extends Equatable {
  final RegisterStatus status;
  final Location? location;
  final String? message;
  final List<Location>? locations;

  const RegisterState({
    this.status = RegisterStatus.loading,
    this.location,
    this.message,
    this.locations,
  });

  RegisterState copyWith({
    RegisterStatus? status,
    Location? location,
    String? message,
    List<Location>? locations,
  }) {
    return RegisterState(
      status: status ?? this.status,
      location: location ?? this.location,
      message: message ?? this.message,
      locations: locations ?? this.locations,
    );
  }

  @override
  List<Object?> get props => [
        status,
        location,
        message,
        locations,
      ];
}
