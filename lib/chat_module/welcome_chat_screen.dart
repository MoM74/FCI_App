import 'package:flutter/material.dart';

import 'package:fci_project/shared/components/constants.dart';
import 'chats_screen.dart';

class WelcomeChatScreen extends StatelessWidget {
  const WelcomeChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 3),
            Image.asset("assets/images/welcome_image.png"),
            const Spacer(flex: 2),
            Text(
              "Welcome to FCI \n Messenger",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              "It Connects you with our Doctors \n and their Assistants.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.color
                    ?.withOpacity(0.65),
              ),
            ),
            const Spacer(flex: 2),
            FittedBox(
              child: TextButton(
                  onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatsScreen(),
                        ),
                      ),
                  child: Row(
                    children: [
                      Text(
                        "Go To Chats",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.color
                                  ?.withOpacity(1),
                            ),
                      ),
                      const SizedBox(width: defaultPadding / 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.color
                            ?.withOpacity(0.8),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
