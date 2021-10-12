import 'package:hive/hive.dart';

abstract class BaseEntity<DomainModel> extends HiveObject {
  DomainModel toDomainModel();
  
}
