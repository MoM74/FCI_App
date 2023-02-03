import 'package:fci_project/modules/fci_app/home/home_screen.dart';
import 'package:fci_project/modules/fci_app/login/login_screen.dart';
import 'package:fci_project/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/components/components.dart';
import '../../shared/network/local/cache_helper.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void submit() {
    CacheHelper.saveData(
      key: 'welcome',
      value: true,
    ).then((value)
    {
      if (value) {
        navigateAndFinish(
          context,
          LoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_top.png",
                width: size.width * 0.4,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/main_bottom.png",
                width: size.width * 0.4,
              ),
            ),
            Body(context)
          ],
        ),
      ),
    );
  }

  Widget Body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Welcome",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color(0xFF522546)),
          ),
          SizedBox(height: size.height * 0.05),
          SvgPicture.asset(
            "assets/icons/chat.svg",
            height: size.height * 0.45,
          ),
          SizedBox(height: size.height * 0.07),
          GestureDetector(
            child: Container(
              width: 250,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: kPrimaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: Color(0xFFEEEEEE),
                          //      fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Color(0xFFEEEEEE),
                    size: 23,
                  ),
                ],
              ),
            ),
            onTap: () {
              submit();
            },
          ),
        ],
      ),
    );
  }
}
