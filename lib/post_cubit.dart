
import 'package:bloc/bloc.dart';
import 'package:examen/post_state.dart';
import 'package:dio/dio.dart';



class PostCubit extends Cubit<PostState> {

 PostCubit() : super(PostInitial());
  final Dio _dio = Dio();
  List<dynamic> posts = [];

  void fetchPosts() async {
    emit(PostLoading());
    try {
      final response = await _dio.get(
          'https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        emit(PostSuccess());
      } else {
        emit(PostError());
      }
    } catch (e) {
      emit(PostError());
    }
  }
}