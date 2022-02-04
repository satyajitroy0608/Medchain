import 'package:flutter/material.dart';
import 'package:medchain/auth/login.dart';
import 'package:medchain/utils/colors.dart';
import 'package:medchain/utils/constants.dart';
import 'package:medchain/widgets/doctorImage.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: AppSpaces.pagePadding,
        child: Column(
          children: [
            doctorImage('assets/images/doctor.png'),
            Text(
              'Medchain',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              'Your Records are safe with Medchain',
              style: TextStyle(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(5),
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login(
                                  user: 'admin',
                                )));
                  },
                  child: Text('Login as Admin')),
            ),
            Container(
              margin: EdgeInsets.all(5),
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login(
                                  user: 'doctor',
                                )));
                  },
                  child: Text('Login as Doctor')),
            ),
            Container(
              margin: EdgeInsets.all(5),
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login(
                                  user: 'patient',
                                )));
                  },
                  child: Text('Login as Patient')),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
