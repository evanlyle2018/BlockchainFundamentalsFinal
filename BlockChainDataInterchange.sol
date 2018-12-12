ppragma solidity ^0.4.25;

contract BlockchainDataInterchange {
    
    // declare the mapping used to generate the ANSI orders
    mapping(uint256 => string) public ANSImap;
    
	// declare the constructor to populate the ANSI mapping
    constructor() public {
       ANSImap[201] = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?> <EDI> <type>Vehicle Shipping Order</type> </EDI>";
       ANSImap[317] = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?> <EDI> <type>Delivery/Pickup Order</type> </EDI>";
	   ANSImap[850] = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?> <EDI> <type>Purchase Order</type> </EDI>";
    }

	// This function takes the ANSI code and the address of the recipient
	// This function will send the recipient the amount of money sent to 
	// the contract and return the value of the ANSI XML
	// more work is required to build the specific XML's for each ANSI code
    function sendBDI(uint256 ANSIcode, address receiver) public 
        payable returns (string){
		
		// transfer the money
        receiver.transfer(msg.value);
		
		//get the ANSI code
        string storage EDI = ANSImap[ANSIcode];
        return EDI;
    }
}
