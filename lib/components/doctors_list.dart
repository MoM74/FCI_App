import 'package:flutter/material.dart';

import '../modules/fci_app/docmodel.dart';
import 'doctors_cards.dart';



class MyDoctors extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<DoctorModel> doctores=[
      DoctorModel(name: "DR.Araby Kishk", image: "assets/images/doc1.jpg", nameOfDeb: "computer science", courses: ["Ds","introduction"], no: 2),
      DoctorModel(name: "DR.Hatem ", image: "assets/images/doc2.jpg", nameOfDeb: "computer science", courses: ["Ds","Cypher Security","Gis"], no: 3),
      DoctorModel(name: "DR.Ashraf elsisi", image: "assets/images/mah.jpg", nameOfDeb: "computer science", courses: ["Ds","introduction"], no: 2),
      DoctorModel(name: "DR.mahmoud ", image: "assets/images/mah.jpg", nameOfDeb: "computer science", courses: ["Ds","introduction"], no: 2),

      DoctorModel(name: "DR.ahmed", image: "assets/images/mah.jpg", nameOfDeb: "computer science", courses: ["Ds","introduction"], no: 2),

    ];
            return Container(
              child: ListView.builder(
                itemCount:doctores.length ,
                itemBuilder: (context, int index) {
                  return DocMenuItemCard(doctor: doctores[index]);
                },
              ),
            );


  }
}