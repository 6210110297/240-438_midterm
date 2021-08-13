import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:midterm/main.dart';
import 'package:midterm/placeholder.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appTitle,
      onGenerateRoute: (setting) {
        return PageRouteBuilder(
            settings: setting,
            pageBuilder: (_, __, ___) {
              return _getWidgetFromPage(settings: setting);
            });
      },
    );
  }

  Widget _getWidgetFromPage({required RouteSettings settings}) {
    final uri = Uri.parse(settings.name ?? '');
    print(uri);
    if (uri.path == '/') {
      return AppConfig.routeList[0].widget;
    } else if (uri.path == '/1') {
      return AppConfig.routeList[1].widget;
    } else if (uri.path == '/2') {
      return AppConfig.routeList[2].widget;
    } else {
      return Text('Error');
    }
  }
}

class MyScaffold extends StatefulWidget {
  final String route;
  final Widget body;
  MyScaffold({required this.route, required this.body});
  @override
  _MyMainState createState() => _MyMainState();
}

class _MyMainState extends State<MyScaffold> {
  int _currentIndex = 0;

  @override
  void initState() {
    _currentIndex = AppConfig.routeList
        .indexWhere((appRoute) => appRoute.route == widget.route);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppConfig.appTitle),
      ),
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.pages), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.pages), label: 'Home'),
        ],
      ),
    );
  }

  void onTapTapped(int value) {
    setState(() {
      Navigator.of(context).pushNamed(AppConfig.routeList[value].route);
    });
  }
}
