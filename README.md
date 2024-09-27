# TokenErrorHandling Smart Contract

This is a simple Ethereum smart contract implemented in Solidity that demonstrates different error handling mechanisms (`require`, `revert`, and `assert`) while withdrawing tokens. The contract assigns an initial balance of 5000 tokens to the contract deployer and allows users to withdraw tokens, with each function handling potential errors differently.

## Features

- **Initial Token Distribution:** 
  - Upon deployment, the contract assigns 5000 tokens to the deployer's address.
  
- **Withdraw Tokens with Error Handling:**
  - **`withdrawWithRequire(uint amount)`**: Uses `require` to check for sufficient balance before allowing a withdrawal.
  - **`withdrawWithRevert(uint amount)`**: Uses `revert` for error handling, reverting the transaction if there are insufficient tokens.
  - **`withdrawWithAssert(uint amount)`**: Uses `assert` to verify the correctness of the internal logic after deduction.

- **Check Balance:**
  - **`checkBalance()`**: Allows any address to view its token balance.

## Functions

### `withdrawWithRequire(uint amount)`
- **Description**: Withdraws tokens if the caller has sufficient balance, using `require` for error handling.
- **Error Handling**: If the balance is insufficient, the transaction will fail with a `require` statement and an error message.

### `withdrawWithRevert(uint amount)`
- **Description**: Withdraws tokens if the caller has sufficient balance, using `revert` for error handling.
- **Error Handling**: If the balance is insufficient, the transaction is explicitly reverted using a `revert` statement.

### `withdrawWithAssert(uint amount)`
- **Description**: Withdraws tokens and uses `assert` to ensure that the withdrawal logic is correct.
- **Error Handling**: If the balance does not match the expected value after deduction, the contract will fail using `assert`.

### `checkBalance()`
- **Description**: Returns the current balance of the caller.

## Usage

1. **Deploy** the contract to an Ethereum-compatible blockchain (e.g., Ethereum testnet).
2. Once deployed, the deployer will have 5000 tokens assigned to their address.
3. Other addresses will start with a zero balance.
4. Call `withdrawWithRequire`, `withdrawWithRevert`, or `withdrawWithAssert` to withdraw tokens from your balance.
5. Use `checkBalance` to check your current token balance.

## Error Handling Explained

- **`require`**: Checks a condition and reverts the transaction if the condition is false. It's used to validate inputs and ensure that certain conditions are met.
  
- **`revert`**: Similar to `require`, but more flexible and can be used within more complex conditions or functions to explicitly signal failure.
  
- **`assert`**: Used for internal errors and invariants. It should only fail in cases where there's a bug in the contract's logic.

## Example

1. Deploy the contract.
2. Call `checkBalance` to view your token balance.
3. Call `withdrawWithRequire(100)` to withdraw 100 tokens.
4. Check your balance again by calling `checkBalance`.

## Auther
   Ankur
