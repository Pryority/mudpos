// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("ItemTable")));
bytes32 constant ItemTableTableId = _tableId;

struct ItemTableData {
  string name;
  uint256 price;
  uint256 salePrice;
  uint256 quantity;
}

library ItemTable {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](4);
    _schema[0] = SchemaType.STRING;
    _schema[1] = SchemaType.UINT256;
    _schema[2] = SchemaType.UINT256;
    _schema[3] = SchemaType.UINT256;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](4);
    _fieldNames[0] = "name";
    _fieldNames[1] = "price";
    _fieldNames[2] = "salePrice";
    _fieldNames[3] = "quantity";
    return ("ItemTable", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Register the table's schema (using the specified store) */
  function registerSchema(IStore _store) internal {
    _store.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Set the table's metadata (using the specified store) */
  function setMetadata(IStore _store) internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    _store.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get name */
  function getName(bytes32 key) internal view returns (string memory name) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _primaryKeys, 0);
    return (string(_blob));
  }

  /** Get name (using the specified store) */
  function getName(IStore _store, bytes32 key) internal view returns (string memory name) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _primaryKeys, 0);
    return (string(_blob));
  }

  /** Set name */
  function setName(bytes32 key, string memory name) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _primaryKeys, 0, bytes((name)));
  }

  /** Set name (using the specified store) */
  function setName(IStore _store, bytes32 key, string memory name) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.setField(_tableId, _primaryKeys, 0, bytes((name)));
  }

  /** Push a slice to name */
  function pushName(bytes32 key, string memory _slice) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.pushToField(_tableId, _primaryKeys, 0, bytes((_slice)));
  }

  /** Push a slice to name (using the specified store) */
  function pushName(IStore _store, bytes32 key, string memory _slice) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.pushToField(_tableId, _primaryKeys, 0, bytes((_slice)));
  }

  /** Update a slice of name at `_index` */
  function updateName(bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.updateInField(_tableId, _primaryKeys, 0, _index * 1, bytes((_slice)));
  }

  /** Update a slice of name (using the specified store) at `_index` */
  function updateName(IStore _store, bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.updateInField(_tableId, _primaryKeys, 0, _index * 1, bytes((_slice)));
  }

  /** Get price */
  function getPrice(bytes32 key) internal view returns (uint256 price) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _primaryKeys, 1);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Get price (using the specified store) */
  function getPrice(IStore _store, bytes32 key) internal view returns (uint256 price) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _primaryKeys, 1);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Set price */
  function setPrice(bytes32 key, uint256 price) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _primaryKeys, 1, abi.encodePacked((price)));
  }

  /** Set price (using the specified store) */
  function setPrice(IStore _store, bytes32 key, uint256 price) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.setField(_tableId, _primaryKeys, 1, abi.encodePacked((price)));
  }

  /** Get salePrice */
  function getSalePrice(bytes32 key) internal view returns (uint256 salePrice) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _primaryKeys, 2);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Get salePrice (using the specified store) */
  function getSalePrice(IStore _store, bytes32 key) internal view returns (uint256 salePrice) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _primaryKeys, 2);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Set salePrice */
  function setSalePrice(bytes32 key, uint256 salePrice) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _primaryKeys, 2, abi.encodePacked((salePrice)));
  }

  /** Set salePrice (using the specified store) */
  function setSalePrice(IStore _store, bytes32 key, uint256 salePrice) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.setField(_tableId, _primaryKeys, 2, abi.encodePacked((salePrice)));
  }

  /** Get quantity */
  function getQuantity(bytes32 key) internal view returns (uint256 quantity) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _primaryKeys, 3);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Get quantity (using the specified store) */
  function getQuantity(IStore _store, bytes32 key) internal view returns (uint256 quantity) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _primaryKeys, 3);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Set quantity */
  function setQuantity(bytes32 key, uint256 quantity) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _primaryKeys, 3, abi.encodePacked((quantity)));
  }

  /** Set quantity (using the specified store) */
  function setQuantity(IStore _store, bytes32 key, uint256 quantity) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.setField(_tableId, _primaryKeys, 3, abi.encodePacked((quantity)));
  }

  /** Get the full data */
  function get(bytes32 key) internal view returns (ItemTableData memory _table) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _primaryKeys, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 key) internal view returns (ItemTableData memory _table) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = _store.getRecord(_tableId, _primaryKeys, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(bytes32 key, string memory name, uint256 price, uint256 salePrice, uint256 quantity) internal {
    bytes memory _data = encode(name, price, salePrice, quantity);

    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.setRecord(_tableId, _primaryKeys, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(
    IStore _store,
    bytes32 key,
    string memory name,
    uint256 price,
    uint256 salePrice,
    uint256 quantity
  ) internal {
    bytes memory _data = encode(name, price, salePrice, quantity);

    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.setRecord(_tableId, _primaryKeys, _data);
  }

  /** Set the full data using the data struct */
  function set(bytes32 key, ItemTableData memory _table) internal {
    set(key, _table.name, _table.price, _table.salePrice, _table.quantity);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 key, ItemTableData memory _table) internal {
    set(_store, key, _table.name, _table.price, _table.salePrice, _table.quantity);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal view returns (ItemTableData memory _table) {
    // 96 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 96));

    _table.price = (uint256(Bytes.slice32(_blob, 0)));

    _table.salePrice = (uint256(Bytes.slice32(_blob, 32)));

    _table.quantity = (uint256(Bytes.slice32(_blob, 64)));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 96) {
      uint256 _start;
      // skip static data length + dynamic lengths word
      uint256 _end = 128;

      _start = _end;
      _end += _encodedLengths.atIndex(0);
      _table.name = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
    }
  }

  /** Tightly pack full data using this table's schema */
  function encode(
    string memory name,
    uint256 price,
    uint256 salePrice,
    uint256 quantity
  ) internal view returns (bytes memory) {
    uint16[] memory _counters = new uint16[](1);
    _counters[0] = uint16(bytes(name).length);
    PackedCounter _encodedLengths = PackedCounterLib.pack(_counters);

    return abi.encodePacked(price, salePrice, quantity, _encodedLengths.unwrap(), bytes((name)));
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.deleteRecord(_tableId, _primaryKeys);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.deleteRecord(_tableId, _primaryKeys);
  }
}