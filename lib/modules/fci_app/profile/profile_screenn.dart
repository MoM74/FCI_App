import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fci_project/layout/fci_app/cubit/cubit.dart';
import 'package:fci_project/modules/fci_app/profile/update_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/fci_app/cubit/states.dart';
import '../../../models/fci_app/profile_model.dart';
import '../../../shared/components/components.dart';
import '../settings/settings_screen.dart';
import '../timeline/comments.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
var formKey = GlobalKey<FormState>();
var addPostController = TextEditingController();
var addCommentController = TextEditingController();
class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FciCubit, FciStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: FciCubit.get(context).profileModel != null,
          builder: (context) => builderWidget(FciCubit.get(context).profileModel!,context, state),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
Widget builderWidget(ProfileModel model, context, state) =>
    SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child:  CircleAvatar(radius: 55.0,
                  backgroundImage:NetworkImage('https://uni-platform.herokuapp.com'+model.data.image) ,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  Text(
                        model.data.fullname,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines : 1,
                        overflow :TextOverflow.ellipsis,
                      ),

                   IconButton(onPressed: () {
                     navigateTo(context,SettingsScreen());
                   },
                     icon: Icon(Icons.edit),
                      color: Colors.blue,
                      iconSize:24),
                 ],
               ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  Icon(Icons.email,
                      color: Colors.blue ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Text(
                          model.data.email,
                          style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          ),
                          maxLines : 1,
                          overflow :TextOverflow.ellipsis,
                    ),
                  ),
                ]
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                  children: [
                    SizedBox(
                      width: 20.0,
                    ),
                    Icon(Icons.person,
                        color: Colors.blue ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child:Text(
                          model.data.username,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines : 1,
                          overflow :TextOverflow.ellipsis,
                    ),
                    ),
                  ]
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                  children: [
                    SizedBox(
                      width: 20.0,
                    ),
                    Icon(Icons.article,
                    color: Colors.blue),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Text(
                            model.data.about,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines : 3,
                            overflow :TextOverflow.ellipsis,
                          ),
                    ),
                  ]
              ),
              SizedBox(
                height: 20.0,
              ),
              Form(
                key: formKey,
                child: Container(
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
                    child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if(state is FciLoadingAddPostState)
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
                              hint: 'Whats on your mind?'
                          ),
                          Row(
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        FciCubit.get(context).addUserPost(
                                          body: addPostController.text,
                                        );
                                        addPostController.clear();
                                        if(model.status){
                                          FciCubit.get(context).getProfileData();
                                          showToast(
                                            text: 'Post added ',
                                            state: ToastStates.SUCCESS,
                                          );
                                        }

                                      }
                                  },

                                  child:Text('Add Post', style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16),
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
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(
                        model.data.userPosts.length,
                            (index) => buildGridPosts(index,model,model.data.userPosts[index], context,state),
                      ),
                    ),
                  ),
                ),
            ]
        )
    );

Widget buildGridPosts(int d,ProfileModel model,UserPosts userPosts, context,state) => GestureDetector(
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
        margin: EdgeInsets.only(bottom:15),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(radius: 30.0,
                      backgroundImage:NetworkImage('https://uni-platform.herokuapp.com'+userPosts.user.image),),
                    SizedBox(width: 10.0,),
                    Container(
                      width:170,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userPosts.user.fullname, style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 12,
                          fontWeight: FontWeight.bold,),
                            maxLines : 2,
                            overflow :TextOverflow.ellipsis,),
                          Text(userPosts.createdAt, style: TextStyle(
                              color: Colors.blue,
                              fontSize: 8),
                            maxLines : 1,
                            overflow :TextOverflow.ellipsis,),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Expanded(
                      child: IconButton(
                        icon:Icon(Icons.delete,),
                        color: Colors.red,
                        iconSize:32,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            FciCubit.get(context).deleteUserPost(
                              id: userPosts.id,
                            );
                            if(model.status){
                              FciCubit.get(context).getProfileData();
                              showToast(
                                text: 'Post deleted ',
                                state: ToastStates.SUCCESS,
                              );


                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Expanded(
                      child: IconButton(
                        icon:Icon(Icons.update,),
                        color: Colors.green,
                        iconSize:32,
                        onPressed: () {
                           navigateTo(context,UpdatePost(id:d));
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Container(height: 150.0,
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
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(userPosts.body, style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 12),
                      maxLines:5,
                      overflow :TextOverflow.ellipsis,
                    ),
                  ),),
                SizedBox(height: 10.0,),
                Center(
                  child:TextButton(
                      onPressed:(){
                        navigateTo(context, CommentsScreen());

                      },
                      child:Text('Comments', style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 16),)
                  ),),
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(
                    userPosts.postComments.length,
                        (index) => buildGridComment(model, userPosts.postComments[index], context),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width:double.infinity,
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
                    child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if(state is FciLoadingAddUserCommentState)
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
                          ),
                          MaterialButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                FciCubit.get(context).addUserComment(
                                  body: addCommentController.text,
                                  id: userPosts.id,
                                );
                                addCommentController.clear();
                                if(model.status){
                                  FciCubit.get(context).getProfileData();
                                  showToast(
                                    text: 'Comment added ',
                                    state: ToastStates.SUCCESS,
                                  );

                                }
                              }
                            },
                            child:Text('Add Comment', style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16),
                            ),
                          ),
                        ]),
                  ),
                ),

              ]
          ),
        ),
      )
  ),
);

Widget buildGridComment(ProfileModel model,PostComments postComments, context) => GestureDetector(
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 25.0,
                  backgroundImage:NetworkImage('https://uni-platform.herokuapp.com'+postComments.user.image),),
                SizedBox(width: 10.0,),
                Container(
                  width:160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(postComments.user.fullname, style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,),
                        maxLines : 2,
                        overflow :TextOverflow.ellipsis,),
                      Text(postComments.createdAt, style: TextStyle(
                          color: Colors.grey,
                          fontSize: 8),
                        maxLines : 1,
                        overflow :TextOverflow.ellipsis,),
                    ],
                  ),
                ),
                SizedBox(width: 10.0,),
                Expanded(
                  child: IconButton(
                    icon:Icon(Icons.delete,),
                    color: Colors.red,
                    iconSize:32,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        FciCubit.get(context).deleteUserComment(
                          id: postComments.id,
                        );
                        if(model.status){
                          FciCubit.get(context).getProfileData();
                          showToast(
                            text: 'Comment deleted ',
                            state: ToastStates.SUCCESS,
                          );

                        }
                      }
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left:60.0),
              child: Container(
                alignment: Alignment.topRight,
                height: 50.0,
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(postComments.body, style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 10),
                    maxLines : 2,
                    overflow :TextOverflow.ellipsis,),
                ),),
            ),
          ],
        ),
      ),
    ),
  ),
);