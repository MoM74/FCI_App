// import 'package:fci_project/modules/fci_app/welcome_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../data/models/button.dart';
// import '../modules/fci_app/category/category_screen.dart';
// import '../modules/fci_app/profile/profile_screenn.dart';
// import '../modules/fci_app/profile_screen.dart';
//
// class MyBottomNavigationBar extends StatefulWidget {
//   const MyBottomNavigationBar({Key? key}) : super(key: key);
//   @override
//   _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
// }
//
// class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
//   List<UserModel> UserModellist = [
//     UserModel(
//       name: "ahmed",
//       image:
//           'https://image.freepik.com/free-photo/stylish-man-hat-sunglasses_136403-4135.jpg',
//       title: 'Alshaoukh',
//     ),
//     UserModel(
//       name: "ahmed",
//       image:
//           'https://image.freepik.com/free-photo/stylish-man-hat-sunglasses_136403-4135.jpg',
//       title: 'Alshaoukh',
//     ),
//     UserModel(
//       name: "ahmed",
//       image:
//           'https://image.freepik.com/free-photo/stylish-man-hat-sunglasses_136403-4135.jpg',
//       title: 'Alshaoukh',
//     ),
//   ];
//   int _currentIndex = 0;
//   List<Widget> _children = [
//     WelcomeScreen(),
//     WelcomeScreen(),
//     CategoryScreen(),
//     ProfileScreen(),
//     // ScheduleScreen(
//     //   user: user,
//     // ),
//     // CategoryScreen(user: user),
//     // ProfileScreen(user: user)
//   ];
//
//   void onTappedBar(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _children[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         selectedFontSize: 5,
//         type: BottomNavigationBarType.shifting,
//         backgroundColor: Colors.white24,
//         onTap: onTappedBar,
//         currentIndex: _currentIndex,
//         items: [
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               "assets/icons/home.svg",
//               width: 37.0,
//             ),
//             label: 'Home',
//
//             //backgroundColor: Colors.green
//             // title: Text(
//             //   'Home',
//             //   style: TextStyle(
//             //       color: Colors.black87,
//             //       fontSize: 15,
//             //       fontWeight: FontWeight.bold),
//             // ),
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               "assets/icons/schedule.svg",
//               width: 35.0,
//             ),
//             label: 'Schedule',
//             // title: Text(
//             //   'Schedule',
//             //   style: TextStyle(
//             //       color: Colors.black87,
//             //       fontSize: 14,
//             //       fontWeight: FontWeight.bold),
//             // ),
//           ),
//           BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 "assets/icons/book.svg",
//                 width: 40.0,
//               ),
//               label: 'Category'
//               // title: Text(
//               //   'Category',
//               //   style: TextStyle(
//               //     color: Colors.black87,
//               //     fontSize: 14,
//               //     fontWeight: FontWeight.bold,
//               //   ),
//               // ),
//               ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               "assets/icons/user.svg",
//               width: 30.0,
//             ),
//             label: 'Profile',
//             // title: Text(
//             //   'Profile',
//             //   style: TextStyle(
//             //       color: Colors.black87,
//             //       fontSize: 15,
//             //       fontWeight: FontWeight.bold),
//             //   textAlign: TextAlign.center,
//             // ),
//           ),
//         ],
//         selectedLabelStyle: TextStyle(
//             color: Colors.black87, fontSize: 15, fontWeight: FontWeight.bold),
//         selectedItemColor: Colors.deepPurpleAccent,
//       ),
//     );
//   }
// }
