class UsersPosts {
  final int userId;
  final int id;
  final String title;
  final String body;

  UsersPosts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory UsersPosts.fromJson(Map<String, dynamic> json) {
    return UsersPosts(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
