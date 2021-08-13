import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:midterm/models/boxes.dart';
import 'package:midterm/models/last_time_item.dart';

class LastTimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [],
          ),
        ),
        ValueListenableBuilder<Box<LastTimeItem>>(
            valueListenable: Boxes.getListItems().listenable(),
            builder: (context, box, _) {
              return ListView.builder(itemBuilder: (context, index) {
                return Text('$index');
              });
            }),
      ],
    );
  }
}
