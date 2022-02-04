import 'package:flutter/material.dart';
import 'package:medchain/pages/admin/addDoctor.dart';
import 'package:medchain/pages/admin/addPatient.dart';
import 'package:medchain/pages/doctor/enterPass.dart';
import 'package:medchain/utils/constants.dart';
import 'package:medchain/widgets/doctorImage.dart';

class MyPatients extends StatefulWidget {
  const MyPatients({Key? key}) : super(key: key);

  @override
  _MyPatientsState createState() => _MyPatientsState();
}

class _MyPatientsState extends State<MyPatients> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('My Patients'),
      ),
      body: Container(
        padding: AppSpaces.pagePadding,
        child: Column(
          children: [
            Expanded(
                child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: patients.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EnterPass()));
                  },
                  child: Container(
                    // height: 150,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        // decoration: buttonDecoration,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Expanded(child: Container()),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://pbs.twimg.com/media/DZotU1hW0AEDN5F.jpg'),
                                  radius: 30,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      patients[index][0],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      patients[index][1],
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
            // Container(
            //   margin: EdgeInsets.all(5),
            //   height: 50,
            //   width: double.infinity,
            //   child: ElevatedButton(
            //       onPressed: () {

            //       },
            //       child: Text('Add Patient')),
            // ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
