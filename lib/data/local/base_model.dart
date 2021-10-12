import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

abstract class BaseEntity<DomainModel> extends Equatable{
  DomainModel toDomainModel();
  
}
