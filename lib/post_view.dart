import 'package:flutter/material.dart';
import 'package:flutter_application_1/post_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is LoadingPostsState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedPostsState) {
            return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(state.posts[index].title),
                    ),
                  );
                });
          } else if (state is FailedToLoadPostsState) {
            return Center(
              child: Text('Error Occured: ${state.error}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
