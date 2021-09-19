import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
        home: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/resonate_login.png'),
                  fit: BoxFit.contain
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 255.0, left: 20.0),
                    child: Text(
                      'Student',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, right: 100.0),
                    child: IconButton(
                      icon: const Icon(LineIcons.angleDoubleRight),
                      color: Colors.black,
                      iconSize: 75.0,
                      onPressed: (){
                        Navigator.pushNamed(context, '/LoginStudent');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 250),
                    child: IconButton(
                      icon: const Icon(LineIcons.angleDoubleLeft),
                      color: Colors.black,
                      iconSize: 75.0,
                      onPressed: ()
                    {
                      Navigator.pushNamed(context, '/LoginTeacher');
                    },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 90.0, left: 106.0),
                    child: Text(
                      'Teacher',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
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
