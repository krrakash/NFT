// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract NFTContract is ERC1155,Ownable{

    uint256 public constant photo=0;
    //Metadata required below 
    constructor()ERC1155("https://yjeelokokgm4.usemoralis.com/{id}.json"){
        _mint(msg.sender,photo,1,"");
    }
    //Adding Guard Check
    function mint(address to,uint256 id,uint256 amount) public onlyOwner{
        
        _mint(to,id,amount,"");
    }

    function burn(address to,uint256 id,uint256 amount) public {
        require(msg.sender==to);
        _burn(to,id,amount);
    }

}