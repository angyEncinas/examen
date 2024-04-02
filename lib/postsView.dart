
import 'package:examen/post_cubit.dart';
import 'package:examen/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget{
  @override
  _PostScreenState createState() => _PostScreenState();
}
class _PostScreenState extends State<PostScreen>{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis posts'),
      ),
      body: Column(
        children: [
          BlocBuilder<PostCubit,PostState>(
              builder: (context,state){
              if(state is PostLoading){
                return Center(child: CircularProgressIndicator());
              }else if(state is PostSuccess){
                return buildPostList(context);
              }else if (state is PostError){
                return Text("Error");
              }
              return Container();
              }),
        
        ],
      ),
    );
  }
  Widget buildPostList(BuildContext context) {
            final posts = context.select((PostCubit cubit) => cubit.posts);
            if (posts.isEmpty) {
              return Center(child: Text('No hay películas para mostrar'));
            }
            
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Container(
                height: 50,
                child: Center(child: Text('Entry ${posts[index]}')),
              );
              },
            );
}
}



