// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MedicalRecords {
    address public owner;
    
    struct Record {
        uint256 id;
        string patientName;
        string diagnosis;
        uint256 timestamp;
    }
    
    Record[] public records;
    
    event RecordAdded(uint256 indexed id, string patientName, string diagnosis, uint256 timestamp);
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this operation");
        _;
    }
    
    constructor() {
        owner = msg.sender;
    }
    
    function addRecord(string memory _patientName, string memory _diagnosis) public onlyOwner {
        uint256 recordId = records.length;
        uint256 timestamp = block.timestamp;
        records.push(Record(recordId, _patientName, _diagnosis, timestamp));
        emit RecordAdded(recordId, _patientName, _diagnosis, timestamp);
    }

    
    function getRecord(uint256 _recordId) public view returns (uint256, string memory, string memory, uint256) {
        require(_recordId < records.length, "Record does not exist");
        Record memory record = records[_recordId];
        return (record.id, record.patientName, record.diagnosis, record.timestamp);
    }
    
    function getRecordsCount() public view returns (uint256) {
        return records.length;
    }
}
