// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:videosdk/rtc.dart';
// import '../navigator_key.dart';
// import '../utils/spacer.dart';
// import '../utils/toast.dart';
// import '../widgets/meeting_controls/meeting_action_bar.dart';
// import '../widgets/participant_grid_view/participant_grid_view.dart';
// import 'chat_screen.dart';
// import 'startup_screen.dart';
//
// // Meeting Screen
// class MeetingScreen extends StatefulWidget {
//   final String meetingId, token, displayName;
//   final bool micEnabled, webcamEnabled, chatEnabled;
//   const MeetingScreen({
//     Key? key,
//     required this.meetingId,
//     required this.token,
//     required this.displayName,
//     this.micEnabled = true,
//     this.webcamEnabled = true,
//     this.chatEnabled = true,
//   }) : super(key: key);
//
//   @override
//   _MeetingScreenState createState() => _MeetingScreenState();
// }
//
// class _MeetingScreenState extends State<MeetingScreen> {
//   // Recording Webhook
//   final String recordingWebHookURL = "";
//
//   Meeting? meeting;
//   bool isMeetingEventsRegistered = false;
//
//   // control states
//   bool isRecordingOn = false;
//   bool isLiveStreamOn = false;
//
//   // List of controls
//   List<MediaDeviceInfo> webcams = [];
//   List<MediaDeviceInfo> mics = [];
//   String? selectedMicId;
//
//   String? activePresenterId;
//
//   // Streams
//   Stream? shareStream;
//   Stream? videoStream;
//   Stream? audioStream;
//   Stream? remoteParticipantShareStream;
//
//   @override
//   void setState(fn) {
//     if (mounted) {
//       super.setState(fn);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //Get statusbar height
//     final statusbarHeight = MediaQuery.of(context).padding.top;
//
//     log("Meeting Data: ${widget.meetingId} ${widget.token}");
//     return WillPopScope(
//       onWillPop: _onWillPopScope,
//       child: MeetingBuilder(
//         maxResolution: 'hd',
//         meetingId: widget.meetingId,
//         displayName: widget.displayName,
//         token: widget.token,
//         micEnabled: widget.micEnabled,
//         webcamEnabled: widget.webcamEnabled,
//         notification: const NotificationInfo(
//           title: "Video SDK",
//           message: "Video SDK is sharing screen in the meeting",
//           icon: "notification_share", // drawable icon name
//         ),
//         builder: (_meeting) {
//           if (!isMeetingEventsRegistered) {
//             registerMeetingEvents(_meeting);
//             isMeetingEventsRegistered = true;
//           }
//
//           // Showing waiting screen
//           if (meeting == null) {
//             return Scaffold(
//               body: Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: const [
//                     CircularProgressIndicator(),
//                     VerticalSpacer(10),
//                     Text("waiting to join meeting"),
//                   ],
//                 ),
//               ),
//             );
//           }
//
//           return Scaffold(
//             backgroundColor: Theme.of(context).backgroundColor.withOpacity(0.8),
//             floatingActionButton: MeetingActionBar(
//               isMicEnabled: audioStream != null,
//               isWebcamEnabled: videoStream != null,
//               isScreenShareEnabled: shareStream != null,
//               isScreenShareButtonDisabled: remoteParticipantShareStream != null,
//               // Called when Call End button is pressed
//               onCallEndButtonPressed: () {
//                 _meeting.leave();
//               },
//               // Called when mic button is pressed
//               onMicButtonPressed: () {
//                 if (audioStream != null) {
//                   _meeting.muteMic();
//                 } else {
//                   _meeting.unmuteMic();
//                 }
//               },
//               // Called when webcam button is pressed
//               onWebcamButtonPressed: () {
//                 if (videoStream != null) {
//                   _meeting.disableWebcam();
//                 } else {
//                   _meeting.enableWebcam();
//                 }
//               },
//               // Called when switch webcam button is pressed
//               onSwitchCameraButtonPressed: () {
//                 final selectedWebcamId = _meeting.selectedWebcamId;
//
//                 MediaDeviceInfo deviceToSwitch = webcams.firstWhere(
//                   (webcam) => webcam.deviceId != selectedWebcamId,
//                 );
//
//                 _meeting.changeWebcam(deviceToSwitch.deviceId);
//               },
//
//               // Called when ScreenShare button is pressed
//               onScreenShareButtonPressed: () {
//                 if (shareStream != null) {
//                   _meeting.disableScreenShare();
//                 } else {
//                   _meeting.enableScreenShare();
//                 }
//               },
//
//               // Called when more options button is pressed
//               onMoreButtonPressed: () {
//                 // Showing more options dialog box
//                 showDialog<void>(
//                   context: navigatorKey.currentContext!,
//                   builder: (BuildContext context) => AlertDialog(
//                     title: const Text("More options"),
//                     content: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         // Chat
//                         ElevatedButton(
//                           child: const Text('Chat'),
//                           onPressed: () {
//                             Navigator.pop(context);
//                             showModalBottomSheet(
//                               context: context,
//                               constraints: BoxConstraints(
//                                   maxHeight:
//                                       MediaQuery.of(context).size.height -
//                                           statusbarHeight),
//                               isScrollControlled: true,
//                               builder: (context) =>
//                                   ChatScreen(meeting: meeting!),
//                             );
//                           },
//                         ),
//
//                         // Recording button
//                         ElevatedButton(
//                           child: Text(
//                             isRecordingOn
//                                 ? 'Stop Recording'
//                                 : 'Start Recording',
//                           ),
//                           onPressed: () {
//                             if (isRecordingOn) {
//                               _meeting.stopRecording();
//                             } else {
//                               _meeting.startRecording(recordingWebHookURL);
//                             }
//
//                             Navigator.pop(context);
//                           },
//                         ),
//
//                         // LiveStream button
//                         ElevatedButton(
//                           child: Text(
//                             isLiveStreamOn
//                                 ? 'Stop Livestream'
//                                 : 'Start Livestream',
//                           ),
//                           onPressed: () {
//                             List liveStreamOptions = [];
//
//                             if (isLiveStreamOn) {
//                               _meeting.stopLivestream();
//                             } else {
//                               if (liveStreamOptions.isNotEmpty) {
//                                 _meeting.startLivestream(liveStreamOptions);
//                               } else {
//                                 toastMsg(
//                                   "Failed to start livestream. Please add live stream options.",
//                                 );
//                               }
//                             }
//
//                             Navigator.pop(context);
//                           },
//                         ),
//
//                         ElevatedButton(
//                           child: const Text('Low Resolution'),
//                           onPressed: () {
//                             meeting?.participants.forEach((key, value) {
//                               value.setQuality('low');
//                             });
//
//                             Navigator.pop(context);
//                           },
//                         ),
//
//                         ElevatedButton(
//                           child: const Text('Med Resolution'),
//                           onPressed: () {
//                             meeting?.participants.forEach((key, value) {
//                               value.setQuality('med');
//                             });
//
//                             Navigator.pop(context);
//                           },
//                         ),
//
//                         ElevatedButton(
//                           child: const Text('High Resolution'),
//                           onPressed: () {
//                             meeting?.participants.forEach((key, value) {
//                               value.setQuality('high');
//                             });
//
//                             Navigator.pop(context);
//                           },
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//             floatingActionButtonLocation:
//                 FloatingActionButtonLocation.centerFloat,
//             appBar: AppBar(
//               title: Text(widget.meetingId),
//               actions: [
//                 // Recording status
//                 if (isRecordingOn) SvgPicture.asset("assets/recording_on.svg"),
//
//                 // Copy meeting id button
//                 IconButton(
//                   icon: const Icon(Icons.copy),
//                   onPressed: () {
//                     Clipboard.setData(ClipboardData(text: widget.meetingId));
//                     toastMsg("Meeting ID has been copied.");
//                   },
//                 ),
//               ],
//             ),
//             body: Padding(
//               padding: const EdgeInsets.only(bottom: 80.0),
//               child: Column(
//                 children: [
//                   if (remoteParticipantShareStream != null ||
//                       shareStream != null)
//                     AspectRatio(
//                       aspectRatio: 16 / 9,
//                       child: Container(
//                         color: Colors.black,
//                         child: RTCVideoView(
//                           remoteParticipantShareStream != null
//                               ? remoteParticipantShareStream!.renderer!
//                               : shareStream!.renderer!,
//                         ),
//                       ),
//                     ),
//                   Expanded(
//                     child: ParticipantGridView(meeting: meeting!),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   void registerMeetingEvents(Meeting _meeting) {
//     // Called when joined in meeting
//     _meeting.on(
//       Events.meetingJoined,
//       () {
//         setState(() {
//           meeting = _meeting;
//         });
//
//         // Holds available webcams info
//         webcams = _meeting.getWebcams();
//       },
//     );
//
//     // Called when meeting is ended
//     _meeting.on(Events.meetingLeft, () {
//       Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (context) => const StartupScreen()),
//           (route) => false);
//     });
//
//     // Called when recording is started
//     _meeting.on(Events.recordingStarted, () {
//       toastMsg("Meeting recording started.");
//
//       setState(() {
//         isRecordingOn = true;
//       });
//     });
//
//     // Called when recording is stopped
//     _meeting.on(Events.recordingStopped, () {
//       toastMsg("Meeting recording stopped.");
//
//       setState(() {
//         isRecordingOn = false;
//       });
//     });
//
//     // Called when LiveStreaming is started
//     _meeting.on(Events.liveStreamStarted, () {
//       toastMsg("Meeting live streaming started.");
//
//       setState(() {
//         isLiveStreamOn = true;
//       });
//     });
//
//     // Called when LiveStreaming is stopped
//     _meeting.on(Events.liveStreamStopped, () {
//       toastMsg("Meeting live streaming stopped.");
//
//       setState(() {
//         isLiveStreamOn = false;
//       });
//     });
//
//     // Called when mic is requested
//     _meeting.on(Events.micRequested, (_data) {
//       log("_data => $_data");
//       dynamic accept = _data['accept'];
//       dynamic reject = _data['reject'];
//
//       log("accept => $accept reject => $reject");
//
//       // Mic Request Dialog
//       showDialog(
//         context: navigatorKey.currentContext!,
//         builder: (context) => AlertDialog(
//           title: const Text("Mic requested?"),
//           content: const Text("Do you want to turn on your mic? "),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 reject();
//
//                 Navigator.of(context).pop();
//               },
//               child: const Text("Reject"),
//             ),
//             TextButton(
//               onPressed: () {
//                 accept();
//
//                 Navigator.of(context).pop();
//               },
//               child: const Text("Accept"),
//             ),
//           ],
//         ),
//       );
//     });
//
//     // Called when webcam is requested
//     _meeting.on(Events.webcamRequested, (_data) {
//       log("_data => $_data");
//       dynamic accept = _data['accept'];
//       dynamic reject = _data['reject'];
//
//       log("accept => $accept reject => $reject");
//
//       // Webcam Request Dialog
//       showDialog(
//         context: navigatorKey.currentContext!,
//         builder: (context) => AlertDialog(
//           title: const Text("Webcam requested?"),
//           content: const Text("Do you want to turn on your webcam? "),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 reject();
//
//                 Navigator.of(context).pop();
//               },
//               child: const Text("Reject"),
//             ),
//             TextButton(
//               onPressed: () {
//                 accept();
//
//                 Navigator.of(context).pop();
//               },
//               child: const Text("Accept"),
//             ),
//           ],
//         ),
//       );
//     });
//
//     // Called when stream is enabled
//     _meeting.localParticipant.on(Events.streamEnabled, (Stream _stream) {
//       if (_stream.kind == 'video') {
//         setState(() {
//           videoStream = _stream;
//         });
//       } else if (_stream.kind == 'audio') {
//         setState(() {
//           audioStream = _stream;
//         });
//       } else if (_stream.kind == 'share') {
//         setState(() {
//           shareStream = _stream;
//         });
//       }
//     });
//
//     // Called when stream is disabled
//     _meeting.localParticipant.on(Events.streamDisabled, (Stream _stream) {
//       if (_stream.kind == 'video' && videoStream?.id == _stream.id) {
//         setState(() {
//           videoStream = null;
//         });
//       } else if (_stream.kind == 'audio' && audioStream?.id == _stream.id) {
//         setState(() {
//           audioStream = null;
//         });
//       } else if (_stream.kind == 'share' && shareStream?.id == _stream.id) {
//         setState(() {
//           shareStream = null;
//         });
//       }
//     });
//
//     // Called when presenter is changed
//     _meeting.on(Events.presenterChanged, (_activePresenterId) {
//       Participant? activePresenterParticipant =
//           _meeting.participants[_activePresenterId];
//
//       // Get Share Stream
//       Stream? _stream = activePresenterParticipant?.streams.values
//           .singleWhere((e) => e.kind == "share");
//
//       setState(() => remoteParticipantShareStream = _stream);
//     });
//
//     //Entry Event
//     _meeting.on(Events.entryRequested, (data) {
//       var participantId = data['participantId'];
//       var name = data["name"];
//       var allow = data["allow"];
//       var deny = data["deny"];
//
//       showDialog(
//         context: navigatorKey.currentContext!,
//         builder: (context) => AlertDialog(
//           title: const Text("Join Request"),
//           content: Text("Do you want to allow $name to join meeting?"),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 deny();
//                 Navigator.of(context).pop();
//               },
//               child: const Text("Deny"),
//             ),
//             TextButton(
//               onPressed: () {
//                 allow();
//
//                 Navigator.of(context).pop();
//               },
//               child: const Text("Allow"),
//             ),
//           ],
//         ),
//       );
//     });
//
//     _meeting.on(Events.entryResponded, (data) {
//       var id = data['id'];
//       var decision = data['decision'];
//       if (id == _meeting.localParticipant.id) {
//         if (decision == 'allowed') {
//           toastMsg("Allowed to join the meeting.");
//         } else {
//           toastMsg("Denied to join the meeting.");
//           Navigator.of(context).pop();
//         }
//       }
//     });
//   }
//
//   Future<bool> _onWillPopScope() async {
//     meeting?.leave();
//     return true;
//   }
// }
