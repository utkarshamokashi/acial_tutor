import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:line_icons/line_icons.dart';

class Join extends StatefulWidget {
  @override
  _JoinState createState() => _JoinState();
}

class _JoinState extends State<Join> {
  final _formKey = GlobalKey<FormState>();
  String _formMeetingId = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Dashboard'),
          backgroundColor: const Color(0xff006F73),
        ),
        drawer: Drawer(
          child: Container(
            color: const Color(0xff006F73),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const SizedBox(
                  height: 114.0,
                  child: DrawerHeader(
                    decoration: BoxDecoration(),
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ListTile(
                    leading: const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Icon(Icons.logout, size: 36.0,
                          color: Colors.white),
                    ),
                    title: const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('Logout', style: TextStyle(fontSize: 24.0, color: Colors.white)),
                    ),
                    onTap: () => {
                      Navigator.pushNamed(context, '/'),
                    }),
              ],
            ),
          ),
        ),
        extendBody: true,
        bottomNavigationBar: FloatingNavbar(
          backgroundColor: const Color(0xff3FBBBD),
          onTap: (int val) {
            switch (val) {
              case 0:
                {
                  setState(() =>{Navigator.pushNamed(context, '/DashboardT')});
                }
                break;

              case 1:
                {
                  setState(() =>{Navigator.pushNamed(context, '/Join')});
                }
                break;
              case 2:
                {
                  setState(() =>{Navigator.pushNamed(context, '/RegisterTeacher')});
                }
                break;
              default:
                {
                  print("HIIIIIIIIIIIIIIIIIIII");
                }
                break;
            }
          },
          currentIndex: 1,
          items: [
            FloatingNavbarItem(icon: Icons.home, title: 'Home'),
            FloatingNavbarItem(icon: LineIcons.meetup, title: 'Meets',),
            FloatingNavbarItem(icon: LineIcons.excelFile, title: 'Attendance record'),
          ],
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(40),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  onSaved: (value) => _formMeetingId = value!,
                  decoration: const InputDecoration(
                    labelText: 'Enter a MeetingID',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return "Enter Meeting ID";
                    return null;
                  },
                ),
              ),
            ),
            RaisedButton(
              onPressed: () => _joinMeeting(),
              child: Text('Join Meeting'),
            )
          ],
        ),
      ),
    ),
    );
  }

  _joinMeeting() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        print(_formMeetingId);
        var options = JitsiMeetingOptions()..room = _formMeetingId;

        await JitsiMeet.joinMeeting(options);
      } catch (error) {
        debugPrint("error: $error");
      }
    }
  }
}
