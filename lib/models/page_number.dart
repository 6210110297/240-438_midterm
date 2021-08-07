import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class PageNumber extends HiveObject {
  @HiveField(0)
  late int number;
}
