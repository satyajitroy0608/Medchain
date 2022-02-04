import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:medchain/utils/constants.dart';
import 'package:web3dart/web3dart.dart';

Future<DeployedContract> loadContract() async {
  String abi = await rootBundle.loadString('assets/abi.json');
  String contractAddresss = contractAddress;
  final contract = DeployedContract(
      ContractAbi.fromJson(abi, 'Contract'), //Contract.sol
      EthereumAddress.fromHex(contractAddresss));
  return contract;
}

Future<List> getAllDoctors(Web3Client ethClient) async {
  List<dynamic> result = await query('getAllDrs', [], ethClient);
  return result;
}

Future<List<dynamic>> query(
    String funcName, List<dynamic> args, Web3Client ethClient) async {
  final contract = await loadContract();
  final ethFunction = contract.function(funcName);
  final result =
      ethClient.call(contract: contract, function: ethFunction, params: args);
  return result;
}

Future<String> submit(
    String funcName, List<dynamic> args, Web3Client ethClient) async {
  EthPrivateKey credentails = EthPrivateKey.fromHex(adminPrivateKey);
  DeployedContract contract = await loadContract();
  final ethFunction = contract.function(funcName);
  final result = await ethClient.sendTransaction(
      credentails,
      Transaction.callContract(
          contract: contract, function: ethFunction, parameters: args),
      chainId: null,
      fetchChainIdFromNetworkId: true);
  return result;
}

Future<String> addDoctorInfo(
    String doctorAddress, String info, Web3Client ethClient) async {
  var response = await submit(
      "addDrInfo", [EthereumAddress.fromHex(doctorAddress), info], ethClient);
  print('Doctor Added');
  return response;
}

Future<String> addPatient(String patientAddress, Web3Client ethClient) async {
  var response = await submit(
      "addPatient", [EthereumAddress.fromHex(patientAddress)], ethClient);
  print('Patient Added');
  return response;
}
