// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Varenya_token is ERC20 {
    address public owner;

    constructor() ERC20("Varenyatoken","VT"){
        owner=msg.sender;
        _mint(address(this),100);

    }
    modifier onlyOwner(){
        require(msg.sender== owner,"only owner can access");
        _;
    }
    function mint(address to, uint256 value)public onlyOwner{
        _mint(to,value);

    }
    function burn(uint256 value) public{
        _burn(msg.sender,value);
    }
    function transferFrom(address from, address to, uint256 amount)public override returns(bool){
        _transfer(from,to,amount);
        _approve(from,to,amount);

        return true;

    }

}