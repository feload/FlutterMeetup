import 'package:flutter/material.dart';

class CounterHomeScreen extends StatefulWidget {
  final String _title;
  CounterHomeScreen({String title}): _title = title;

  @override
  State<StatefulWidget> createState() => CounterHomeScreenState();
}

class CounterHomeScreenState extends State<CounterHomeScreen> {
  int _counter = 0;

  void _increment () {
    setState(() {
      _counter = _counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome in ${widget._title}, let\'s increment numbers.', style: TextStyle(fontSize: 15.0),),
            Text('Click counter: $_counter', style: TextStyle(fontSize: 40.0)),
            FlatButton(child: Text('Click'), onPressed: _increment)
          ],
        )
      ),
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(title: Text(widget._title))
    );
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int currentIndex = 0;
  void changeIndex(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: changeIndex,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings')
        ),
      ],
    );
  }

}