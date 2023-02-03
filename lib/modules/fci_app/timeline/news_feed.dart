import 'package:fci_project/models/fci_app/news_feed_model.dart';
import 'package:fci_project/modules/fci_app/timeline/comments.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/fci_app/cubit/cubit.dart';
import '../../../layout/fci_app/cubit/states.dart';
import '../../../shared/components/components.dart';

class NewsFeed extends StatefulWidget {
  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

var formKey = GlobalKey<FormState>();
var addPostController = TextEditingController();
var addCommentController = TextEditingController();

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FciCubit, FciStates>(
      listener: (context, state) {
        if (state is FciSuccessNewsFeedDataState) {
          if (!state.newsFeedModel.status) {
            showToast(
              text: state.newsFeedModel.msg,
              state: ToastStates.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: FciCubit.get(context).newsFeedModel != null,
          builder: (context) => builderNewsWidget(
              FciCubit.get(context).newsFeedModel!, context, state),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

Widget builderNewsWidget(NewsFeedModel model, context, state) =>
    SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  'Posts',
                  style: TextStyle(color: Color(0xFF000000), fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Form(
            key: formKey,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white54,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    //blurRadius: 3.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state is FciLoadingAddPostState)
                        LinearProgressIndicator(),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                          controller: addPostController,
                          type: TextInputType.text,
                          validate: (var value) {
                            if (value.isEmpty) {
                              return 'please enter your post';
                            }
                          },
                          hint: 'Whats on your mind?',
                          label: '',
                          prefix: null),
                      Row(children: [
                        MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              FciCubit.get(context).addPost(
                                body: addPostController.text,
                              );
                              addPostController.clear();
                              if (model.status) {
                                FciCubit.get(context).getNewsFeedData();
                                showToast(
                                  text: 'Post added ',
                                  state: ToastStates.SUCCESS,
                                );
                              }
                            }
                          },
                          child: Text(
                            'Add Post',
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.upload,
                          color: Colors.blue,
                          size: 24.0,
                        ),
                      ]),
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            color: Colors.white54,
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(
                model.data.length,
                (index) =>
                    buildGridPosts(model, model.data[index], context, state),
              ),
            ),
          ),
        ],
      ),
    );

Widget buildGridPosts(NewsFeedModel model, Post post, context, state) =>
    GestureDetector(
      child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white54,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  //spreadRadius: 5.0,
                  //blurRadius: 5.0,
                ),
              ],
            ),
            margin: EdgeInsets.only(bottom: 15),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(
                              'https://uni-platform.herokuapp.com' +
                                  post.user.image),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.user.fullname,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              post.createdAt,
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 10),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 160.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white54,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 3.0,
                          ),
                        ],
                      ),
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          post.body,
                          style:
                              TextStyle(color: Color(0xFF000000), fontSize: 12),
                          maxLines: 3,
                          textDirection: TextDirection.rtl,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            navigateTo(context, CommentsScreen());
                          },
                          child: Text(
                            'Comments',
                            style: TextStyle(
                                color: Color(0xFF000000), fontSize: 16),
                          )),
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(
                        post.postComments.length,
                        (index) =>
                            buildGridComment(post.postComments[index], context),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white54,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 3.0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (state is FciLoadingAddCommentState)
                                LinearProgressIndicator(),
                              SizedBox(
                                height: 20.0,
                              ),
                              defaultFormField(
                                controller: addCommentController,
                                type: TextInputType.text,
                                validate: (var value) {
                                  if (value.isEmpty) {
                                    return 'please enter your Comment';
                                  }
                                },
                                label: '',
                                prefix: null,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    FciCubit.get(context).addComment(
                                      body: addCommentController.text,
                                      id: post.id,
                                    );
                                    addCommentController.clear();
                                    if (model.status) {
                                      FciCubit.get(context).getNewsFeedData();
                                      showToast(
                                        text: 'Comment added ',
                                        state: ToastStates.SUCCESS,
                                      );
                                    }
                                  }
                                },
                                child: Text(
                                  'Add Comment',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ]),
            ),
          )),
    );

Widget buildGridComment(Comments comments, context) => GestureDetector(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white54,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                //spreadRadius: 5.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                          'https://uni-platform.herokuapp.com' +
                              comments.user.image),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comments.user.fullname,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          comments.createdAt,
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: Container(
                    alignment: Alignment.topRight,
                    height: 50.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        comments.body,
                        style:
                            TextStyle(color: Color(0xFF000000), fontSize: 10),
                        maxLines: 2,
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
