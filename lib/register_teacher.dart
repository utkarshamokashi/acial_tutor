import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:resonate/login_student.dart';
import 'package:resonate/login_teacher.dart';
import 'constants.dart';
import 'global_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:resonate/register_student.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  // const Main({Key? key}) : super(key: key);
  Future<Widget> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var first_name = prefs.getString('first_name');
    // ignore: avoid_print
    print(first_name);
    runApp(
        MaterialApp(home: first_name == null ? const LoginTeacher() : const LoginStudent()));
    return Container();

  }

  @override
  Widget build(BuildContext context) {
    return const LoginTeacher();
  }
}
class RegisterTeacher extends StatefulWidget {
  const RegisterTeacher({Key? key}) : super(key: key);

  @override
  State<RegisterTeacher> createState() => _RegisterTeacherState();
}

class _RegisterTeacherState extends State<RegisterTeacher> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final user = FirebaseAuth.instance.currentUser();

  void getCurrentUser() async {
    final FirebaseUser User = await user;
    Variables.currentEmail = User.email;
    // Similarly we can get email as well
    //final uemail = user.email;
    print(Variables.currentEmail);
    //print(uemail);
  }

  String _email = "";
  String _firstname = "";
  String _lastname = "";
  String _password = "";
  String _confirmpassword = "";
  final _auth = FirebaseAuth.instance;
  bool _passwordVisible = false;
  String _errorMessage = '';
  final FocusNode _firstNameFocus = FocusNode();

  void processError(final PlatformException error) {
    setState(() {
      _errorMessage = error.message!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/register_teacher.png'),
                  fit: BoxFit.contain),
            ),
            child: Scaffold(
              key: _formKey,
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50, top:170),
                    child: TextFormField(
                        onChanged: (value) {
                          _firstname = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your first name.';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.start,
                        decoration:
                        kInputDecoration.copyWith(hintText: "First name", fillColor: Colors.white, filled: true)),
                  ),
                  const SizedBox
                    (
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: TextFormField(
                        onChanged: (value) {
                          _lastname = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your last name.';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.start,
                        decoration:
                        kInputDecoration.copyWith(hintText: "Last name", fillColor: Colors.white, filled: true)),
                  ),
                  const SizedBox
                    (
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: TextFormField(
                        onChanged: (value) {
                          _email = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email.';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.start,
                        decoration:
                        kInputDecoration.copyWith(hintText: "Email", fillColor: Colors.white, filled: true)),
                  ),
                  const SizedBox
                    (
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      //controller: _userPasswordController,
                      onChanged: (value) {
                        _password = value;
                      },
                      validator: (value) {
                        if (value!.length < 8) {
                          return 'Password must be longer than 8 characters.';
                        }
                        return null;
                      },
                      autofocus: false,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(),
                      obscureText: !_passwordVisible,
                      decoration: kInputDecoration.copyWith(
                        hintText:
                        "Password", //This will obscure text dynamically
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
                  const SizedBox
                    (
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: TextFormField(
                        style: const TextStyle(),
                        onChanged: (value) {
                          _confirmpassword = value;
                        },
                        autofocus: false,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (_confirmpassword.length > 8 &&
                              _password != value) {
                            return 'Passwords do not match.';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (term) {
                          FocusScope.of(context).requestFocus(_firstNameFocus);
                        },
                        textAlign: TextAlign.start,
                        decoration:
                        kInputDecoration.copyWith(
                            hintText: "Confirm Password", fillColor: Colors.white, filled: true)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 0.0),
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
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed:() {
                                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                                            email: _email,
                                 password: _password)
                                     .then((onValue) {
                                        Firestore.instance.collection("data").document(_firstname).setData({
                                              "firstname": _firstname,
                                              "lastname": _lastname,
                                              "email": _email,
                                              "password":_password,
                                              }).then((userInfoValue) {
                                                 Navigator.pushNamed(context, '/LoginRegister');
                                              });
                                              }).catchError((onError) {
                                                         processError(onError);
                                              });
                                          },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '$_errorMessage',
                      style: TextStyle(fontSize: 14.0, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}