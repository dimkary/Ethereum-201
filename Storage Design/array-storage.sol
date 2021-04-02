pragma solidity 0.8.0;

contract GasTest{

    struct Entity{
        uint data;
        address _address;
    }
    
    // storage array for Entity struct
    
    Entity[] entities;
    
    // "add" functionality
    function addEntity(uint _data) public{
        // since we use array only, we need to iterate all elements to check for duplicates
        for(uint i = 0; i<entities.length; i++){
            require(msg.sender != entities[i]._address, "Address already registered");
        }
        entities.push(Entity({data:_data, _address:msg.sender}));
    }
    
    // "update" functionality
    function updateEntity(uint _data) public {
        // iterate array and if we find sender, we update
        // if the array is iterated and msg.sender is not found, do nothing
        // optionally an event could be logged alerting that the address is not registered (not implemented for gas performance)
        for(uint i = 0; i<entities.length; i++){
            if (entities[i]._address == msg.sender){
                entities[i].data = _data;
                break;
            }
        }        
    }
    
    function entitiesGetter() view external returns (Entity[] memory) {
        return entities;
    }
    
}