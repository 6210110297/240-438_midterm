import 'package:hive/hive.dart';
part 'page_number.g.dart';

@HiveType(typeId: 0)
class PageNumber extends HiveObject {
  @HiveField(0)
  late int number;
}
