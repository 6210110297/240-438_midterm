import 'package:hive/hive.dart';
import 'package:midterm/models/page_number.dart';

class NumBox {
  static Box<PageNumber> getPageNumber() => Hive.box<PageNumber>('page_number');
}
