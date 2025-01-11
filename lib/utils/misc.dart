import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:lance/src/core/models/dto/common/tile_color.dart';
import 'package:logging/logging.dart';
import 'package:lance/utils/utils.dart';

class ShowDialog {
  ShowDialog({required BuildContext context}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return const SpinKitFadingCircle(color: Colors.white);
        });
  }
}

final List<TileColor> tileColors = [
  const TileColor(
      textColor: LanceColors.primaryColor,
      backgroundColor: LanceColors.brightPurpleColor),
  const TileColor(
      textColor: LanceColors.redColor,
      backgroundColor: LanceColors.redColor4),
  const TileColor(
      textColor: LanceColors.greenColor3,
      backgroundColor: LanceColors.greenColor2),
  const TileColor(
      textColor: LanceColors.brownColor2,
      backgroundColor: LanceColors.brownColor)
];

String getCurrency(String name) {
  var format =
      NumberFormat.simpleCurrency(locale: Platform.localeName, name: name);
  return format.currencySymbol;
}

Future<void> messageHandler(RemoteMessage message) async {
  Logger logger = Logger("MiscLogger");
  await Firebase.initializeApp();
  logger.fine("Background onMessage Data: ${message.data}");
  if (kDebugMode) {
    //print('Handling a background message ${message.messageId}');
  }
}

// class ShowBottomSheetDialog {
//   ShowBottomSheetDialog({BuildContext context}) {
//     showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (BuildContext context) {
//           return Container();
//           // SpinKitFadingCircle(color: Colors.white);
//         }
//     );
//   }
// }
//
// class ShowSnackBar {
//   ShowSnackBar({GlobalKey<ScaffoldState> scaffoldKey, String msg, Duration duration}) {
//     final snackBar = SnackBar(
//       backgroundColor: BLUE_HUE,
//       content: Text(
//         '$msg',
//         textAlign: TextAlign.center,
//         style: new TextStyle(
//             height: 1.5,
//             color: Colors.white,
//             fontSize: 14.0,
//             fontWeight: FontWeight.w600),
//       ),
//       duration: Duration(seconds: 4),
//     );
//     scaffoldKey.currentState.showSnackBar(snackBar);
//   }
// }
//
// void showAlertDialog(BuildContext context, {String success}) {
//   // flutter defined function
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text(
//           'Success',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               fontSize: 18.0,
//               color: GREEN_HUE,
//               fontWeight: FontWeight.w500),
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             new Text(
//               "$success",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0),
//             ),
//             SizedBox(height: 44,),
//             Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(4.0),
//                   color: GREEN_HUE
//               ),
//               width: 133.0,
//               height: 40,
//               child: RaisedButton(
//                 color: GREEN_HUE,
//                 onPressed: () async {
//                   Navigator.pushNamed(context, HomeScreen.routeName);
//                 },
//                 child: Text(
//                   "Proceed",
//                   style: TextStyle(
//                       fontWeight: FontWeight.normal,
//                       fontSize: 16.0,
//                       color: Color.fromRGBO(250, 247, 255, 1)),
//                 ),
//               ),
//             )
//           ],
//         ),
//
//       );
//     },
//   );
// }
// Future<bool> imageDialog(BuildContext context, {File image}) async {
//   // flutter defined function
//   return await showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         content: ImageDialogContent(image: image),
//       );
//     },
//   );
// }
//
// Future<bool> deleteDialog(BuildContext context, Content item) async {
//   return await showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         content: DeletePromptContent(item: item),
//       );
//     },
//   );
// }
//
// class DeletePromptContent extends StatefulWidget {
//   const DeletePromptContent({Key key, this.item}) : super(key: key);
//   final Content item;
//
//   @override
//   _DeletePromptContentState createState() => _DeletePromptContentState();
// }
//
// class _DeletePromptContentState extends State<DeletePromptContent> {
//
//   @override
//   Widget build(BuildContext context) {
//     Size _size = MediaQuery.of(context).size;
//     return Container(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text('Decline Offer Confirmation',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 17.0,
//                   color: BLUE_HUE,
//                   fontWeight: FontWeight.w700),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 10),
//               child: Text('Please confirm that you want to decline this offer.',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                     fontSize: 16.0,
//                     color: Color(0xff858585),
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//             Stack(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(top: 12, bottom: 12),
//                   padding: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Color(0xff8960E1)),
//                       borderRadius: BorderRadius.all(Radius.circular(16))
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(bottom: 13),
//                         child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("${widget.item.title}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
//                               Text("${getTime(widget.item.createdDate)}",  style: TextStyle(
//                                   fontSize: 12.0,
//                                   color: Color(0xff858585),
//                                   fontWeight: FontWeight.w400))
//                             ]),
//                       ),
//                       CustomElevationButton(
//                           buttonHeight: 32,
//                           buttonTitle: "${widget.item.category}", customTextStyle: TextStyle(fontSize: 14, color: BLUE_HUE,
//                           letterSpacing: 0.7),
//                           onButtonPress: () => Navigator.pop(context, false),
//                           color: Colors.grey[300])
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                     right: 0,
//                     top: 2,
//                     child: Icon(Icons.circle,
//                         color: Colors.white)),
//                 Positioned(
//                     right: 0,
//                     top: 2,
//                     child: Icon(Icons.check_circle,
//                         color: Color(0xff8960E1)))
//               ],
//             ),
//             SizedBox(height: 12),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Container(
//                       margin: EdgeInsets.only(top: _size.height * 0.01,
//                           bottom: _size.height * 0.02,  right: _size.width * 0.022),
//                       child: CustomElevationButton(
//                           buttonHeight: 48,
//                           buttonTitle: "Cancel", customTextStyle: TextStyle(fontSize: 14, color: BLUE_HUE,
//                           fontWeight: FontWeight.bold, letterSpacing: 0.7),
//                           onButtonPress: () => Navigator.pop(context, false),
//                           color: Colors.grey[300]),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Container(
//                       margin: EdgeInsets.only(top: _size.height * 0.01,
//                           bottom: _size.height * 0.02, left: _size.width * 0.005, right: _size.width * 0.005),
//                       child: CustomElevationButton(
//                           buttonHeight: 48,
//                           buttonTitle: "Decline", customTextStyle: TextStyle(fontSize: 14, color: BLUE_HUE,
//                         fontWeight: FontWeight.bold, letterSpacing: 0.7,),
//                           onButtonPress: () => Navigator.pop(context, true),
//                           color: GREEN_HUE, buttonWidth: 42),
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         )
//     );
//   }
// }
//
// String getTime(String time) {
//   DateTime dateTime = DateTime.parse(time);
//   if (dateTime.hour > 12) {
//     return "${dateTime.hour - 12}:${dateTime.minute} pm";
//   } else {
//     return "${dateTime.hour - 12}:${dateTime.minute} am";
//   }
// }
//
//
// Future<bool> itemUploadDialog(BuildContext context) async {
//   // flutter defined function
//   return await showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         content: UploadContent(),
//       );
//     },
//   );
// }
// class UploadContent extends StatefulWidget {
//   const UploadContent({Key key}) : super(key: key);
//
//   @override
//   _UploadContentState createState() => _UploadContentState();
// }
//
// class _UploadContentState extends State<UploadContent> {
//
//   @override
//   Widget build(BuildContext context) {
//     Size _size = MediaQuery.of(context).size;
//     return Container(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'Add item picture',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 18.0,
//                   color: BLUE_HUE,
//                   fontWeight: FontWeight.w700),
//             ),
//             Container(
//               margin: EdgeInsets.only(top:  _size.height * 0.040, bottom: _size.height * .025,
//                   left: _size.height * .010, right: _size.height * .025),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context, true),
//                     child: Column(
//                       children: [
//                         Container(
//                             margin: EdgeInsets.only(left: 20, bottom: 5),
//                             child: SvgPicture.asset(camera)),
//                         Container(
//                             margin: EdgeInsets.only(left: _size.width * 0.04),
//                             child: Text("Take from\nCamera", textAlign: TextAlign.center,
//                               style: TextStyle(fontSize: 14, color: Colors.black54),))
//                       ],
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context, false),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                             margin: EdgeInsets.only(left: 20, bottom: 5),
//                             child: SvgPicture.asset(gallery)),
//                         Container(
//                             margin: EdgeInsets.only(left: _size.width * 0.04),
//                             child: Text("Pick from\nGallery", textAlign: TextAlign.center,
//                               style: TextStyle(fontSize: 14, color: Colors.black54),))
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             GestureDetector(
//               onTap: () => Navigator.pop(context),
//               child: Container(
//                 margin: EdgeInsets.only(top: _size.height * 0.01,
//                     bottom: _size.height * 0.02, left: _size.width * 0.05, right: _size.width * 0.05),
//                 child: CustomElevationButton(
//                     buttonHeight: 48,
//                     buttonTitle: "Cancel", customTextStyle: TextStyle(fontSize: 16, color: BLUE_HUE,
//                     fontWeight: FontWeight.bold, letterSpacing: 0.7),
//                     onButtonPress: () => Navigator.pop(context),
//                     color: Colors.grey[300],
//                     buttonWidth: double.infinity),
//               ),
//             )
//           ],
//         )
//     );
//   }
// }
//
//
//
// class ImageDialogContent extends StatefulWidget {
//   ImageDialogContent({this.image});
//   final File image;
//
//   @override
//   _ImageDialogContentState createState() => _ImageDialogContentState();
// }
//
// class _ImageDialogContentState extends State<ImageDialogContent> {
//   File _imageOne;
//
//   @override
//   Widget build(BuildContext context) {
//     Size _size = MediaQuery.of(context).size;
//     return Container(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Text('Confirm New Profile \nPhoto',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 17.0,
//                   color: BLUE_HUE,
//                   fontWeight: FontWeight.w700),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 12, bottom: 12),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(12)),
//                 child: widget.image == null ? Container(
//                   width: _size.width * 0.80,
//                   height: _size.width * 0.40,
//                   decoration: BoxDecoration(
//                     color: Color(0xffF5FFFB),
//                   ),
//                   child: widget.image == null ? Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child:  InkWell(
//                           onTap: () async {},
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SvgPicture.asset(cloud, semanticsLabel: 'SVG Content'),
//                               Text("Click to upload\n picture", textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ): Image.file(widget.image, fit: BoxFit.cover,),
//                 ) : Stack(
//                   children: [
//                     Container(
//                       width: _size.width * 0.60,
//                       height: _size.width * 0.40,
//                       decoration: BoxDecoration(
//                         color: Color(0xffF5FFFB),
//                       ),
//                       child: widget.image == null ? Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: []
//                       ): Image.file(widget.image, fit: BoxFit.cover),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Container(
//                       margin: EdgeInsets.only(top: _size.height * 0.01,
//                           bottom: _size.height * 0.02, left: _size.width * 0.02, right: _size.width * 0.02),
//                       child: CustomElevationButton(
//                           buttonHeight: 48,
//                           buttonTitle: "Cancel", customTextStyle: TextStyle(fontSize: 16, color: BLUE_HUE,
//                           fontWeight: FontWeight.bold, letterSpacing: 0.7),
//                           onButtonPress: () => Navigator.pop(context, false),
//                           color: Colors.grey[300]),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Container(
//                       margin: EdgeInsets.only(top: _size.height * 0.01,
//                           bottom: _size.height * 0.02, left: _size.width * 0.02, right: _size.width * 0.02),
//                       child: CustomElevationButton(
//                           buttonHeight: 48,
//                           buttonTitle: "Done", customTextStyle: TextStyle(fontSize: 16, color: BLUE_HUE,
//                           fontWeight: FontWeight.bold, letterSpacing: 0.7),
//                           onButtonPress: () => Navigator.pop(context, true),
//                           color: GREEN_HUE, buttonWidth: 42),
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         )
//     );
//   }
// }
//
//
// List<Widget> getRatings(int rating) {
//   final starWidgets = <Widget>[];
//   if (rating == null)
//     return starWidgets;
//
//   for (var i = 0; i < rating; i++) {
//     starWidgets.add(Icon(Icons.star, size: 16, color: GREEN_HUE));
//   }
//   return starWidgets;
// }
//
// final List<String> imgList = [
//   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
// ];

// final List<Widget> imageSliders = imgList.map((item) => Container(
//   child: Container(
//     margin: EdgeInsets.all(5.0),
//     child: ClipRRect(
//         borderRadius: BorderRadius.all(Radius.circular(5.0)),
//         child: Stack(
//           children: <Widget>[
//             Image.network(item, fit: BoxFit.cover, width: 1000.0),
//             Positioned(
//               bottom: 0.0,
//               left: 0.0,
//               right: 0.0,
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Color.fromARGB(200, 0, 0, 0),
//                       Color.fromARGB(0, 0, 0, 0)
//                     ],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                   ),
//                 ),
//                 padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                 child: Text(
//                   'No. ${imgList.indexOf(item)} image',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         )
//     ),
//   ),
// )).toList();

List<String> states = [
  "Abia",
  "Adamawa",
  "Akwa Ibom",
  "Anambra",
  "Bauchi",
  "Bayelsa",
  "Benue",
  "Borno",
  "Cross River",
  "Delta",
  "Ebonyi",
  "Edo",
  "Ekiti",
  "Enugu",
  "Gombe",
  "Imo",
  "Jigawa",
  "Kaduna",
  "Kano",
  "Katsina",
  "Kebbi",
  "Kogi",
  "Kwara",
  "Lagos",
  "Nasarawa",
  "Niger",
  "Ogun",
  "Ondo",
  "Osun",
  "Oyo",
  "Plateau",
  "Rivers",
  "Sokoto",
  "Taraba",
  "Yobe",
  "Zamfara",
  "Abuja"
];
