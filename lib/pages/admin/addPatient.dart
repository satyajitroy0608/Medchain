import 'package:flutter/material.dart';
import 'package:medchain/auth/login.dart';
import 'package:medchain/utils/constants.dart';
import 'package:medchain/widgets/doctorImage.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({Key? key}) : super(key: key);

  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController symptompsController = TextEditingController();
  TextEditingController doctorIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: AppSpaces.pagePadding,
        child: Column(
          children: [
            Container(child: doctorImage('assets/images/patient.png')),
            TextField(
              decoration: InputDecoration(hintText: 'Enter Patient ID'),
              controller: idController,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Enter Patient Name'),
              controller: nameController,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Add Patient's Problem"),
              controller: symptompsController,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Allot Doctor ID'),
              controller: doctorIdController,
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
                    setState(() {
                      patients.add([
                        nameController.text,
                        symptompsController.text,
                        idController.text,
                        doctorIdController.text
                      ]);
                    });
                  },
                  child: Text('Add Patient')),
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
