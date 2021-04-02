pragma solidity 0.8.0;

contract GasTest{

    struct Entity{
        uint data;
        address _address;
    }
    
    // storage array for Entity struct
    
    mapping (address => Entity) entities;
    
    // "add" functionality
    function addEntity(uint _data) public{
        // trick: uninitialized addresses in structs alwayss points to the 0th address
        require(entities[msg.sender]._address == 0x0000000000000000000000000000000000000000, "Already registered");
        entities[msg.sender] = Entity({data:_data, _address:msg.sender});
    }
    
    // "update" functionality
    function updateEntity(uint _data) public {
        require(entities[msg.sender]._address == msg.sender, "Not found in registry");
        
        entities[msg.sender].data = _data;
    
    }
    
    function getEntity() public view returns (address){
        return entities[msg.sender]._address;
    }
    
}