
import 'package:faker/faker.dart';
import 'package:flutter_meetup/src/models/post.dart';
import 'package:flutter_meetup/src/services/post_api_provider.dart';
import 'package:scoped_model/scoped_model.dart';

class PostModel extends Model {
  List<Post> posts = [];
  final testingState = 'Testing state';
  final PostApiProvider _api = PostApiProvider();

  PostModel() {
    _fetchPosts();
  }

  _fetchPosts() async {
    posts = await _api.fetchPosts();
    notifyListeners();
  }

  addPost() {
    final int id = faker.randomGenerator.integer(9999);
    final String title = faker.food.dish();
    final String body = faker.food.cuisine();
    final Post newPost = Post(id: id, title: title, body: body);

    posts.add(newPost);
    notifyListeners();
  }
}