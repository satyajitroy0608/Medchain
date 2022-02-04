import 'package:flutter/material.dart';
import 'package:medchain/pages/admin/addDoctor.dart';
import 'package:medchain/utils/constants.dart';
import 'package:medchain/widgets/doctorImage.dart';
import 'package:web3dart/web3dart.dart';

class AllDoctors extends StatefulWidget {
  final Web3Client ethClient;

  const AllDoctors({Key? key, required this.ethClient}) : super(key: key);

  @override
  _AllDoctorsState createState() => _AllDoctorsState();
}

class _AllDoctorsState extends State<AllDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        padding: AppSpaces.pagePadding,
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 120,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
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
                                      doctors[index][0],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(doctors[index][1])
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
                  ),
                );
              },
            )),
            Container(
              margin: EdgeInsets.all(5),
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddDoctor(
                                  ethClient: widget.ethClient,
                                )));
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
