// import 'package:flutter/material.dart';
// import 'package:flutter_login/flutter_login.dart';
// import 'package:resonate/login_page.dart';
// import 'package:resonate/login_student.dart';
// // import 'dashboard_screen.dart';

// const users = {
//   'dribbble@gmail.com': '12345',
//   'hunter@gmail.com': 'hunter',
// };

// class LoginTeacher extends StatelessWidget {
//   const LoginTeacher({Key? key}) : super(key: key);
//   Duration get loginTime => const Duration(milliseconds: 2250);

//   Future<String> _authUser(LoginData data) {
//     // ignore: avoid_print
//     print('Name: ${data.name}, Password: ${data.password}');
//     return Future.delayed(loginTime).then((_) {
//       if (!users.containsKey(data.name)) {
//         return 'User not exists';
//       }
//       if (users[data.name] != data.password) {
//         return 'Password does not match';
//       }
//       return "null";
//     });
//   }

//   // ignore: unused_element
//   Future<String> _recoverPassword(String name) {
//     // ignore: avoid_print
//     print('Name: $name');
//     return Future.delayed(loginTime).then((_) {
//       if (!users.containsKey(name)) {
//         return 'User not exists';
//       }
//       return "null";
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FlutterLogin(
//       title: 'Teacher',
//       logo: 'assets/images/register_teacher.png',
//       onLogin: (_) => Future(() => null),
//       onSignup: (_) => Future(() => null),
//       onSubmitAnimationCompleted: () {
//         Navigator.of(context).pushReplacement(MaterialPageRoute(
//           builder: (context) => const LoginPage(),
//         ));
//       },
//       onRecoverPassword: (_) => Future(() => null),
//       messages: LoginMessages(
//         userHint: 'User',
//         passwordHint: 'Pass',
//         confirmPasswordHint: 'Confirm',
//         loginButton: 'LOG IN',
//         signupButton: 'REGISTER',
//         forgotPasswordButton: 'Forgot password?',
//         recoverPasswordButton: 'HELP ME',
//         goBackButton: 'GO BACK',
//         confirmPasswordError: 'Not match!',
//         recoverPasswordDescription:
//             'Provide email address with which you created this account ',
//         recoverPasswordSuccess: 'Password rescued successfully',
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resonate/login_student.dart';
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

class LoginTeacher extends StatefulWidget {
  const LoginTeacher({Key? key}) : super(key: key);

  @override
  State<LoginTeacher> createState() => _LoginTeacherState();
}

class _LoginTeacherState extends State<LoginTeacher> {
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
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/login_teacher.png'),
                  fit: BoxFit.contain),
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 220.0, left: 218.0),
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints.tightFor(width: 125, height: 30),
                      child: OutlinedButton(
                        child: const Text('Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center),
                        onPressed: () {
                          Navigator.pushNamed(context, '/RegisterTeacher');
                        },
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
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
                                         Navigator.pushNamed(context, '/DashboardT');
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
        ));
  }
}
