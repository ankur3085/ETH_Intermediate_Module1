// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract SimpleLibrarySystem {

    struct Book {
        string title;
        uint copiesAvailable;
    }

    mapping(uint => Book) public books;
    mapping(address => mapping(uint => uint)) public borrowedBooks;

    // Function to add a new book (with `require` error handling)
    function addBook(uint bookId, string memory title, uint copies) public {
        require(bytes(title).length > 2, "Book title cannot be short");
        books[bookId] = Book(title, copies);
    }

    // Function to borrow a book (with `revert` error handling)
    function borrowBook(uint bookId, uint quantity) public {
        if (books[bookId].copiesAvailable < quantity) {
            revert("Not enough copies available to borrow");
        }
        books[bookId].copiesAvailable -= quantity;
        borrowedBooks[msg.sender][bookId] += quantity;
    }

    // Function to return a book (with `assert` error handling)
    function returnBook(uint bookId, uint quantity) public {
        uint initialBorrowed = borrowedBooks[msg.sender][bookId];
        borrowedBooks[msg.sender][bookId] -= quantity;
        books[bookId].copiesAvailable += quantity;
        
        // Ensure the correct number of books were returned
        assert(borrowedBooks[msg.sender][bookId] == initialBorrowed - quantity);
    }
}
