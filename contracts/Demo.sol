// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Demo {
  address payable public owner;

  event transferred(uint256 amount);
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
  
    function send(address payable _addr) payable public returns(uint256){
        require(msg.value >= 1 ether);
        _addr.transfer(msg.value);
        uint256 temp = msg.value;
        emit transferred(temp);
        return temp;
    }
}
