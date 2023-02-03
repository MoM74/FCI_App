// import 'package:flutter/material.dart';
//
// import '../../../components/drawer.dart';
// import '../../../components/my_semester.dart';
//
// class CategoryScreen extends StatelessWidget {
//   const CategoryScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Color(0xfff6f7f9),
//       appBar: AppBar(
//         elevation: 0,
//         title: Text(
//           'Materials Of information Technology',
//           style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
//         ),
//       ),
//       drawer: MyDrawer(prof: ),
//       body: ListView.builder(
//           itemCount: products.length,
//           itemBuilder: (BuildContext context, int index) {
//             return GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => Semester(index)),
//                 );
//               },
//               child: Container(
//                 margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(30),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey[300]!,
//                         blurRadius: 15,
//                         spreadRadius: 30,
//                         offset: Offset(3, 4))
//                   ],
//                 ),
//                 child: ListTile(
//                   leading: Image.asset(
//                     "assets/images/logo.jpg",
//                     fit: BoxFit.fill,
//                     width: 60,
//                     height: size.height,
//                   ),
//                   title: Container(
//                     padding: EdgeInsets.only(top: 20),
//                     child: Text(
//                       "Level ${index + 1}",
//                       style: TextStyle(
//                         fontSize: 27,
//                         color: Color(0xFF4a1c40),
//                       ),
//                     ),
//                   ),
//                   subtitle: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         '   is my level.',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontStyle: FontStyle.italic,
//                           color: Color(0xFF4a1c40),
//                         ),
//                       ),
//                       SizedBox(height: size.height * 0.008),
//                       Container(height: size.height * 0.015),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }
//
// class Product {
//   final image;
//   final name;
//
//   Product(this.image, this.name);
// }
//
// List products = [
//   Product('', 'Level 1'),
//   Product('', 'Level 2',),
//   Product('', 'Level 3'),
//   Product('', 'Level 4'),
// ];
