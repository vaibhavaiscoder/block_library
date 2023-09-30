import 'package:flutter_application_1/data_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]);

  void getPosts() async => emit(await _dataService.getPosts());
}
