pragma solidity ^0.6.2;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./IExerciceSolution.sol";

contract ExerciceSolution is ERC20, IExerciceSolution
{

  mapping(address=>bool) MapIsWL; 
  mapping(address=>uint) MapTier; 
  

    constructor() public ERC20("HugoS", "jdgpE") {
        // uint _supply = 853175455000000000000000000;  
        //_mint(msg.sender, _supply);
   
        MapIsWL[0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5] = true;
        MapTier[0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5] = 2;
        

    }

  function symbol() public view override(ERC20, IExerciceSolution) returns (string memory){
    return "jdgpE";
  }
    
  function getToken() external override returns (bool){
    
    if (MapIsWL[msg.sender]==true) {
      _mint(msg.sender,11);
       return true;
    }
    else{
      return false;
    }
  }

  function buyToken() external payable override returns (bool){
    if (MapIsWL[msg.sender]==true && MapTier[msg.sender]!=0) {
      _mint(0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5,msg.value*10*MapTier[msg.sender]);
       return true;
    }
    else{
      return false;
    }
    
  }

  function isCustomerWhiteListed(address customerAddress) external override returns (bool){
    if (MapIsWL[customerAddress]==true){
      return true;
    }
    else {
      return false;
    }
  }

  function customerTierLevel(address customerAddress) external override returns (uint256){
    return MapTier[customerAddress];
  }

}