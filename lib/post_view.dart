import 'package:flutter/material.dart';
import 'package:flutter_application_1/post_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'post.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<PostsCubit, List<Post>>(
        builder: (context, posts) {
          if (posts.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(itemCount: posts.length,itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(posts[index].title),
              ),
            );
          });
        },
      ),
    );
  }
}
