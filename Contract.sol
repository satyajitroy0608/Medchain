// SPDX-License-Identifier: MIT

pragma solidity >= 0.4.21;

import './Roles.sol';

contract Contract{

    using Roles for Roles.Role;

    Roles.Role private admin;
    Roles.Role private doctor;
    Roles.Role private patient;

    struct Doctor
    {
        string drHash;
    }

    struct Patient
    {
        string patHash;
        bytes32 password;
    }

    struct MedRec
    {
        string RecordHash;
    }

    mapping(address => Doctor) Doctors;
    mapping(address => Patient) Patients;
    mapping(address => MedRec) Records;

    address[] public Dr_ids;
    address[] public Patient_ids;
    //string[] public RecordHashes;

    address accountId;
    address admin_id;
    address get_patient_id;
    address get_dr_id;

    uint internal real_length;
    uint internal real_lengthP;

    constructor() public{
        admin_id = msg.sender;
        admin.add(admin_id); // admin_id is added to admin
    }

    //get Admin

    function getAdmin() public view returns(address){
        return admin_id;
    }

    /*
    
        Doctor
    
    */

    //Add Doctor


    function addDoctor(address _newdr) external onlyAdmin() {
        doctor.add(_newdr);
        Dr_ids.push(_newdr);
        real_length++;
    }

    function addDrInfo(address dr_id, string memory _drInfo_hash) public onlyAdmin()
    {
        //require(doctor.has(msg.sender), 'Only For Doctor');

        Doctor storage drInfo = Doctors[dr_id];
        drInfo.drHash = _drInfo_hash;
        Dr_ids.push(dr_id);
        real_length++;
        doctor.add(dr_id);
        //Dr_ids.push(dr_id) - 1;

        //doctor.add(dr_id);
    }

    function updateDoctorInfo(address dr_id, string memory _drInfo_hash) public onlyAdmin()
    {
        //require(doctor.has(dr_id) || admin_id == msg.sender, "Only Doctor or Admin can do this");
        Doctor storage drInfo = Doctors[dr_id];
        drInfo.drHash = _drInfo_hash;
        //Dr_ids.push(dr_id) - 1;
    }

    

    function delDr(address _accid) external onlyAdmin(){
        doctor.remove(_accid);
        for(uint i=0; i<Dr_ids.length; i++)
        {
            if(Dr_ids[i]==_accid)
            {
                delete Dr_ids[i];
                real_length--;
            }
        }
    }

    

    function getDrInfo(address _id) public view returns(string memory){
        return (Doctors[_id].drHash);
    }

    function isDr(address id) public view returns(string memory){
        require(doctor.has(id), "Not a Doctor");
        return "Entered ID is of a Doctor";
    }
    
    function getAllDrs() public view returns(address[] memory){
        // uint i = 0;
        // for (i = 0; i <= Dr_ids.length; i++) {
        //     return (Dr_ids[i]);
        // }
        return(Dr_ids);
    }

    function getDoctorCount() public view returns(uint){
        return(real_length);
    }


    /*
            Patient
    
    */


    function isPat(address id) public view onlyDoctor() returns(string memory) {
        require(patient.has(id), "Not a patient");
        return "1";
    }


    function addPatient(address _newpatient) external onlyAdmin() {
        patient.add(_newpatient);
        Patient_ids.push(_newpatient);
        real_lengthP++;
    }

    
    function delPat(address _accid) external onlyAdmin(){
        patient.remove(_accid);
        for(uint i=0; i<Patient_ids.length; i++)
        {
            if(Patient_ids[i]==_accid)
            {
                delete Patient_ids[i];
                real_lengthP--;
            }
        }
        
    }
    
    function getCurrentUser() public view  returns(address){
        return msg.sender;
    }

    
    function getPatInfo(address patient_ID, string memory patient_password)public view returns(string memory) {
        require(doctor.has(msg.sender) || patient.has(msg.sender), "Only Doctor or Patient can access this.");
        require(Patients[patient_ID].password == keccak256(patient_password) , "Wrong Password. Medical Information Inaccessible");
        return (Patients[patient_ID].patHash);
    }


    function addPatInfo(string memory _patInfoHash, string memory _password) public onlyPatient() {
        
        Patient storage patInfo = Patients[msg.sender];
        patInfo.patHash = _patInfoHash;
        patInfo.password = keccak256(_password);
    }

    function changePatientPassword(string memory _newPassword) onlyPatient() public 
    {
        require(patient.has(msg.sender) == true, 'Only patient can change password');
        Patient storage patInfo = Patients[msg.sender];
        patInfo.password = keccak256(_newPassword);
    }


        //Patient_ids.push(msg.sender) - 1;

        //patient.add(pat_id);
    

    /*
    
        Medical Records
    
    
    */

    function addPrescription(string memory _recHash, address _pat_id) public{
        require(doctor.has(msg.sender) == true, 'Only Doctor Can Do That');

        MedRec storage record = Records[_pat_id];
        record.RecordHash = _recHash;
        //RecordHashes.push(_recHash) - 1;
    }

    function viewPrescription(address _patientID)public view returns(string memory){
        require(doctor.has(msg.sender) == true || patient.has(msg.sender), "Only Doctor or patient");
        return (Records[_patientID].RecordHash);
    }



    /*
        Modifiers
    */


    modifier onlyAdmin(){
        require(admin.has(msg.sender) == true, 'Only Admin Can Do That');
        _;
    }
    modifier onlyDoctor(){
        require(doctor.has(msg.sender) == true, 'Only Doctor Can Do That');
        _;
    }
    modifier onlyPatient(){
        require(patient.has(msg.sender) == true, 'Only Patient Can Do That');
        _;
    }

}

/* ------------------------------------------------CONTRACT COMPLETE---------------------------------------------------*/

/*

    function hashing(string memory _name) public view returns (bytes32 result)
    {
        return keccak256(_name);
    }

*/


/*
    function get_drtid() public view returns(address){
        return get_dr_id;
    }*/

    /*
    function search(address _id)public{
        get_dr_id = _id;
    }*/

    /*
    function getDrInfo() public view returns(string memory){
        return (Doctors[get_dr_id].drHash);
    }*/


/*
    function viewPatRec(address _patid) public{
        get_patient_id = _patid;
    }*/

/*
    function get_patid() public view returns(address){
        return get_patient_id;
    }*/


/*
    function addRec(address _patid) external onlyDoctor() {
        require(patient.has(_patid) == true, "Entered address is not of a Patient");
        get_patient_id = _patid;
    }
*/
