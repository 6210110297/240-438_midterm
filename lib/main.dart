import 'package:flutter/material.dart';
import 'package:midterm/models/numBox.dart';
import 'package:midterm/models/page_number.dart';
import 'package:midterm/pages/main_page.dart';
import 'package:midterm/placeholder.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('page_number');

  // Hive.registerAdapter()

  runApp(MainPage());
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           // This is the theme of your application.
//           //
//           // Try running your application with "flutter run". You'll see the
//           // application has a blue toolbar. Then, without quitting the app, try
//           // changing the primarySwatch below to Colors.green and then invoke
//           // "hot reload" (press "r" in the console where you ran "flutter run",
//           // or simply save your changes to "hot reload" in a Flutter IDE).
//           // Notice that the counter didn't reset back to zero; the application
//           // is not restarted.
//           primarySwatch: Colors.blue,
//         ),
//         home: MainPage());
//   }
// }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    final box = NumBox.getPageNumber();
    box.put('number', _counter);
  }

  @override
  void initState() {
    final box = NumBox.getPageNumber();
    if (box.get('number') == null) {
      box.put('number', 0);
    }

    super.initState();
  }

  // @override
  // void dispose() {
  //   Hive.box('page_number').close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MyScaffold(
      route: AppConfig.routeList[0].route,
      body: Scaffold(
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: ValueListenableBuilder<Box>(
            valueListenable: NumBox.getPageNumber().listenable(),
            builder: (context, box, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${box.get('number')}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              );
            },
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Text(
            //       'You have pushed the button this many times:',
            //     ),
            //     Text(
            //       '$_counter',
            //       style: Theme.of(context).textTheme.headline4,
            //     ),
            //   ],
            // ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class AppConfig {
  static String appTitle = 'MidtermTest';
  static List<RouteApp> routeList = [
    RouteApp(widget: MyHomePage(), route: '/'),
    RouteApp(widget: Page1(), route: '/1'),
    RouteApp(widget: Page2(), route: '/2'),
  ];
}

class RouteApp {
  final Widget widget;
  final String route;
  RouteApp({required this.widget, required this.route});
}
