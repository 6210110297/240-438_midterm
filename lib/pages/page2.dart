import 'package:flutter/material.dart';
import 'package:midterm/main.dart';
import 'package:midterm/pages/main_page.dart';
import 'package:midterm/placeholder.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        route: AppConfig.routeList[2].route,
        body: PlaceholderWidget(Colors.grey));
  }
}
