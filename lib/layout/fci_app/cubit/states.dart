
import '../../../models/fci_app/lectures_model.dart';
import '../../../models/fci_app/home_model.dart';
import '../../../models/fci_app/news_feed_model.dart';
import '../../../models/fci_app/profile_model.dart';
import '../../../models/fci_app/quiz_model.dart';

abstract class FciStates {}

class FciInitialState extends FciStates {}
class FciChangeBottomNavState extends FciStates {}
//-----------------------------------------------------------------------------
// subject and lecture
class FciLoadingHomeDataState extends FciStates {}
class FciSuccessHomeDataState extends FciStates {
     final HomeModel homeModel;

     FciSuccessHomeDataState(this.homeModel);
}
class FciErrorHomeDataState extends FciStates {}

class FciLoadingLecturesDataState extends FciStates {}
class FciSuccessLecturesDataState extends FciStates {
  final LecturesModel lecturesModel;

  FciSuccessLecturesDataState(this.lecturesModel);
}
class FciErrorLecturesDataState extends FciStates {}

//-----------------------------------------------------------------------------
// posts and comments newfeed
class FciLoadingNewsFeedDataState extends FciStates {}
class FciSuccessNewsFeedDataState extends FciStates {
  final NewsFeedModel newsFeedModel;

  FciSuccessNewsFeedDataState(this.newsFeedModel);
}
class FciErrorNewsFeedDataState extends FciStates {}

class FciLoadingAddPostState extends FciStates {}
class FciSuccessAddPostState extends FciStates {
  final NewsFeedModel newsFeedModel;

  FciSuccessAddPostState(this.newsFeedModel);
}
class FciErrorAddPostState extends FciStates {
  final String error;

  FciErrorAddPostState(this.error);
}

class FciLoadingAddCommentState extends FciStates {}
class FciSuccessAddCommentState extends FciStates {
  final NewsFeedModel newsFeedModel;

  FciSuccessAddCommentState(this.newsFeedModel);
}
class FciErrorAddCommentState extends FciStates {
  final String error;

  FciErrorAddCommentState(this.error);
}

//-----------------------------------------------------------------------------
// posts and comments user profile
class FciLoadingUserDataState extends FciStates {}
class FciSuccessUserDataState extends FciStates {}
class FciErrorUserDataState extends FciStates {}

class FciLoadingAddUserPostState extends FciStates {}
class FciSuccessAddUserPostState extends FciStates {
  final ProfileModel profileModel;

  FciSuccessAddUserPostState(this.profileModel);
}
class FciErrorAddUserPostState extends FciStates {
  final String error;

  FciErrorAddUserPostState(this.error);
}

class FciLoadingDeleteUserPostState extends FciStates {}
class FciSuccessDeleteUserPostState extends FciStates {
  final ProfileModel profileModel;

  FciSuccessDeleteUserPostState(this.profileModel);
}
class FciErrorDeleteUserPostState extends FciStates {
  final String error;

  FciErrorDeleteUserPostState(this.error);
}

class FciLoadingPutUserPostState extends FciStates {}
class FciSuccessPutUserPostState extends FciStates {
  final ProfileModel profileModel;

  FciSuccessPutUserPostState(this.profileModel);
}
class FciErrorPutUserPostState extends FciStates {
  final String error;

  FciErrorPutUserPostState(this.error);
}

class FciLoadingAddUserCommentState extends FciStates {}
class FciSuccessAddUserCommentState extends FciStates {
  final ProfileModel profileModel;

  FciSuccessAddUserCommentState(this.profileModel);
}
class FciErrorAddUserCommentState extends FciStates {
  final String error;

  FciErrorAddUserCommentState(this.error);
}

class FciLoadingDeleteUserCommentState extends FciStates {}
class FciSuccessDeleteUserCommentState extends FciStates {
  final ProfileModel profileModel;

  FciSuccessDeleteUserCommentState(this.profileModel);
}
class FciErrorDeleteUserCommentState extends FciStates {
  final String error;

  FciErrorDeleteUserCommentState(this.error);
}

//-----------------------------------------------------------------------------
//update porfile
class FciLoadingUpdateUserState extends FciStates {}
class FciSuccessUpdateUserState extends FciStates {
  final ProfileModel profileModel;

  FciSuccessUpdateUserState(this.profileModel);
}
class FciErrorUpdateUserState extends FciStates {}

//-----------------------------------------------------------------------------
//quiz
class FciLoadingQuizDataState extends FciStates {}
class FciSuccessQuizDataState extends FciStates {
  final QuizModel quizModel;

  FciSuccessQuizDataState(this.quizModel);
}
class FciErrorQuizDataState extends FciStates {}