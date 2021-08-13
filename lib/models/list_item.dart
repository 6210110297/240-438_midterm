import 'package:hive/hive.dart';
part 'list_item.g.dart';

@HiveType(typeId: 1)
class ListItem extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  int index;
  ListItem({this.name = '', this.index = -1});
}
