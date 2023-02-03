import 'package:flutter/material.dart';

import '../modules/fci_app/docmodel.dart';
import 'doc_inner_desc.dart';

class DocMenuItemCard extends StatefulWidget {
  final DoctorModel doctor;
  DocMenuItemCard({required this.doctor});

  @override
  _DocMenuItemCardState createState() => _DocMenuItemCardState();
}

class _DocMenuItemCardState extends State<DocMenuItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
      child: AspectRatio(
        aspectRatio: 3 / 1,
        child: Container(
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                doctor: widget.doctor,
                              )));
                },
                child: Expanded(
                  child: Row(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 1 / 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(110),
                          child: Image.asset(
                            widget.doctor.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.doctor.name,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold , color: Color(0xFF4a1c40)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.doctor.nameOfDeb,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF4a1c40),
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
