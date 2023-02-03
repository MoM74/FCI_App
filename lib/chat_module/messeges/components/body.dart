import 'package:fci_project/shared/components/constants.dart';
import 'package:flutter/material.dart';

import '../../models/ChatMessage.dart';
import 'chat_input_field.dart';
import 'message.dart';

class Body2 extends StatelessWidget {
  const Body2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) =>
                  Message(message: demeChatMessages[index]),
            ),
          ),
        ),
        const ChatInputField(),
      ],
    );
  }
}
