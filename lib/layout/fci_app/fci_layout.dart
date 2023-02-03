import 'package:fci_project/layout/fci_app/cubit/states.dart';
import 'package:fci_project/layout/fci_app/cubit/cubit.dart';
import 'package:fci_project/shared/components/components.dart';
import 'package:fci_project/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/fci_app/login/login_screen.dart';
import '../../modules/fci_app/settings/settings_screen.dart';
import '../../shared/cubit/cubit.dart';

class FciLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FciCubit, FciStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = FciCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'FCI',
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
                onPressed: ()
                {
                  AppCubit.get(context).changeAppMode();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.settings,
                ),
                onPressed: () {
                  navigateTo(context, SettingsScreen(),);
                },
              ),
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_active,
                ),
                label: 'NewsFeed',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.quiz,
                ),
                label: 'Quiz' ,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_rounded,
                ),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
