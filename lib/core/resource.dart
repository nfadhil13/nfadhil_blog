import 'package:nfadhil_blog/core/errors/base_error.dart';

abstract class Resource<T>  {
  void whenWithResult(
      {
        Function(Success<T>)? success,
        Function(Error)? error,
      }
      ) {
    if (this is Success<T>) {
      success == null ? DoNothing<T>() : success(this as Success<T>);
      return;
    } else if (this is Error) {
      error == null ? DoNothing<T>() : error(this as Error<T>);
      return;
    }
    throw Exception('Unhendled part, could be anything');
  }
}


class Success<T> extends Resource<T> {
  final T data;

  Success({required this.data});
}

class Error<T> extends Resource<T> {
  final BaseError error;

  Error({ required this.error});
}

class DoNothing<T> extends Resource<T> {
  DoNothing();
}