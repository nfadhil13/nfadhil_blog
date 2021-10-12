import 'package:equatable/equatable.dart';

import 'resource.dart';

abstract class UseCase<Type, Params> {
  Future<Resource<Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
