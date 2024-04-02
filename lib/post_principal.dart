import 'package:examen/post_cubit.dart';
import 'package:examen/postsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class PostPage extends StatelessWidget {
 const PostPage({super.key});


 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: "FORM",
     home: BlocProvider(
       create: (context) => PostCubit()..fetchPosts() ,
       child: PostScreen()) ,
   );
 }
}