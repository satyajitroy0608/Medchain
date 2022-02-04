import 'package:flutter/material.dart';
import 'package:medchain/pages/doctor/prescription.dart';
import 'package:medchain/utils/constants.dart';

class EnterPass extends StatefulWidget {
  const EnterPass({Key? key}) : super(key: key);

  @override
  _EnterPassState createState() => _EnterPassState();
}

class _EnterPassState extends State<EnterPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: AppSpaces.pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Enter Patient Password'),
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
                            builder: (context) => Prescription()));
                  },
                  child: Text('Prescribe -->')),
            ),
          ],
        ),
      ),
    );
  }
}
