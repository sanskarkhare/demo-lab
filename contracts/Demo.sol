// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Demo {
  address payable public owner;
  constructor(){
    owner=payable(msg.sender);
  }


  // function withdraw(uint _amount) external {
  //   require(msg.sender==owner);
  //   payable(msg.sender).transfer(_amount);
  // }

  function balanceOf() external view returns (uint){
    return address(owner).balance;
  }
  
    function send(address payable _addr) payable public {
        require(msg.value >= 1 ether);
        _addr.transfer(msg.value);
    }
}
