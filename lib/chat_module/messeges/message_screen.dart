import 'package:flutter/material.dart';

import 'package:fci_project/shared/components/constants.dart';

import 'components/body.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body2(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_3.png"),
          ),
          const SizedBox(width: defaultPadding * 0.75),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Dr Hatem Bahig",
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  "Online now",
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
          )
        ],
      ),
      actions: [
        IconButton(icon: const Icon(Icons.local_phone), onPressed: () {}),
        IconButton(icon: const Icon(Icons.videocam), onPressed: () {}),
        const SizedBox(width: defaultPadding / 2),
      ],
    );
  }
}
