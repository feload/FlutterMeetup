import 'package:flutter/material.dart';
import 'package:flutter_meetup/src/widgets/bottom_navigation.dart';

class MeetupDetailScreen extends StatelessWidget {
  static final String route = '/meetupDetail';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Meetup Detail"),),
      body: Text("I am Meetup detail Screen"),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}