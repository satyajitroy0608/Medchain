import 'package:flutter/material.dart';
import 'package:medchain/pages/admin/allDoctors.dart';
import 'package:medchain/pages/admin/allPatients.dart';
import 'package:medchain/pages/doctor/myPatients.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  _DoctorHomeState createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  int selectedindex = 0;
  PageController pageController = PageController();

  // List<Widget> widgets = [
  //   Text('Home'),
  //   Text('Search'),
  //   Text('Add'),
  //   Text('Profile'),
  // ];
  void onTapped(int index) {
    setState(() {
      selectedindex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //     onTap: onTapped,
      //     currentIndex: selectedindex,
      //     selectedItemColor: Colors.white,
      //     unselectedItemColor: Colors.grey.shade500,
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.local_hospital), label: 'Doctor'),
      //       BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Patient')
      //     ]),
      body: PageView(
        controller: pageController,
        children: [MyPatients()],
      ),
    );
  }
}
