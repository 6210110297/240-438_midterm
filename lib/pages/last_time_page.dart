import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:midterm/models/boxes.dart';
import 'package:midterm/models/last_time_item.dart';

import '../main.dart';

class LastTimePage extends StatefulWidget {
  @override
  _LastTimePageState createState() => _LastTimePageState();
}

class _LastTimePageState extends State<LastTimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showAddLastTime(context);
          }),
      body: Column(
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
                final lastTimeList = box.values.toList().cast<LastTimeItem>();
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: lastTimeList.length,
                    itemBuilder: (context, index) {
                      final lastTime = lastTimeList[index];
                      return lastTimeBox(lastTime);
                    });
              }),
        ],
      ),
    );
  }

  Widget lastTimeBox(LastTimeItem lastTime) {
    return ListTile(
      key: ValueKey(lastTime),
      title: Text(
        lastTime.title,
      ),
      trailing: Text(lastTime.lastTime.toString()),
    );
  }
}

void showAddLastTime(BuildContext context) {
  final LastTimeItem newLastTime =
      LastTimeItem(tag: 'normal', lastTime: DateTime.now());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        actions: <Widget>[
          Column(
            children: [
              Text('Title'),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
                onChanged: (value) {
                  newLastTime.title = value;
                  newLastTime.lastTime = DateTime.now();
                },
              ),
              Text('Tag'),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tag',
                ),
                onChanged: (value) {
                  newLastTime.tag = value;
                  newLastTime.lastTime = DateTime.now();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    child: new Text(
                      "Yes",
                      style: Theme.of(context).textTheme.overline,
                      textScaleFactor: 0.9,
                    ),
                    onPressed: () {
                      Boxes.getListItems().add(newLastTime);
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: new Text(
                      "No",
                      style: Theme.of(context).textTheme.headline3,
                      textScaleFactor: 0.9,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    },
  );
}
