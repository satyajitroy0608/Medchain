import 'package:flutter/material.dart';
import 'package:medchain/utils/constants.dart';
import 'package:medchain/widgets/doctorImage.dart';

class MyPrescription extends StatefulWidget {
  const MyPrescription({Key? key}) : super(key: key);

  @override
  _MyPrescriptionState createState() => _MyPrescriptionState();
}

class _MyPrescriptionState extends State<MyPrescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: AppSpaces.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prescribed on 30 Jan 2022',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey.shade600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                "In the case of a high fever, or a low fever that's causing discomfort, your doctor may recommend an over-the-counter medication, such as acetaminophen (Tylenol, others) or ibuprofen (Advil, Motrin IB, others). Use these medications according to the label instructions or as recommended by your doctor"),
            SizedBox(
              height: 10,
            ),
            Text(
              'Printable Format',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey.shade600),
            ),
            SizedBox(
              height: 10,
            ),
            doctorImage('assets/images/p.jpeg')
          ],
        ),
      ),
    );
  }
}
