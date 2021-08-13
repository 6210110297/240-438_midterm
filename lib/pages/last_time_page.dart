import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

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
            showAddLastTime();
          }),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [],
              ),
            ),
            Container(
              width: 500,
              alignment: Alignment.center,
              child: ValueListenableBuilder<Box<LastTimeItem>>(
                  valueListenable: Boxes.getListItems().listenable(),
                  builder: (context, box, _) {
                    final lastTimeList =
                        box.values.toList().cast<LastTimeItem>();
                    return ReorderableListView.builder(
                      shrinkWrap: true,
                      itemCount: lastTimeList.length,
                      itemBuilder: (context, index) {
                        final lastTime = lastTimeList[index];
                        return lastTimeBox(lastTime);
                      },
                      onReorder: (int start, int current) {
                        List<LastTimeItem> _list = List.from(lastTimeList);
                        // dragging from top to bottom
                        if (start < current) {
                          int end = current - 1;
                          LastTimeItem startItem = _list[start];
                          int i = 0;
                          int local = start;
                          do {
                            _list[local] = _list[++local];
                            i++;
                          } while (i < end - start);
                          _list[end] = startItem;
                        }
                        // dragging from bottom to top
                        else if (start > current) {
                          LastTimeItem startItem = _list[start];
                          for (int i = start; i > current; i--) {
                            _list[i] = _list[i - 1];
                          }
                          _list[current] = startItem;
                        }
                        print('reoder');
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget lastTimeBox(LastTimeItem lastTime) {
    return ListTile(
      onTap: () {
        showEditLastTime(lastTime: lastTime);
      },
      key: ValueKey(lastTime),
      leading: Text(
        lastTime.title,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(lastTime.tag),
          // Text(DateFormat("yyyy-MM-dd").format(lastTime.lastTime)),
          Text(lastTime.lastTime.toString()),
        ],
      ),
    );
  }

  DateTime updateDate() {
    var now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  void showEditLastTime({required LastTimeItem lastTime}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text('Do you want to update lastTime doing?'),
          actions: <Widget>[
            Column(
              children: [
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
                        lastTime.lastTime = DateTime.now();
                        lastTime.save();
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

  void showAddLastTime() {
    final LastTimeItem newLastTime =
        LastTimeItem(tag: 'Normal', lastTime: DateTime.now());
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
                    labelText: newLastTime.title,
                  ),
                  onChanged: (value) {
                    newLastTime.title = value;
                    newLastTime.lastTime = DateTime.now();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Tag'),
                DropdownButton<String>(
                  value: newLastTime.tag,
                  icon: const Icon(Icons.pages),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    newLastTime.tag = newValue!;
                  },
                  items: <String>['Normal', 'Important', 'Work', 'Home']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
}
