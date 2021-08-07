import 'package:hive/hive.dart';
import 'package:midterm/models/page_number.dart';

class NumBox {
  static Box getPageNumber() => Hive.box('page_number');
}
