import 'package:fci_project/modules/fci_app/home/home_screen.dart';
import 'package:fci_project/modules/fci_app/login/login_screen.dart';
import 'package:fci_project/modules/fci_app/welcome_screen.dart';
import 'package:fci_project/layout/fci_app/cubit/cubit.dart';
import 'package:fci_project/layout/fci_app/fci_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fci_project/shared/components/constants.dart';
import 'package:fci_project/shared/bloc_observer.dart';
import 'package:fci_project/shared/cubit/cubit.dart';
import 'package:fci_project/shared/cubit/states.dart';
import 'package:fci_project/shared/network/local/cache_helper.dart';
import 'package:fci_project/shared/network/remote/dio_helper.dart';
import 'package:fci_project/shared/styles/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:bloc/bloc.dart';

import 'modules/fci_app/on_boarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   // Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  // var isDark = CacheHelper.getData(key: 'isDark');
  Widget widget;

  var onBoarding = CacheHelper.getData(key: 'onBoarding');
  var token = CacheHelper.getData(key: 'token');
  print(token);

  if (onBoarding != null) {

    if (token != null) {
      widget = FciLayout();
    } else {
      widget = LoginScreen();
           }
  }
   else {
      widget =OnBoardingScreen();
  }


  runApp(MyApp(
    //isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  //final bool isDark;
  final Widget startWidget;

  MyApp({
    //required this.isDark,
    required this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (BuildContext context) => AppCubit()
            //..changeAppMode(fromShared: isDark,),
        ),
        BlocProvider(
        create: (BuildContext context) => FciCubit()
                ..getHomeData()
                ..getNewsFeedData()
                ..getProfileData()
        )
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: OnBoardingScreen(),
          );
        },
      ),
    );
  }
}


