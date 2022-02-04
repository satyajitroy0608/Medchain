import 'package:flutter/material.dart';
import 'package:medchain/pages/patient/myPrescription.dart';
import 'package:medchain/utils/constants.dart';

class MyDoc extends StatefulWidget {
  const MyDoc({Key? key}) : super(key: key);

  @override
  _MyDocState createState() => _MyDocState();
}

class _MyDocState extends State<MyDoc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Doctors'),
        ),
        body: Container(
            padding: AppSpaces.pagePadding,
            child: Column(children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyPrescription()));
                },
                child: Container(
                  // decoration: buttonDecoration,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Expanded(child: Container()),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr. Satyajit Roy',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    'MBBS | General Physician | 12 Years Experience Overall')
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://pbs.twimg.com/media/DZotU1hW0AEDN5F.jpg'),
                            radius: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ])));
  }
}
