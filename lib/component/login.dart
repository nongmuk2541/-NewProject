// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// //import 'package:newlaundry/widgets/pickimage.dart';
// import 'dart:io';
// import 'dart:math';
// import 'dart:async';
// import 'package:path/path.dart' as Path;
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';

// //import 'package:firebase_core/firebase_core.dart';

// // import 'package:flutter_form_bloc/flutter_form_bloc.dart';

// class InformationLaundry extends StatefulWidget {
//   @override
//   InformationLaundryState createState() => InformationLaundryState();
// }

// class InformationLaundryState extends State<InformationLaundry> {
//   File imageFile, file;
//   String urlPic, name, phone, adress;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       backgroundColor: Colors.deepOrange[100],

//       body: ListView(
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(top: 15, left: 15),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 IconButton(
//                   icon: Icon(Icons.arrow_back_ios),
//                   color: Colors.white,
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             alignment: Alignment.topCenter,
//             child: Text(
//               'เพิ่มรายละเอียดร้าน',
//               style: TextStyle(
//                   color: Colors.redAccent,
//                   fontFamily: 'Prompt',
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),

//           SizedBox(height: 30, width: 30),
//           Container(
//             padding: EdgeInsets.only(left: 30, right: 30),
//             child: Column(
//               children: [
//                 TextField(
//                   onChanged: (String string) {
//                     name = string.trim();
//                     print('insert name done');
//                   },
//                   maxLines: null,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'ชื่อร้าน',
//                     labelStyle: TextStyle(
//                         color: Colors.black,
//                         fontFamily: 'Prompt',
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400),
//                     prefixIcon: Icon(
//                       Icons.shopping_basket,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//               ],
//             ),

//           ),

//   },
// }

//   void _settingModalBottomSheet(context, index) {
//     print(index);
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext bc) {
//           return Container(
//             child: new Wrap(
//               children: <Widget>[
//                 new ListTile(
//                     leading: new Icon(Icons.remove_red_eye),
//                     title: new Text(
//                       'ดู',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontFamily: 'Prompt',
//                           fontSize: 16,
//                           fontWeight: FontWeight.w300),
//                     ),
//                     onTap: () => {}),
//                 new ListTile(
//                     leading: new Icon(Icons.remove_circle),
//                     title: new Text(
//                       'ลบ',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontFamily: 'Prompt',
//                           fontSize: 16,
//                           fontWeight: FontWeight.w300),
//                     ),
//                     onTap: () {
//                       setState(() {
//                         imageFiles.removeAt(index);
//                         Navigator.of(context).pop();
//                         deleteImage(urlPic);
//                       });
//                     }),
//               ],
//             ),
//           );
//         });
//   }

//   Future<void> uploadPicToStorage() async {
//     Random random = Random();
//     int i = random.nextInt(100000);

//     FirebaseStorage firebaseStorage = FirebaseStorage.instance;
//     StorageReference storageReference =
//         firebaseStorage.ref().child('PicInformationelaundry/inforlaunry$i.jpg');
//     StorageUploadTask storageUploadTask = storageReference.putFile(imageFile);

//     urlPic = await (await storageUploadTask.onComplete).ref.getDownloadURL();
//     print('urlPic is = $urlPic');
//     insertinformation();
//   }

//   Future<void> insertinformation() async {
//     final databaseReference = Firestore.instance;
//     //Firestore firestore = Firestore.instance;

//     Map<String, dynamic> map = Map();
//     map['Name'] = name;
//     map['Adress'] = adress;
//     map['Phone'] = phone;
//     map['URLpic'] = urlPic;
//     //await Firebase.initializeApp();
//     await databaseReference
//         .collection('InformationLaundry')
//         .document()
//         .setData(map)
//         .then((value) {
//       print('insert Successfully');
//     });
//   }

//   Future<void> deleteImage(String urlPic) async {
//     var fileUrl = Uri.decodeFull(Path.basename(urlPic))
//         .replaceAll(new RegExp(r'(\?alt).*'), '');

//     final StorageReference firebaseStorageRef =
//         FirebaseStorage.instance.ref().child(fileUrl);
//     await firebaseStorageRef.delete();
//     print('Successfully deleted $urlPic from storage');
//   }
// }
// //}

// ////////////////////////////////////////////////////////////////
// // import 'package:CWCFlutter/api/food_api.dart';
// // import 'package:CWCFlutter/model/user.dart';
// // import 'package:CWCFlutter/notifier/auth_notifier.dart';
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';

// // enum AuthMode { Signup, Login }

// // class Login extends StatefulWidget {
// //   @override
// //   State<StatefulWidget> createState() {
// //     return _LoginState();
// //   }
// // }

// // class _LoginState extends State<Login> {
// //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// //   final TextEditingController _passwordController = new TextEditingController();
// //   AuthMode _authMode = AuthMode.Login;

// //   User _user = User();

// //   @override
// //   void initState() {
// //     AuthNotifier authNotifier =
// //         Provider.of<AuthNotifier>(context, listen: false);
// //     initializeCurrentUser(authNotifier);
// //     super.initState();
// //   }

// //   void _submitForm() {
// //     if (!_formKey.currentState.validate()) {
// //       return;
// //     }

// //     _formKey.currentState.save();

// //     AuthNotifier authNotifier =
// //         Provider.of<AuthNotifier>(context, listen: false);

// //     if (_authMode == AuthMode.Login) {
// //       login(_user, authNotifier);
// //     } else {
// //       signup(_user, authNotifier);
// //     }
// //   }

// //   Widget _buildDisplayNameField() {
// //     return TextFormField(
// //       decoration: InputDecoration(
// //         labelText: "Display Name",
// //         labelStyle: TextStyle(color: Colors.white54),
// //       ),
// //       keyboardType: TextInputType.text,
// //       style: TextStyle(fontSize: 26, color: Colors.white),
// //       cursorColor: Colors.white,
// //       validator: (String value) {
// //         if (value.isEmpty) {
// //           return 'Display Name is required';
// //         }

// //         if (value.length < 5 || value.length > 12) {
// //           return 'Display Name must be betweem 5 and 12 characters';
// //         }

// //         return null;
// //       },
// //       onSaved: (String value) {
// //         _user.displayName = value;
// //       },
// //     );
// //   }

// //   Widget _buildEmailField() {
// //     return TextFormField(
// //       decoration: InputDecoration(
// //         labelText: "Email",
// //         labelStyle: TextStyle(color: Colors.white54),
// //       ),
// //       keyboardType: TextInputType.emailAddress,
// //       initialValue: 'julian@food.com',
// //       style: TextStyle(fontSize: 26, color: Colors.white),
// //       cursorColor: Colors.white,
// //       validator: (String value) {
// //         if (value.isEmpty) {
// //           return 'Email is required';
// //         }

// //         if (!RegExp(
// //                 r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
// //             .hasMatch(value)) {
// //           return 'Please enter a valid email address';
// //         }

// //         return null;
// //       },
// //       onSaved: (String value) {
// //         _user.email = value;
// //       },
// //     );
// //   }

// //   Widget _buildPasswordField() {
// //     return TextFormField(
// //       decoration: InputDecoration(
// //         labelText: "Password",
// //         labelStyle: TextStyle(color: Colors.white54),
// //       ),
// //       style: TextStyle(fontSize: 26, color: Colors.white),
// //       cursorColor: Colors.white,
// //       obscureText: true,
// //       controller: _passwordController,
// //       validator: (String value) {
// //         if (value.isEmpty) {
// //           return 'Password is required';
// //         }

// //         if (value.length < 5 || value.length > 20) {
// //           return 'Password must be betweem 5 and 20 characters';
// //         }

// //         return null;
// //       },
// //       onSaved: (String value) {
// //         _user.password = value;
// //       },
// //     );
// //   }

// //   Widget _buildConfirmPasswordField() {
// //     return TextFormField(
// //       decoration: InputDecoration(
// //         labelText: "Confirm Password",
// //         labelStyle: TextStyle(color: Colors.white54),
// //       ),
// //       style: TextStyle(fontSize: 26, color: Colors.white),
// //       cursorColor: Colors.white,
// //       obscureText: true,
// //       validator: (String value) {
// //         if (_passwordController.text != value) {
// //           return 'Passwords do not match';
// //         }

// //         return null;
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     print("Building login screen");

// //     return Scaffold(
// //       body: Container(
// //         constraints: BoxConstraints.expand(
// //           height: MediaQuery.of(context).size.height,
// //         ),
// //         decoration: BoxDecoration(color: Color(0xff34056D)),
// //         child: Form(
// //           autovalidate: true,
// //           key: _formKey,
// //           child: SingleChildScrollView(
// //             child: Padding(
// //               padding: EdgeInsets.fromLTRB(32, 96, 32, 0),
// //               child: Column(
// //                 children: <Widget>[
// //                   Text(
// //                     "Please Sign In",
// //                     textAlign: TextAlign.center,
// //                     style: TextStyle(fontSize: 36, color: Colors.white),
// //                   ),
// //                   SizedBox(height: 32),
// //                   _authMode == AuthMode.Signup
// //                       ? _buildDisplayNameField()
// //                       : Container(),
// //                   _buildEmailField(),
// //                   _buildPasswordField(),
// //                   _authMode == AuthMode.Signup
// //                       ? _buildConfirmPasswordField()
// //                       : Container(),
// //                   SizedBox(height: 32),
// //                   ButtonTheme(
// //                     minWidth: 200,
// //                     child: RaisedButton(
// //                       padding: EdgeInsets.all(10.0),
// //                       child: Text(
// //                         'Switch to ${_authMode == AuthMode.Login ? 'Signup' : 'Login'}',
// //                         style: TextStyle(fontSize: 20, color: Colors.white),
// //                       ),
// //                       onPressed: () {
// //                         setState(() {
// //                           _authMode = _authMode == AuthMode.Login
// //                               ? AuthMode.Signup
// //                               : AuthMode.Login;
// //                         });
// //                       },
// //                     ),
// //                   ),
// //                   SizedBox(height: 16),
// //                   ButtonTheme(
// //                     minWidth: 200,
// //                     child: RaisedButton(
// //                       padding: EdgeInsets.all(10.0),
// //                       onPressed: () => _submitForm(),
// //                       child: Text(
// //                         _authMode == AuthMode.Login ? 'Login' : 'Signup',
// //                         style: TextStyle(fontSize: 20, color: Colors.white),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
