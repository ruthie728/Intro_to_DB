-- ==========================================================
-- A Magical Database for Your Dream Online Bookstore Adventure
-- Database Name: alx_book_store
-- Author: Ruth Atieno
-- Description: SQL schema for an online bookstore system
-- ==========================================================

-- Create the database
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the database
USE alx_book_store;

-- ==========================================================
-- TABLE: AUTHORS
-- Stores information about authors
-- ==========================================================
CREATE TABLE IF NOT EXISTS AUTHORS (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(215) NOT NULL
);

-- ==========================================================
-- TABLE: BOOKS
-- Stores information about books available in the bookstore
-- ==========================================================
CREATE TABLE IF NOT EXISTS BOOKS (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
);

-- ==========================================================
-- TABLE: CUSTOMERS
-- Stores information about customers
-- ==========================================================
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE,
    address TEXT
);

-- ==========================================================
-- TABLE: ORDERS
-- Stores information about orders placed by customers
-- ==========================================================
CREATE TABLE IF NOT EXISTS ORDERS (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

-- ==========================================================
-- TABLE: ORDER_DETAILS
-- Stores information about the books included in each order
-- ==========================================================
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
    orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
);