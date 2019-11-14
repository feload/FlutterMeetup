import 'package:flutter/material.dart';

class MeetupHomeScreen extends StatefulWidget {
  static final String route = '/';

  @override
  State<StatefulWidget> createState() {
    return _MeetupHomeScreenState();
  }
}

class _MeetupHomeScreenState extends State<MeetupHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Column(
        children: <Widget>[
          MeetupCard(),
          MeetupCard(),
          MeetupCard()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class MeetupCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize:  MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://b.kisscc0.com/20180718/urw/kisscc0-ninja-computer-icons-samurai-youtube-avatar-ninja-5b4ed903c2dd20.4931332915318940197982.jpg'),
            ),
            title: Text('Meetup in New York'),
            subtitle: Text('Just a simple description'),
          ),
          ButtonTheme.bar(
            child:
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text('Visit Meetup'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('Favorite'),
                    onPressed: () {},
                  )
                ],
              ),
          )
        ],
      ),
    );
  }
}