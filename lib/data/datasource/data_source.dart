
import 'package:flutter_app_test/core/api_factory.dart';
import 'package:flutter_app_test/domain/models/users_posts.dart';

class DataSource {
  final ApiFactory _apiFactory;

  DataSource(this._apiFactory);

  Future<List<UsersPosts>> fetchPosts() async {
    try {
      final response = await _apiFactory.getRequest('/posts');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print('all data $data');
        return data.map((json) => UsersPosts.fromJson(json)).toList();

      } else {
        throw Exception('Failed to fetch posts: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching posts: $e');
    }
  }

  Future<UsersPosts> fetchPostById(int id) async {
    try {
      final response = await _apiFactory.getRequest('/posts/$id');
      if (response.statusCode == 200) {
          print('$id data $response.data');
        return UsersPosts.fromJson(response.data);

      } else {
        throw Exception('Failed to fetch post: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching post: $e');
    }
  }
}
