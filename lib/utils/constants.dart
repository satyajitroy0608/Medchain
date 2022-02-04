import 'package:flutter/material.dart';

class AppSpaces {
  static EdgeInsets pagePadding = EdgeInsets.all(14);
}

double? h;
double? w;

//smart contract constants
String adminAddress = '0x75936a0c47FeCEf2367BF8d16901C0B9A9c432b2';
String infura_rinkbyURL =
    "https://rinkeby.infura.io/v3/fec8932d1dbe4c1ebe1a51559749ed8b";
String contractAddress = "0x6B5902009c203943ab95Bb9c06116a8D9A341885";
String adminPrivateKey = adminPrivateKey; //secret

List doctors = [
  [
    'Dr. Akshit Madan',
    'MBBS | General Physician 12 Years Experience Overall',
    1234
  ],
  [
    'Dr. Satyajit Roy',
    'MBBS | General Physician | 12 Years Experience Overall',
    5678
  ],
  [
    'Dr. Vedant Sinha',
    'MBBS | General Physician | 16 Years Experience Overall',
    2345
  ]
];

List patients = [
  ['Rohit M.', 'Diabetes', 32, 1234],
  ['Shruti Singh', 'Chest Pain', 55, 5678],
  ['Aditya Kapoor', 'Brain Tumor', 77, 2345]
];
