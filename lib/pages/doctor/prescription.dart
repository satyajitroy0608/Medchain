import 'package:flutter/material.dart';
import 'package:medchain/utils/constants.dart';

class Prescription extends StatefulWidget {
  const Prescription({Key? key}) : super(key: key);

  @override
  _PrescriptionState createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
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
              'Write Prescription',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              maxLines: 10,
              minLines: 6,
              decoration: InputDecoration(
                  hintText: 'Write Your Prescription here...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
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
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Prescription Added Successfully')));
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text('Done')),
            ),
          ],
        ),
      ),
    );
  }
}
