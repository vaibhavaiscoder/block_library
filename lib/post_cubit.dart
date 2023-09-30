import 'package:flutter_application_1/data_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post.dart';

abstract class PostsEvent {}

class LoadPostsEvent extends PostsEvent {}

class PullToRefreshEvent extends PostsEvent {}

abstract class PostsState {}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  List<Post> posts;
  LoadedPostsState({required this.posts});
}

class FailedToLoadPostsState extends PostsState {
  Error error;
  FailedToLoadPostsState({required this.error});
}

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _dataService = DataService();

  PostsBloc() : super(LoadingPostsState()) {
    on((event, emit) async {
      try {
        final data = await _dataService.getPosts();
        if (event is PullToRefreshEvent || event is LoadPostsEvent) {
          emit(LoadedPostsState(posts: data));
        }
      } on Error catch (e) {
        emit(FailedToLoadPostsState(error: e));
      }
    });
  }
}
