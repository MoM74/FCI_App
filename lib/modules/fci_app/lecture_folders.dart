
import 'package:fci_project/modules/fci_app/pdfviewer.dart';
import 'package:flutter/material.dart';

import '../../shared/components/constants.dart';
import 'lecture_temp.dart';

class AllLectures extends StatelessWidget {
  final int current;
  AllLectures({Key? key, required this.current}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Lectures",
          style: TextStyle(fontSize: 23, fontStyle: FontStyle.italic),
        ),
      ),
      body: GridView.count(

        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 25,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          GestureDetector(
            child: MyLecture(
              lecname: "lecture 1",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return pdfviewer();
                  },
                ),
              );
            },
          ),
          GestureDetector(
            child: MyLecture(
              lecname: "lecture 2",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return pdfviewer();
                  },
                ),
              );
            },
          ),
          GestureDetector(
            child: MyLecture(
              lecname: "lecture 3",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return pdfviewer();
                  },
                ),
              );
            },
          ),
          GestureDetector(
            child: MyLecture(
              lecname: "lecture 4",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return pdfviewer();
                  },
                ),
              );
            },
          ),
          GestureDetector(
            child: MyLecture(
              lecname: "lecture 5",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return pdfviewer();
                  },
                ),
              );
            },
          ),
          GestureDetector(
            child: MyLecture(
              lecname: "lecture 6",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return pdfviewer();
                  },
                ),
              );
            },
          ),
          GestureDetector(
            child: MyLecture(
              lecname: "lecture 7",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return pdfviewer();
                  },
                ),
              );
            },
          ),
          GestureDetector(
            child: MyLecture(
              lecname: "lecture 8",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return pdfviewer();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
