import 'package:fci_project/components/rounded_button.dart';
import 'package:fci_project/layout/fci_app/fci_layout.dart';
import 'package:fci_project/modules/fci_app/zoom/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../chat_module/welcome_chat_screen.dart';
import '../models/fci_app/profile_model.dart';
import '../modules/fci_app/quiz/screens/home/quizhome.dart';
import '../modules/fci_app/quiz/screens/welcome/welcome_screen.dart';
import '../modules/fci_app/welcome_screen.dart';
import '../shared/components/components.dart';
import 'listing_assistant_users.dart';
import 'listing_doctor_users.dart';

class MyDrawer extends StatelessWidget {
  final ProfileModel? prof;

  const MyDrawer({Key? key, required this.prof}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
        child: Container(
      color: Colors.grey[300],
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            accountEmail: Text(
              '${prof?.data.email}',
              // "${user.email}",
              style: TextStyle(color: Color(0xff4a1c40), fontSize: 12),
            ),
            //code hereeeeeeeeeeeeeeeeeeeeeeeee
            accountName: Text(
              '${prof?.data.fullname}',
              // "${user.name} ", // code here
              style: TextStyle(color: Color(0xff4a1c40), fontSize: 18),
            ),
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.network(
                'https://uni-platform.herokuapp.com${prof?.data.image}',
                width: 150,
                height: 150,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Doctors",
              style: TextStyle(
                color: Color(0xff4a1c40),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: SvgPicture.asset(
              "assets/icons/doctor.svg",
              width: 32,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AllOfDocs();
                  },
                ),
              );
            },
          ),
          SizedBox(height: size.height * 0.001),
          Divider(
            color: Colors.black,
            indent: 30,
            endIndent: 30,
            height: 0,
            thickness: 0.5,
          ),
          ListTile(
            title: Text(
              "Assistant",
              style: TextStyle(
                color: Color(0xff4a1c40),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: SvgPicture.asset(
              "assets/icons/assistant.svg",
              width: 32,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AllOfAssist();
                  },
                ),
              );
            },
          ),
          SizedBox(height: size.height * 0.001),
          Divider(
            color: Colors.black,
            indent: 30,
            endIndent: 30,
            height: 0,
            thickness: 0.7,
          ),
          ListTile(
            title: Text(
              "Quiz",
              style: TextStyle(
                color: Color(0xff4a1c40),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: SvgPicture.asset(
              "assets/icons/chat-bot.svg",
              width: 40,
            ),
            onTap: () {
              navigateTo(context, QuizHomeScreen());
            },
          ),
          SizedBox(height: size.height * 0.001),
          Divider(
            color: Colors.black,
            indent: 30,
            endIndent: 30,
            height: 0,
            thickness: 0.5,
          ),
          ListTile(
            title: Text(
              "Masseges",
              style: TextStyle(
                color: Color(0xff4a1c40),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: SvgPicture.asset(
              "assets/icons/messenger.svg",
              width: 30,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WelcomeChatScreen();
                  },
                ),
              );
            },
          ),
          SizedBox(height: size.height * 0.001),
          Divider(
            color: Colors.black,
            indent: 30,
            endIndent: 30,
            height: 0,
            thickness: 0.5,
          ),
          ListTile(
            title: Text(
              "Zoom",
              style: TextStyle(
                color: Color(0xff4a1c40),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: SvgPicture.asset(
              "assets/icons/messenger.svg",
              width: 30,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FciLayout();
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: size.height * 0.12,
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: RoundedButton(
              text: "SignOut",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
