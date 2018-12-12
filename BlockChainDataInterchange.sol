pragma solidity ^0.4.25;

contract BlockchainDataInterchange {
    
    // declare the mapping used to generate the ANSI orders
    mapping(uint256 => string) public ANSImap;
    
    constructor() public {
       ANSImap[201] = "Vehicle Shipping Order";
       ANSImap[317] = "Delivery/Pickup Order";
    }

    function sendBDI(uint256 ANSIcode, address receiver) public 
        payable returns (string){
        receiver.transfer(msg.value);
        string storage EDI = ANSImap[ANSIcode];
        return EDI;
    }
}