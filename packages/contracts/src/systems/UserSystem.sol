// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
import { console } from "forge-std/console.sol";
import { System } from "@latticexyz/world/src/System.sol";

import { UserTable } from "../codegen/Tables.sol";

contract UserSystem is System {
  struct Member {
    string name;
    string email;
  }

  // function createUser(string memory name, string memory email, string memory password, string memory role) public {
  //   Member memory member = Member(name, email);
  //   bytes32 key = keccak256(abi.encodePacked(email));
  //   require(bytes(UserTable.get(key).email).length > 0, "User already exists");
  //   UserTable.call{ value: member }("set(string,string)");
  // }

  function createUser(string memory name, string memory email) public {
    bytes32 key = keccak256(abi.encodePacked(email));
    require(bytes(UserTable.get(key).email).length == 0, "User already exists");

    // bytes memory data = UserTable.encode(name, email);

    // UserTable.set(bytes32(abi.encodePacked(bytes16(""), bytes16("UserTable"))), [key], data);
    UserTable.set(key, name, email);
  }

  // function updateUser(string memory email, string memory newRole) public {
  //   bytes32 key = keccak256(abi.encodePacked(email));
  //   require(bytes(UserTable.get(key).email).length > 0, "User does not exist");
  //   UserTable.updateEmail(key, _index, _slice);
  // }

  function deleteUser(string memory email) public {
    bytes32 key = keccak256(abi.encodePacked(email));
    require(bytes(UserTable.get(key).email).length == 0, "User does not exist");
    UserTable.deleteRecord(key);
  }
}
