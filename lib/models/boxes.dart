import 'package:hive/hive.dart';
import 'package:midterm/models/list_item.dart';
import 'package:midterm/models/page_number.dart';

class Boxes {
  static Box<PageNumber> getPageNumber() => Hive.box<PageNumber>('page_number');
  static Box<ListItem> getListItems() => Hive.box<ListItem>('list');
}
