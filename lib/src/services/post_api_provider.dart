import 'package:flutter_meetup/src/models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostApiProvider {

  static final PostApiProvider _singleton = PostApiProvider._internal();
  factory PostApiProvider () {
    return _singleton;
  }

  PostApiProvider._internal();

  Future<List<Post>> fetchPosts() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/posts');
    final List<dynamic> parsedPosts = json.decode(response.body);
    return parsedPosts.map((parsedPost) => new Post.fromJSON(parsedPost)).take(2).toList();
  }
}