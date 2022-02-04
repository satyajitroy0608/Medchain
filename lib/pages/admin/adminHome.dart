import 'package:flutter/material.dart';
import 'package:medchain/auth/login.dart';
import 'package:medchain/pages/admin/addDoctor.dart';
import 'package:medchain/pages/admin/addPatient.dart';
import 'package:medchain/pages/admin/allDoctors.dart';
import 'package:medchain/pages/admin/allPatients.dart';
import 'package:medchain/services/functions/smartFunctions.dart';
import 'package:medchain/utils/colors.dart';
import 'package:medchain/utils/constants.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  int selectedindex = 0;
  PageController pageController = PageController();

  Client? httpClient;
  Web3Client? ethClient;

  @override
  void initState() {
    httpClient = Client();
    ethClient = Web3Client(infura_rinkbyURL, httpClient!);
    super.initState();
  }

  void onTapped(int index) {
    setState(() {
      selectedindex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.home))],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTapped,
          currentIndex: selectedindex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade500,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.local_hospital), label: 'Doctor'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Patient')
          ]),
      body: PageView(
        controller: pageController,
        children: [
          AllDoctors(
            ethClient: ethClient!,
          ),
          AllPatients(
            ethClient: ethClient!,
          )
        ],
      ),
    );
  }
}
