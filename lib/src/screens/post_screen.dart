import 'package:flutter/material.dart';
import 'package:flutter_meetup/src/models/post.dart';
import 'package:flutter_meetup/src/services/post_api_provider.dart';
import 'package:flutter_meetup/src/widgets/bottom_navigation.dart';

class PostScreen extends StatefulWidget {
  final PostApiProvider api = PostApiProvider();

  @override
  State<StatefulWidget> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Post> _posts = [];

  // InitState gets executed only once.
  void initState() {
    super.initState();
    this._fetchPosts();
  }

  _fetchPosts() async {
    List<Post> posts = await widget.api.fetchPosts();
    setState(() {
      _posts = posts;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _PostList(_posts),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      appBar: AppBar(title: Text("Posts"),),
    );
  }
}

class _PostList extends StatelessWidget{
  List<Post> _posts = [];
  _PostList(posts): _posts = posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _posts.length * 2,
      itemBuilder: (BuildContext context, int i) {

        if (i.isOdd) {
          return Divider();
        }

        final index = i ~/ 2;

        return ListTile(
          title: Text(_posts[index].title),
          subtitle: Text(_posts[index].body),
        );
      },
    );
  }
}