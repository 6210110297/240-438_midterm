import 'package:hive/hive.dart';
import 'package:midterm/models/last_time_item.dart';
import 'package:midterm/models/page_number.dart';

class Boxes {
  static Box<PageNumber> getPageNumber() => Hive.box<PageNumber>('page_number');
  static Box<LastTimeItem> getListItems() =>
      Hive.box<LastTimeItem>('last_time_list');
}
