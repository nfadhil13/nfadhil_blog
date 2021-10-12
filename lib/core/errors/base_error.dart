import 'package:equatable/equatable.dart';

abstract class BaseError extends Equatable {
  final String message;

  const BaseError(this.message);
}

class ServerError extends BaseError {
  const ServerError(String message) : super(message);

  @override
  List<Object?> get props => [message];
}

class CacheError extends BaseError {
  const CacheError(String message) : super(message);

  @override
  List<Object?> get props => [message];
}

class UnknownError extends BaseError {
  

  const UnknownError(String message) : super(message);

  @override
  List<Object?> get props => [message];
}
