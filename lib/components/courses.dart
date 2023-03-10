import 'package:fci_project/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'coursemodel.dart';

class MyCourses extends StatelessWidget {
  final List<Course> courses;

  const MyCourses({Key? key, required this.courses}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
                text: "Your Courses Number is: ",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff4a1c40),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                children: [
                  TextSpan(
                    text: "  ${courses.length}",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff4a1c40),
                        fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
        ],
      ),
      SizedBox(
        height: size.height * 0.04,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: courses
                .map((course) => buildTaskItem(
                    int.parse(course.hours), course.courseName, kCardColor))
                .toList()),
      )
    ]);
  }
}

Container buildTaskItem(int numDays, String courseTitle, Color color) {
  return Container(
    margin: EdgeInsets.only(right: 15),
    padding: EdgeInsets.all(12),
    height: 90,
    width: 150,
    decoration: BoxDecoration(
      color: Color(0xff4a1c40),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, //beginning of words
      children: [
        SizedBox(
          height: 6,
        ),
        Row(
          children: [
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: Color(0xff962d2d),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "$numDays Credit Hours",
              style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          width: 150,
          child: Center(
            child: Text(
              courseTitle,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}
