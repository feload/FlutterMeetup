import 'package:flutter/material.dart';
import 'package:flutter_meetup/src/screens/meetup_detail_screen.dart';
import 'package:flutter_meetup/src/screens/meetup_home_screen.dart';

void main() => runApp(MeetuperApp());

class MeetuperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MeetupHomeScreen(),
      routes: {
        MeetupDetailScreen.route: (context) => MeetupDetailScreen()
      },
    );
  }
}
