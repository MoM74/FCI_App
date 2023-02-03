import 'dart:convert';
import 'package:fci_project/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:http/http.dart' as http;

import '../../components/background.dart';
import '../../components/rounded_button.dart';
import '../../components/rounded_password_field.dart';
import '../../data/models/button.dart';
import 'confirmpass.dart';
import 'login/login_screen.dart';


class ChangePassword extends StatefulWidget {
  //hena data 1

  const ChangePassword({ Key? key}) : super(key: key); //constructor 2
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  Future createnewpass(
      String newpassword1, String newpassword2, String curPass, String token) async {
    final String apiUrl =
        "https://uni-platform.herokuapp.com/api-auth/password/change/";
    final response = await http.post(
      Uri.parse(apiUrl),
      body: {

        "new_password1": newpassword1,
        "new_password2": newpassword2,
        "old_password": curPass
      },
      headers: {
       // 'Content-Type': 'application/json',
        'Authorization' : 'token $token'
      },
    );

    if (response.statusCode == 200) {
      final String responseString = response.body;
      print('RESPONSE body = ${response.body}');
      return  AutoGenerate.fromJson(json.decode(responseString));
    } else {
      print('Error!');
      print('RESPONSE body = ${response.body}');
    }
  }

  GlobalKey<FormState> key = GlobalKey<FormState>(); //modified
  void validate() {
    if (key.currentState!.validate()) {
      print("Validated");
    } else {
      print("Not Validated");
    }
  }


  final TextEditingController curPassController = new TextEditingController();
  final TextEditingController newPassController = new TextEditingController();
  final TextEditingController confPassController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Form(
            //modified SingleChildScrollVie //modified
            key: key, //modified
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Change Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: size.height * 0.02),
                  SvgPicture.asset(
                    "assets/icons/changepassword.svg",
                    height: size.height * 0.2,
                  ),
                  SizedBox(height: size.height * 0.11),
                  RoundedPasswordField(hint: " Current Password ", passController: curPassController),
                  SizedBox(
                    height: 10,
                  ),
                  RoundedPasswordField(hint: " New Password ", passController: newPassController,),
                  SizedBox(
                    height: 10,
                  ),
                  RoundedPasswordField( hint:"Confirm New Password",passController: confPassController,),
                  SizedBox(
                    height: 10,
                  ),

                  RoundedButton(
                    text: "Confirm ",
                    press: () async {
                      print(curPassController.text);
                      print(newPassController.text);
                      final String curPass = curPassController.text;
                      final String newPass1 = newPassController.text;
                      final String newPass2 = confPassController.text;
                      final user =
                          await createnewpass(newPass1, newPass2, curPass, CacheHelper.getData(key: 'token'));
                      setState(() {

                      });
                      if (user == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Invalid  password')));
                      } else if (user != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Successes")));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      }
                    },
                  ),
                  CacheHelper.getData(key: 'token') == null
                      ? Container()
                      : Text("${ " to change password"} "),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
