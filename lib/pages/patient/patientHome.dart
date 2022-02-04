import 'package:flutter/material.dart';
import 'package:medchain/pages/patient/myDoctor.dart';
import 'package:medchain/utils/constants.dart';

class PatientHome extends StatefulWidget {
  const PatientHome({Key? key}) : super(key: key);

  @override
  _PatientHomeState createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
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
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTapped,
          currentIndex: selectedindex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade500,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.local_hospital), label: 'My Doctors'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ]),
      body: PageView(
        controller: pageController,
        children: [MyDoc()],
      ),
      // Container(
      //   padding: AppSpaces.pagePadding,
      //   child: Column(
      //     children: [
      //       Expanded(child: Container()),
      //       Container(
      //         margin: EdgeInsets.all(5),
      //         height: 50,
      //         width: double.infinity,
      //         child: ElevatedButton(
      //             onPressed: () {
      //               Navigator.push(context,
      //                   MaterialPageRoute(builder: (context) => Login()));
      //             },
      //             child: Text('Add a Doctor')),
      //       ),
      //       Container(
      //         margin: EdgeInsets.all(5),
      //         height: 50,
      //         width: double.infinity,
      //         child: ElevatedButton(
      //             onPressed: () {
      //               Navigator.push(context,
      //                   MaterialPageRoute(builder: (context) => Login()));
      //             },
      //             child: Text('Add a Patient')),
      //       ),
      //       SizedBox(
      //         height: 30,
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
