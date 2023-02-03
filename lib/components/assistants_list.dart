import 'package:flutter/material.dart';

import '../modules/fci_app/assestant.dart';
import 'assistant_cards.dart';


class MyAssistants extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    List<AssistantModel> Assistants=[
      AssistantModel(name: "Ahmed Elbatanony", image: "assets/images/as1.jpg", nameOfDeb: "computer science", courses: ["Logic","OR"], no: 2),
      AssistantModel(name: "mohamed NaHas ", image: "assets/images/as2.jpg", nameOfDeb: "computer science", courses: ["Ds","Cypher Security","Gis"], no: 3),
      AssistantModel(name: "DR.Ashraf elsisi", image: "assets/images/mah.jpg", nameOfDeb: "computer science", courses: ["Ds","introduction"], no: 2),
      AssistantModel(name: "DR.mahmoud ", image: "assets/images/mah.jpg", nameOfDeb: "computer science", courses: ["Ds","introduction"], no: 2),

      AssistantModel(name: "DR.ahmed", image: "assets/images/mah.jpg", nameOfDeb: "computer science", courses: ["Ds","introduction"], no: 2),

    ];
            return Container(
              child: ListView.builder(
                itemCount:Assistants.length ,
                itemBuilder: (context, int index) {

                  return AsMenuItemCard(assistant: Assistants[index]);
                },
              ),
            );
          }

}
