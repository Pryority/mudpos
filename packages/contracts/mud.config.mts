import { mudConfig, resolveTableId } from "@latticexyz/config";

/** -- MUD POS -- */

export default mudConfig({
  overrideSystems: {
    /**
    IncrementSystem: {
      name: "increment",
      openAccess: true,
    },
     */
  },
  enums: {
    TenderType: ["CASH", "DEBIT", "CREDIT", "CRYPTO"],
    TransactionType: ["BUY", "REFUND", "VOID", "SUSPEND"],
    PaymentStatus: ["PAID", "PENDING", "PARTIAL"],
    DiscountType: ["PERCENTAGE", "AMOUNT"],
    CustomerType: ["NONE", "MEMBER"],
  },
  tables: {
    ItemTable: {
      schema: {
        name: "string",
        price: "uint256",
        salePrice: "uint256",
        quantity: "uint256",
      },
    },
    InventoryTable: {
      schema: {
        item_id: "uint256",
        quantity: "uint256",
        location: "string",
      },
    },
    UserTable: {
      schema: {
        name: "string",
        email: "string",
      },
    },
  },
  modules: [
    {
      name: "KeysWithValueModule",
      root: true,
      args: [resolveTableId("ItemTable")],
    },
  ],
});
