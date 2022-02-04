import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:medchain/auth/login.dart';
import 'package:medchain/services/functions/smartFunctions.dart';
import 'package:medchain/utils/constants.dart';
import 'package:medchain/widgets/doctorImage.dart';
import 'package:web3dart/web3dart.dart';

class AddDoctor extends StatefulWidget {
  final Web3Client ethClient;
  const AddDoctor({Key? key, required this.ethClient}) : super(key: key);

  @override
  _AddDoctorState createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController expertiseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: AppSpaces.pagePadding,
        child: Column(
          children: [
            doctorImage('assets/images/doctor2.png'),
            TextField(
              decoration:
                  InputDecoration(hintText: 'Enter Doctor Public Address'),
              controller: idController,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Enter Doctor Name'),
              controller: nameController,
            ),
            // TextField(
            //   decoration: InputDecoration(hintText: "Enter Doctor's Expertise"),
            //   controller: expertiseController,
            // ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(5),
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    print(idController.text);
                    print(nameController.text);
                    addDoctorInfo(idController.text, nameController.text,
                        widget.ethClient);
                  },
                  child: Text('Add Doctor')),
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
