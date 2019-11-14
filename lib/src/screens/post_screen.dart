import 'package:flutter/material.dart';
import 'package:flutter_meetup/src/models/post.dart';
import 'package:flutter_meetup/src/scoped_model/post_model.dart';
import 'package:flutter_meetup/src/services/post_api_provider.dart';
import 'package:flutter_meetup/src/widgets/bottom_navigation.dart';
import 'package:scoped_model/scoped_model.dart';

class PostScreen extends StatefulWidget {
  final PostApiProvider api = PostApiProvider();

  @override
  State<StatefulWidget> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  // InitState gets executed only once.
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return ScopedModel<PostModel>(
      model: PostModel(),
      child: _PostList(),
    );
  }
}

class _PostList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return ScopedModelDescendant<PostModel>(
      builder: (context, _, model) {
        return Scaffold(
          body: ListView.builder(
            itemCount: model.posts.length * 2,
            itemBuilder: (BuildContext context, int i) {

              if (i.isOdd) {
                return Divider();
              }

              final index = i ~/ 2;

              return ListTile(
                title: Text(model.posts[index].title),
                subtitle: Text(model.posts[index].body),
              );
            },
          ),
          bottomNavigationBar: BottomNavigation(),
          floatingActionButton: _PostButton(),
          appBar: AppBar(title: Text(model.testingState))
        );
      },
    );
  }
}

class _PostButton extends StatelessWidget {
  Widget build(BuildContext context) {
    // By doing this, we can get more than one scoped model.
    final postModel = ScopedModel.of<PostModel>(context, rebuildOnChange: true);
    return FloatingActionButton(
      tooltip: 'Add Post',
      child: Icon(Icons.add),
      onPressed: postModel.addPost
    );
  }
}



/*
  AN IMPORTANT NOTE ABOUT INHERITEDWIDGETS:

  An InheritedWidget allows you to share any object with other widgets in execution time. It has a special method called "of" to get an instance of the class that holds the objects to share. The trick is made by the "updateShouldNotify" method which is responsible for kinda update its state along the application.
*/

class _InheritedPost extends InheritedWidget {
  final List<Post> posts;
  final Function addPost;
  final Widget child;

  _InheritedPost({ this.child, this.posts, this.addPost }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedPost) as _InheritedPost);
  }
}
