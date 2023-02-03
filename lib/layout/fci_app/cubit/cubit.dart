import 'dart:convert';
import 'package:fci_project/layout/fci_app/cubit/states.dart';
import 'package:fci_project/modules/fci_app/cateogries/categories_screen.dart';
import 'package:fci_project/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/fci_app/lectures_model.dart';
import '../../../models/fci_app/home_model.dart';
import '../../../models/fci_app/news_feed_model.dart';
import '../../../models/fci_app/profile_model.dart';
import '../../../models/fci_app/quiz_model.dart';
import '../../../modules/fci_app/home/home_screen.dart';
import '../../../modules/fci_app/profile/profile_screenn.dart';
import '../../../modules/fci_app/quiz/screens/home/quizhome.dart';
import '../../../modules/fci_app/timeline/news_feed.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/end_points.dart';


class FciCubit extends Cubit<FciStates> {
  FciCubit() : super(FciInitialState());

  static FciCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    HomeScreen(),
    NewsFeed(),
    QuizHomeScreen(),
    ProfileScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(FciChangeBottomNavState());
  }
//-----------------------------------------------------------------------------
  HomeModel? homeModel;
  void getHomeData() {
    emit(FciLoadingHomeDataState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      print(value.data);
      homeModel = HomeModel.fromJson(value.data);
      emit(FciSuccessHomeDataState(homeModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FciErrorHomeDataState());
    });
  }

  LecturesModel? lecturesModel;
  void getLecturesData({required int id}) {
    emit(FciLoadingLecturesDataState());

    DioHelper.getData(
      url: LECTURE,
      token: token,
      query: {'pk': id},
    ).then((value) {
      print(value.data);
      lecturesModel = LecturesModel.fromJson(value.data);
      emit(FciSuccessLecturesDataState(lecturesModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FciErrorLecturesDataState());
    });
  }

//-----------------------------------------------------------------------------
   NewsFeedModel? newsFeedModel;
  void getNewsFeedData() {
    emit(FciLoadingNewsFeedDataState());
    DioHelper.getData(
      url: POST,
      token: token,
    ).then((value) {
      print(value.data);
      newsFeedModel = NewsFeedModel.fromJson(value.data);
      emit(FciSuccessNewsFeedDataState(newsFeedModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FciErrorNewsFeedDataState());
    });
  }

  void addPost({
    required var body,
  }) {
    emit(FciLoadingAddPostState());

    DioHelper.postsData(
      url: POST,
      token: token,
      data:
      {
        'body': body,
      },
    ).then((value) {
      print(value.data);
      newsFeedModel = NewsFeedModel.fromJson(value.data);
      emit(FciSuccessAddPostState(newsFeedModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FciErrorAddPostState(error.toString()));
    });
  }

  void addComment({
    required var body,
    required int id,
  }) {
    emit(FciLoadingAddCommentState());

    DioHelper.postsData(
      url: COMMENT,
      token: token,
      data:
      {
        'body': body,
      },
      query: {'pk':id},
    ).then((value) {
      print(value.data);
      newsFeedModel = NewsFeedModel.fromJson(value.data);
      emit(FciSuccessAddCommentState(newsFeedModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FciErrorAddCommentState(error.toString()));
    });
  }

//-----------------------------------------------------------------------------
  ProfileModel? profileModel;
  void getProfileData() {
    emit(FciLoadingUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      emit(FciSuccessUserDataState());
    }).catchError((error) {
      print(error.toString());
      emit(FciErrorUserDataState());
    });
  }

  void addUserPost({
    required var body,
  }) {
    emit(FciLoadingAddUserPostState());

    DioHelper.postsData(
      url: POST,
      token: token,
      data:
      {
        'body': body,
      },
    ).then((value) {
      print(value.data);
      profileModel = ProfileModel.fromJson(value.data);
      emit(FciSuccessAddUserPostState(profileModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FciErrorAddUserPostState(error.toString()));
    });
  }

  void addUserComment({
    required var body,
    required int id,
  }) {
    emit(FciLoadingAddUserCommentState());

    DioHelper.postsData(
      url: COMMENT,
      token: token,
      data:
      {
        'body': body,
      },
      query: {'pk':id},
    ).then((value) {
      print(value.data);
      profileModel = ProfileModel.fromJson(value.data);
      emit(FciSuccessAddUserCommentState(profileModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FciErrorAddUserCommentState(error.toString()));
    });
  }

  void deleteUserPost({
    required int id,
  }) {
    emit(FciLoadingDeleteUserPostState());

    DioHelper.deleteData(
      url: POST,
      token: token,
      query: {'pk':id},
    ).then((value) {
      print(value.data);
      profileModel = ProfileModel.fromJson(value.data);
      emit(FciSuccessDeleteUserPostState(profileModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FciErrorDeleteUserPostState(error.toString()));
    });
  }

  void deleteUserComment({
    required int id,
  }) {
    emit(FciLoadingDeleteUserCommentState());

    DioHelper.deleteData(
      url: COMMENT,
      token: token,
      query: {'pk':id},
    ).then((value) {
      print(value.data);
      profileModel = ProfileModel.fromJson(value.data);
      emit(FciSuccessDeleteUserCommentState(profileModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FciErrorDeleteUserCommentState(error.toString()));
    });
  }

  void updateUserPost({
    required String body,
    required int id,

  }) {
    emit(FciLoadingPutUserPostState());

    DioHelper.putData(
      url: POST,
      token: token,
      data: {
        'body': body,
      },
      query: {'pk':id},

    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      emit(FciSuccessPutUserPostState(profileModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FciErrorPutUserPostState(error.toString()));
    });
  }

//-----------------------------------------------------------------------------
  void updateUserData({
     required String fullname,
     required String username,
     required String about,
     required String date_of_birth,
   }) {
     emit(FciLoadingUpdateUserState());

     DioHelper.putData(
       url: UPDATE_PROFILE,
       token: token,
       data: {
         'fullname': fullname,
         'username': username,
         'about': about,
         'date_of_birth': date_of_birth,
       },
     ).then((value) {
       print(value.data);

      profileModel = ProfileModel.fromJson(value.data);
       emit(FciSuccessUpdateUserState(profileModel!));
     }).catchError((error) {
       print(error.toString());
      emit(FciErrorUpdateUserState());
    });
  }

//-----------------------------------------------------------------------------
  QuizModel? quizModel;
  void getQuizData({required int id}) {
    emit(FciLoadingQuizDataState());
    DioHelper.getData(
      url: Quiz,
      token: token,
      query: {'pk': id},
    ).then((value) {
      print(value.data);
      quizModel = QuizModel.fromJson(value.data);
      emit(FciSuccessQuizDataState(quizModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FciErrorQuizDataState());
    });
  }






 }

