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
String contractAddress = "0x8b0523a6601e3B553802a97D8d3868c65c7D009d";
String adminPrivateKey =
    "9e2c82ef68ad0baf4bc0fa84bbdc84e39e5f9a49d874cb635f895985ea45d2f8";

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
