import 'package:flutter/material.dart';
import 'package:flutter_meetup/src/widgets/bottom_navigation.dart';

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
            FlatButton(child: Text('Click'), onPressed: _increment),
            RaisedButton(
              child: Text('Go to Detail'),
              onPressed: () => {
                Navigator.pushNamed(context, '/meetupDetail')
              },
            )
          ],
        )
      ),
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(title: Text(widget._title))
    );
  }
}
