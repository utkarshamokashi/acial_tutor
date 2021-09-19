// import 'package:flutter/material.dart';
// // import 'package:flutter_login_signup/src/signup.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:resonate/login_page.dart';

// import 'Widget/bezierContainer.dart';

// class LoginStudent extends StatefulWidget {
//   const LoginStudent({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _LoginStudentState createState() => _LoginStudentState();

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

// class _LoginStudentState extends State<LoginStudent> {
//   Widget _backButton() {
//     return InkWell(
//       onTap: () {
//         Navigator.pop(context);
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         child: Row(
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
//               child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
//             ),
//             const Text('Back',
//                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _entryField(String title, {bool isPassword = false}) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             title,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           TextField(
//               obscureText: isPassword,
//               decoration: InputDecoration(
//                   border: InputBorder.none,
//                   fillColor: Color(0xfff3f3f4),
//                   filled: true))
//         ],
//       ),
//     );
//   }

//   Widget _submitButton() {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.all(15),
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(50)),
//           boxShadow: <BoxShadow>[
//             BoxShadow(
//                 color: Colors.blueGrey.shade800,
//                 offset: Offset(2, 4),
//                 blurRadius: 5,
//                 spreadRadius: 3)
//           ],
//           gradient: LinearGradient(
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//               colors: [Color(0xff415D5F), Color(0xff2E5B5B)])),
//       child: Text(
//         'Login',
//         style: TextStyle(color: Colors.white, fontSize: 20),
//       ),
//     );
//   }

//   Widget _divider() {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         children: <Widget>[
//           SizedBox(
//             width: 20,
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Divider(
//                 thickness: 1,
//               ),
//             ),
//           ),
//           Text('or'),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Divider(
//                 thickness: 1,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _facebookButton() {
//     return Container(
//       height: 50,
//       margin: EdgeInsets.symmetric(vertical: 20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//       ),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             flex: 1,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Color(0xff1959a9),
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(5),
//                     topLeft: Radius.circular(5)),
//               ),
//               alignment: Alignment.center,
//               child: Text('f',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 25,
//                       fontWeight: FontWeight.w400)),
//             ),
//           ),
//           Expanded(
//             flex: 5,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Color(0xff2872ba),
//                 borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(5),
//                     topRight: Radius.circular(5)),
//               ),
//               alignment: Alignment.center,
//               child: Text('Log in with Facebook',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w400)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _createAccountLabel() {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => LoginPage()));
//       },
//       child: Container(
//         // margin: EdgeInsets.symmetric(vertical: 20),
//         // padding: EdgeInsets.all(15),
//         alignment: Alignment.topRight,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: 
//           [ConstrainedBox(
//                       constraints: const BoxConstraints.tightFor(width: 125, height: 30),
//                       child: OutlinedButton(
//                         child: const Text(
//                             'Register',
//                           style: TextStyle(
//                             color: Color(0xff23AEB7),
//                             fontSize: 20,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           textAlign:TextAlign.center),
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30.0),
//                           ),
//                         ),
//                       ),
//           ),
//         ],
//       ),
//     ));
//   }

//   Widget _title() {
//     return RichText(
//       textAlign: TextAlign.center,
//       text: TextSpan(
//           text: 'd',
//           style: GoogleFonts.portLligatSans(
//             textStyle: Theme.of(context).textTheme.headline4,
//             fontSize: 30,
//             fontWeight: FontWeight.w700,
//             color: Color(0xffe46b10),
//           ),
//           // children: [
//           //   TextSpan(
//           //     text: 'ev',
//           //     style: TextStyle(color: Colors.black, fontSize: 30),
//           //   ),
//           //   TextSpan(
//           //     text: 'rnz',
//           //     style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
//           //   ),
//           // ]
//           ),
//     );
//   }

//   Widget _emailPasswordWidget() {
//     return Column(
//       children: <Widget>[
//         _entryField("Email id"),
//         _entryField("Password", isPassword: true),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//         body: Container(
//            decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [Color(0xff8FACAC), Color(0xff619D9D), Color(0xff305B5B)])),
//       height: height,
//       child: Stack(
//         children: <Widget>[
//           Positioned(
//               top: -height * .15,
//               right: -MediaQuery.of(context).size.width * .4,
//               child: const BezierContainer()),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 50),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(height: height * .2),
//                   _title(),
//                   _createAccountLabel(),
//                   SizedBox(height: 50),
//                   _emailPasswordWidget(),
//                   SizedBox(height: 20),
//                   _submitButton(),
//                   Container(
//                     padding: EdgeInsets.symmetric(vertical: 10),
//                     alignment: Alignment.centerRight,
//                     child: Text('Forgot Password ?',
//                         style: TextStyle(
//                             fontSize: 14, fontWeight: FontWeight.w500)),
//                   ),
//                   _divider(),
//                   _facebookButton(),
//                   SizedBox(height: height * .055),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(top: 40, left: 0, child: _backButton()),
//         ],
//       ),
//     ));
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';
import 'global_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  // const Main({Key? key}) : super(key: key);
  Future<Widget> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    // ignore: avoid_print
    print(email);
    runApp(
        MaterialApp(home: email == null ? const LoginPage() : LoginStudent()));
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}

class LoginStudent extends StatefulWidget {
  const LoginStudent({Key? key}) : super(key: key);

  @override
  State<LoginStudent> createState() => _LoginStudentState();
}

class _LoginStudentState extends State<LoginStudent> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final user = FirebaseAuth.instance.currentUser();

  void getCurrentUser() async {
    final FirebaseUser User = await user;
    Variables.currentEmail = User.email;
    // Similarly we can get email as well
    //final uemail = user.email;
    print(Variables.currentEmail);
    //print(uemail);
  }

  Future<void> resetPassword(_email) async {
    //await _auth.sendPasswordResetEmail(email: _email);

    await _auth.sendPasswordResetEmail(email: _email).then((result) {
      const snackBar = SnackBar(
        content: Text('Password reset link has been sent!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop();
      _email = "";
    }).catchError((error) {
      const snackBar = SnackBar(
        content: Text('User does not exist!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop();
      _email = "";
    });
  }

  final resetEmail = TextEditingController();

  String _email = "";

  String _password = "";

  final _auth = FirebaseAuth.instance;

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
        home: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/login_student.png'),
                  fit: BoxFit.contain
              ),
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
              Padding(
              padding: const EdgeInsets.only(top: 280.0, left:218.0),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(width: 125, height: 30),
                    child: OutlinedButton(
                      child: const Text(
                          'Register',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign:TextAlign.center),
                      onPressed: () {
                        Navigator.pushNamed(context, '/RegisterStudent');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),

                  ),
              ),
                  const SizedBox
                    (
                    height: 50.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: TextField(
                        style: const TextStyle(
                        ),
                        onChanged: (value) {
                          _email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.start,
                        decoration:
                        kInputDecoration.copyWith(hintText: "Email", fillColor: Colors.white, filled: true)
                    ),
                  ),
                  const SizedBox
                    (
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      //controller: _userPasswordController,
                      onChanged: (value) {
                        _password = value;
                      },
                      obscureText: !_passwordVisible,
                      decoration: kInputDecoration.copyWith(
                          hintText:
                          "Password",
                          //This will obscure text dynamically
                          // Here is key idea
                          suffixIcon: IconButton(
                              icon: IconTheme(
                                data: const IconThemeData(
                                    color: Colors.white),
                                child: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              }
                            // Update the state i.e. toogle the state of passwordVisible variable

                          ),
                          fillColor: Colors.white, filled: true
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, left: 0.0),
                    child: Container(
                      width: 150,
                      height: 60,
                      decoration: const ShapeDecoration(
                        shape: StadiumBorder(),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff415D5F),
                            Color(0xff4E7575),
                            Color(0xff2E5B5B)
                          ],
                        ),
                      ),
                      child: MaterialButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: const StadiumBorder(),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () async {
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: _email, password: _password);
                            // ignore: unnecessary_null_comparison
                            if (user !=  null) {
                              var userRecord = FirebaseAuth.instance.currentUser().then((user) => Variables.currentEmail =user.email);
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setString('email', _email);
                              Navigator.pushNamed(context, '/DashboardS');
                              print("Logged IN");
                              print(Variables.currentEmail);
                            }
                          }
                          catch (e) {
                            print(e);
                            setState(() {
                              const snackBar =  SnackBar(content: Text('Wrong Email or Password'),);
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);});
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
