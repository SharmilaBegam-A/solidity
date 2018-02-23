pragma solidity ^0.4.0;
import "./newtoken.sol";
contract inventrymanage is StandardToken {
    uint256 count=0;
    uint256 z;
    address owner;
    uint256 amount;
    bytes32[] lname;
    uint256[] lid;
    uint256[] lcost;
    uint256[] lavail;
    uint256 c;
    struct items {
        bytes32 pname;
        uint256 pid;
        uint256 pcost;
        uint256 pavail;
    }
    mapping(uint256=>items)details;

    function inventrymanage() public {
        owner=msg.sender;
    }
    
    modifier onlyowner() {
        require(msg.sender==owner);
        _;
    }
    function setdetails(bytes32 name,uint256 id,uint256 cost,uint256 avail) onlyowner public {
        details[id].pname=name;
        details[id].pid=id;
        details[id].pcost=cost;
        details[id].pavail=avail;
        lname.push(name);
        lid.push(id);
        lcost.push(cost);
        lavail.push(avail);
        count=count+1;
    }
    function cnt() public view returns(uint256){
        return count;
    }
    function getdetails() public view returns(bytes32[],uint256[],uint256[],uint256[]) {
        return(lname,lid,lcost,lavail);
    }
    function requestitems(uint256 id,uint256 count) public  {
        for(uint256 i=0;i<lid.length;i++) {
            if(lid[i]==id) {
                z=i;
                lavail[z]=lavail[z]-count;
                amount=lcost[z]*count;
               
               transfer(owner,amount);
               
                
            }
        }
        
    }
    
    function check() public view returns(uint256) {
        return(lname.length);
    }
    function saledout() public view returns(uint256,bytes32,uint256,uint256,uint256) {
        return(lid[z],lname[z],lcost[z],lavail[z],amount);
    }
    
    function tokentransfer() public payable  {
        uint256 amt=msg.value * 100;
        uint256 value=amt / 1 ether;
         //owner.transfer(msg.value);
        balances[msg.sender] += value;
        balances[owner] -= value;
            //return z;
         
    }
        
                
}
