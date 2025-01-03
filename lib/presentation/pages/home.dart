import 'package:flutter/material.dart';
import 'package:flutter_app_test/data/datasource/data_source.dart';
import 'package:flutter_app_test/domain/models/users_posts.dart';


class MyHomePage extends StatefulWidget {
  final String title;
  final DataSource dataSource;

  const MyHomePage({
    Key? key,
    required this.title,
    required this.dataSource,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<UsersPosts>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = widget.dataSource.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: FutureBuilder<List<UsersPosts>>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 50, color: Colors.red),
                  Text('Error: ${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            final posts = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurpleAccent,
                      child: Text(
                        post.id.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      post.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      post.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      _showPostDetails(context, post);
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No posts found'));
          }
        },
      ),
    );
  }

  void _showPostDetails(BuildContext context, UsersPosts post) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(post.title),
          content: SingleChildScrollView(
            child: Text(post.body),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
