import 'package:flutter/material.dart';
import 'package:flutter_application_1/post_cubit.dart';
import 'package:flutter_application_1/post_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider<PostsCubit>(
            create: (context) => PostsCubit()..getPosts(),
            child: const PostsView()));
  }
}
