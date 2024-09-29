# Library System

This is a basic decentralized library system built using Solidity. The smart contract enables users to add books, borrow them, and return them while ensuring proper error handling through Solidity's `require`, `revert`, and `assert` statements.

## Features

- **Add Book**: Admin can add a new book with a title and a specified number of copies available.
- **Borrow Book**: Users can borrow a specific quantity of available books.
- **Return Book**: Users can return the books they borrowed, with an assertion to ensure the correct number of books is returned.

## Functions

### 1. `addBook`

Adds a new book to the system.

```solidity
function addBook(uint bookId, string memory title, uint copies) public
```

**Parameters:**
- `bookId`: The unique ID of the book.
- `title`: The title of the book (must be at least 3 characters long).
- `copies`: The number of copies available in the library.

**Error Handling:**
- `require`: Ensures the book title is at least 3 characters long.

### 2. `borrowBook`

Allows a user to borrow a specified quantity of a book.

```solidity
function borrowBook(uint bookId, uint quantity) public
```

**Parameters:**
- `bookId`: The unique ID of the book.
- `quantity`: The number of copies to borrow.

**Error Handling:**
- `revert`: Reverts the transaction if the requested quantity exceeds the available copies.

### 3. `returnBook`

Allows a user to return a borrowed book.

```solidity
function returnBook(uint bookId, uint quantity) public
```

**Parameters:**
- `bookId`: The unique ID of the book.
- `quantity`: The number of copies to return.

**Error Handling:**
- `assert`: Ensures that the correct number of books are returned by asserting the post-condition.

## Error Handling

The contract demonstrates the use of Solidity's built-in error handling:

1. **`require`**: Validates conditions for adding a book (e.g., book title length).
2. **`revert`**: Rolls back the transaction if a user tries to borrow more books than available.
3. **`assert`**: Asserts the post-condition to ensure that the correct number of books are returned.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
