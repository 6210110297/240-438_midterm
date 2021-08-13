import 'package:hive/hive.dart';
part 'last_time_item.g.dart';

@HiveType(typeId: 2)
class LastTimeItem extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String tag;
  @HiveField(2)
  DateTime lastTime;
  LastTimeItem(
      {this.title = 'Untitled LastTimeItem',
      required this.tag,
      required this.lastTime});
}

enum LastTimeTag { normal, important, work, home }
