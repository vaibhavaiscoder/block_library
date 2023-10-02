import 'package:flutter/material.dart';
import 'package:flutter_application_1/nav_cubit.dart';
import 'package:flutter_application_1/post_details_view.dart';
import 'package:flutter_application_1/post_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Post?>(builder: ((context, post) {
      return Navigator(
        pages: [
          const MaterialPage(child: PostsView()),
          if(post!=null)
          MaterialPage(child: PostDetailsView(post: post))
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToPosts();
          return route.didPop(result);
        },
    

      );
    }
    ));
  }
}
