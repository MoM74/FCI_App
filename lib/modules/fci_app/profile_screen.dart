// import 'package:fci_project/shared/components/constants.dart';
// import 'package:flutter/material.dart';
// import '../../components/drawer.dart';
// import '../../components/profile_items.dart';
// import 'welcome_screen.dart';
//
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final _width = MediaQuery.of(context).size.width;
//     final _height = MediaQuery.of(context).size.height;
//     return Container(
//       child: Stack(
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//               color: kPrimaryColor,
//             ),
//           ),
//           Scaffold(
//             appBar: AppBar(
//               elevation: 0,
//               actions: <Widget>[
//                 IconButton(
//                   icon: Icon(Icons.login_rounded),
//                   color: Colors.white,
//                   iconSize: 30,
//                   padding: EdgeInsets.only(right: 17),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return WelcomeScreen();
//                         },
//                       ),
//                     );
//                   },
//                 )
//               ],
//               backgroundColor: kPrimaryColor,
//             ),
//             drawer: MyDrawer(),
//             backgroundColor: kPrimaryColor,
//             body: Container(
//               child: Stack(
//                 children: <Widget>[
//                   Align(
//                     alignment: Alignment.center,
//                     child: Padding(
//                       padding: EdgeInsets.only(top: _height / 30),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: <Widget>[
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(200),
//                             child: Image.network(
//                               'https://as01.epimg.net/en/imagenes/2018/03/24/football/1521903908_600537_noticia_normal.jpg',
//                               width: 150,
//                               height: 150,
//                             ),
//                           ),
//                           SizedBox(
//                             height: _height / 40,
//                           ),
//                           Text(
//                             'mahmoud',
//                             style: new TextStyle(
//                                 fontSize: 25.0,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   new Padding(
//                     padding: new EdgeInsets.only(top: _height / 2.7),
//                     child: new Container(
//                       color: Colors.white,
//                     ),
//                   ),
//                   new Padding(
//                     padding: new EdgeInsets.only(
//                         top: _height / 3.2,
//                         left: _width / 20,
//                         right: _width / 20),
//                     child: new Column(
//                       children: <Widget>[
//                         new Container(
//                           decoration: new BoxDecoration(
//                               color: Colors.white70,
//                               boxShadow: [
//                                 new BoxShadow(
//                                     color: Colors.black45,
//                                     blurRadius: 5.0,
//                                     offset: new Offset(0.0, 2.0))
//                               ]),
//                           child: new Padding(
//                             padding: new EdgeInsets.all(_width / 20),
//                             child: new Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   headerChild('GCH', '100'.toString()),
//                                   headerChild('Level', '1'.toString()),
//                                   headerChild('GPA', '3.5'.toString()),
//                                 ]),
//                           ),
//                         ),
//                         new Padding(
//                           padding: new EdgeInsets.only(top: _height / 20),
//                           child: new Column(
//                             children: <Widget>[
//                               infoChild(_width, "assets/icons/email.svg",
//                                   'mahmoud@gmail.com'), // hereeeeeee
//                               infoChild(_width, "assets/icons/phone.svg",
//                                   '01554573845'),
//                               // hereeeeee
//
//                               infoChild(_width, "assets/icons/id.svg", '155'),
//                               // hereeeeeee
//                               infoChild(_width, "assets/icons/department.svg",
//                                   'computer science'),
//                               // hereeeeee
//                               SizedBox(
//                                 height: _height / 50,
//                               ),
//                               Center(
//                                 child: GestureDetector(
//                                   child: Text(
//                                     "Change Password",
//                                     style: TextStyle(
//                                         color: Color(0xff4a1c40),
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   onTap: () {
//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(
//                                     //     builder: (context) {
//                                     //       return ChangePassword();
//                                     //     },
//                                     //   ),
//                                     // );
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
