// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// import '../../../shared/components/constants.dart';
// import 'onboarding_view.dart';
//
//
// class SplashView extends StatefulWidget {
//   const SplashView({Key? key}) : super(key: key);
//
//   @override
//   _SplashViewState createState() => _SplashViewState();
// }
//
// class _SplashViewState extends State<SplashView> {
//   Timer? _timer;
//
//   _startDelay() {
//     _timer = Timer( const Duration(seconds: 2), _goNext);
//   }
//   _goNext() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) {
//           return OnBoardingView();
//         },
//       ),
//     );
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _startDelay();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: kPrimaryColor,
//       body:
//        Center(child: Image(image: AssetImage("assets/images/splash.png"))),
//     );
//   }
//   @override
//   void dispose() {
//     _timer?.cancel();
//      super.dispose();
//   }
// }
