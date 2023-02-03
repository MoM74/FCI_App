import 'package:fci_project/chat_module/welcome_chat_screen.dart';
import 'package:flutter/material.dart';

import 'package:fci_project/shared/components/constants.dart';

import '../components/listing_doctor_users.dart';
import 'chat_card.dart';
import 'filled_outline_button.dart';
import 'messeges/message_screen.dart';
import 'models/Chat.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
              defaultPadding, 0, defaultPadding, defaultPadding),
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FillOutlineButton(press: () {}, text: "Recent Message"),
                const SizedBox(width: defaultPadding),
                FillOutlineButton(
                  isFilled: false,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AllOfDocs(
                          );
                        },
                      ),
                    );
                  },
                  text: "Messenger",
                ),
                const SizedBox(width: defaultPadding * 1.2),
                FillOutlineButton(
                  isFilled: false,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const WelcomeChatScreen();
                        },
                      ),
                    );
                  },
                  text: "Home Page",
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
                chat: chatsData[index],
                press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MessagesScreen(),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
