pragma solidity ^0.4.0;

contract Vote {
    
    uint ID = 0;
    mapping(uint => string) names;
    mapping(uint => uint) votes;
    
    
    function createCandidate(string name) public returns (uint){
        ID += 1; // Increase ID 
        names[ID]=name; //Assign name to ID
        
    }
    
    function getCadidateName(uint id) view public returns (string){
        require(id <= ID);
        return names[id];
    }
    
    function voteForCandidate(uint id)  public returns(uint){
        require(id <= ID);
        votes[id] +=1;
        return votes[id];
    }
    
    function getVoteNumber(uint id) view public returns(uint){
        require(id <= ID);
        return votes[id];
    }
    
    function getWinner() view public returns(uint){
        uint totalvote=0;
        uint index=1;
        for(uint i=1; i<=ID; i++){
            if (votes[i] > totalvote) {
                totalvote = votes[i];
                index = i;
            }
        }
        
        return index;
        
    }

    
}
