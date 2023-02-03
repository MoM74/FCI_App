// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// import '../../../shared/components/components.dart';
// import '../../../shared/components/constants.dart';
// import '../../../shared/network/local/cache_helper.dart';
// import '../login/login_screen.dart';
//
//
//
// class OnBoardingView extends StatefulWidget {
//   const OnBoardingView({Key? key}) : super(key: key);
//
//   @override
//   _OnBoardingViewState createState() => _OnBoardingViewState();
// }
//
// class _OnBoardingViewState extends State<OnBoardingView> {
//   late final List<SliderObject> _list = _getSliderData();
//
//   final PageController _pageController = PageController();
//   int _currentIndex = 0;
//
//   List<SliderObject> _getSliderData() => [
//         SliderObject("FCI Student Application",
//             "this App Helps students\n "*2,"assets/images/ss.png"),
//         SliderObject("FCI Student Application",
//             "this App Helps students\n "*2,"assets/images/b1.png"),
//         SliderObject("FCI Student Application",
//             "this App Helps students\n "*2,"assets/images/s1.png"),
//       ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         actions: [
//           Container(
//             margin: const EdgeInsets.all(12),
//             child: CustomButton(
//               text: "Skip",
//               buttonBorder: 20,
//               width: 18,
//               onTap: () {
//                 CacheHelper.saveData(key: 'ShowOnBoard', value: false).then((value){
//                   if(value) {
//                     navigateAndFinish(context, LoginScreen());
//                   }
//
//                 });
//
//
//
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return LoginScreen();
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//         systemOverlayStyle: const SystemUiOverlayStyle(
//             statusBarColor: Colors.white,
//             statusBarBrightness: Brightness.dark),
//       ),
//       body: Padding(
//         padding: const EdgeInsetsDirectional.only(
//             top:12, bottom:  20, start:  12, end:12),
//         child: PageView.builder(
//             controller: _pageController,
//             itemCount: _list.length,
//             onPageChanged: (index) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//             itemBuilder: (context, index) {
//               return OnBoardingPage(_list[index]);
//             }),
//       ),
//       bottomSheet: Padding(
//         padding: const EdgeInsetsDirectional.only(
//             top:12, bottom:  20, start:  12, end:12),
//         child: Container(
//           color: Colors.white,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const SizedBox(
//                 height: 15,
//               ),
//               SmoothPageIndicator(
//                 controller: _pageController,
//                 count: _list.length,
//                 effect: const WormEffect(
//                   dotWidth: 20,
//                   dotHeight: 8,
//                   dotColor: Colors.grey,
//                   activeDotColor: kPrimaryColor,
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               CustomButton(
//                 buttonColor: kPrimaryColor,
//                 text: "Get Started",
//                 onTap: () {
//                   // CacheHelper.saveData(key: 'ShowOnBoard', value: false).then((value){
//                   //   if(value)
//                   //     navigateAndKill(context, LoginScreen());
//                   //
//                   // });
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return LoginScreen();
//                       },
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//
//               const SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class OnBoardingPage extends StatelessWidget {
//   final SliderObject _sliderObject;
//
//   const OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         const SizedBox(height: 40),
//         Padding(
//           padding: const EdgeInsets.all(20),
//           child: Image.asset(
//             _sliderObject.image,
//             height: 300,
//           ),
//         ),
//         const SizedBox(height: 60),
//         Padding(
//           padding: const EdgeInsets.all(8),
//           child: Text(
//             _sliderObject.title,
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 20),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8),
//           child: Text(
//             _sliderObject.subTitle,
//             textAlign: TextAlign.center,
//             style: TextStyle(color: Colors.black26,fontSize: 16),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
//
//
//
// class SliderObject {
//   String title;
//   String subTitle;
//   String image;
//
//   SliderObject(this.title, this.subTitle, this.image);
// }
//
//
