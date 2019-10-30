class Post {
  final int id;
  final String title;
  final String body;

  Post({ int id, String title, String body }) : this.title = title, this.id = id, this.body = body;

  Post.fromJSON(Map<String, dynamic> parsedJson)
    : id = parsedJson['id'],
      title = parsedJson['title'],
      body = parsedJson['body'];

}