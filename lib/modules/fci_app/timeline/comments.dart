import 'package:fci_project/models/fci_app/news_feed_model.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/fci_app/cubit/cubit.dart';
import '../../../layout/fci_app/cubit/states.dart';

class CommentsScreen extends StatefulWidget {
  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<FciCubit, FciStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: FciCubit.get(context).newsFeedModel != null,
          builder: (context) => builderNewsWidget(FciCubit.get(context).newsFeedModel!,context),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
Widget builderNewsWidget(NewsFeedModel model, context) =>
  Scaffold(
    appBar: AppBar(
      title: Text(
        'Comments',
      ),
    ),
    body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
         padding: const EdgeInsets.all(10.0),
         child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                 ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                              children: List.generate(
                                     model.data.length,
                                    (index) => buildGridPosts( model.data[index], context),
                          ),
              ),
            ]
        ),
      ),
    ),
);


Widget buildGridPosts(Post post, context) =>
    Container(
      margin: EdgeInsets.only(bottom:3),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(
          post.postComments.length,
              (index) => buildGridComment(post.postComments[index], context),
        ),),);

Widget buildGridComment(Comments comments, context) =>
        Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15.0),
    color: Colors.grey,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade300,
        spreadRadius: 5.0,
        blurRadius: 5.0,
      ),
    ],
  ),
                child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(radius: 30.0,
                                  backgroundImage:NetworkImage('https://uni-platform.herokuapp.com'+comments.user.image),),
                                SizedBox(width: 10.0,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(comments.user.fullname, style: TextStyle(
                                          color: Color(0xFF005EFF),
                                          fontSize: 17),
                                        maxLines : 2,
                                        overflow :TextOverflow.ellipsis,),
                                      Text(comments.createdAt, style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12),
                                        maxLines : 1,
                                        overflow :TextOverflow.ellipsis,),


                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:60.0),
                              child: Container(
                                alignment: Alignment.topRight,
                                height: 100.0,
                                child:Text(comments.body, style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 16),

                                  maxLines : 4,
                                  overflow :TextOverflow.ellipsis,),),
                            ),
                          ],
                        ),
                ),
);