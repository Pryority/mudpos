// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
import { console } from "forge-std/console.sol";
import { System } from "@latticexyz/world/src/System.sol";

import { ItemTable } from "../codegen/Tables.sol";

bytes32 constant SingletonKey = bytes32(uint256(0x070D));

// bytes32 key = SingletonKey;

contract InventorySystem is System {
  // Add a new item to the inventory
  function addItem(
    uint256 itemId,
    string memory name,
    uint256 price,
    uint256 salePrice,
    uint256 quantity,
    string memory location
  ) public {
    bytes32 key = keccak256(abi.encodePacked(itemId, location));
    require(bytes(ItemTable.get(key).name).length == 0, "Item already exists");
    ItemTable.set(key, name, price, salePrice, quantity);
  }

  // Update an existing item's name
  function updateItemName(uint256 itemId, string memory name, string memory location) public {
    bytes32 key = keccak256(abi.encodePacked(itemId, location));
    require(bytes(ItemTable.get(key).name).length > 0, "Item does not exist");
    ItemTable.set(key, name, ItemTable.get(key).price, ItemTable.get(key).salePrice, ItemTable.get(key).quantity);
  }

  // Update an existing item's price
  function updateItemPrice(uint256 itemId, uint256 price, string memory location) public {
    bytes32 key = keccak256(abi.encodePacked(itemId, location));
    require(bytes(ItemTable.get(key).name).length > 0, "Item does not exist");
    ItemTable.set(key, ItemTable.get(key).name, price, ItemTable.get(key).salePrice, ItemTable.get(key).quantity);
  }

  // Update an existing item's sale price
  function updateItemSalePrice(uint256 itemId, uint256 salePrice, string memory location) public {
    bytes32 key = keccak256(abi.encodePacked(itemId, location));
    require(bytes(ItemTable.get(key).name).length > 0, "Item does not exist");
    ItemTable.set(key, ItemTable.get(key).name, ItemTable.get(key).price, salePrice, ItemTable.get(key).quantity);
  }

  // Update an existing item's quantity
  function updateItemQuantity(uint256 itemId, uint256 quantity, string memory location) public {
    bytes32 key = keccak256(abi.encodePacked(itemId, location));
    require(bytes(ItemTable.get(key).name).length > 0, "Item does not exist");
    ItemTable.set(key, ItemTable.get(key).name, ItemTable.get(key).price, ItemTable.get(key).salePrice, quantity);
  }

  // Remove an item from the inventory
  function removeItem(uint256 itemId, string memory location) public {
    bytes32 key = keccak256(abi.encodePacked(itemId, location));
    require(bytes(ItemTable.get(key).name).length > 0, "Item does not exist");
    ItemTable.deleteRecord(key);
  }
}
