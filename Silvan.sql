/* Silvan Database, af Daniel ZBC Ringsted */

/* INVOICE TABLE */
CREATE DATABASE SilvanDB;
USE SilvanDB;
CREATE TABLE INVOICE
	(
	InvNo INTEGER, 
    InvDate DATE,
    CustNo INTEGER,
	PRIMARY KEY (InvNo),
	);

	/* INVITEM TABLE */

 CREATE TABLE INVITEM
	(
	InvNo INTEGER,
	ItemNo INTEGER,
	Qty INTEGER,
	FOREIGN KEY (InvNo) REFERENCES INVOICE (InvNo),
	FOREIGN KEY (ItemNo) REFERENCES ITEM (ItemNo),
	);
	
	/* CUSTOMER TABLE */

CREATE TABLE CUSTOMER
	(
	CustNo INTEGER,
	CustName TEXT,
	State TEXT,
	Phone TEXT,
	PRIMARY KEY (CustNo),
	);

	/* ITEM TABLE */
	
 CREATE TABLE ITEM(
	ItemNo INTEGER,
	ItemName TEXT,
	ItemPrice MONEY,
	QtyOnHand INTEGER
	PRIMARY KEY (ItemNo),
	);
	

	/* Insert Values to INVOICE */

INSERT INTO INVOICE(InvNo, InvDate, CustNo)
VALUES (1001, '2000-09-05', 212);	
INSERT INTO INVOICE(InvNo, InvDate, CustNo)
VALUES (1002, '2000-09-17', 225);	  
INSERT INTO INVOICE(InvNo, InvDate, CustNo)
VALUES (1003, '2000-09-17', 239);	 
INSERT INTO INVOICE(InvNo, InvDate, CustNo)
VALUES (1004, '2000-09-18', 211);	
INSERT INTO INVOICE (InvNo,InvDate, CustNo)
VALUES (1005, '2000-09-21', 212);

	/* Insert Values to INVITEM */

INSERT INTO INVITEM(InvNo, ItemNo, Qty)
VALUES (1001, 1, 5);
INSERT INTO INVITEM(InvNo, ItemNo, Qty)
VALUES (1001, 3, 5);			
INSERT INTO INVITEM(InvNo, ItemNo, Qty)
VALUES (1001, 5, 9);			
INSERT INTO INVITEM(InvNo, ItemNo, Qty)
VALUES (1002, 1, 2);			 
INSERT INTO INVITEM(InvNo, ItemNo, Qty)
VALUES (1002, 2, 3);			 
INSERT INTO INVITEM(InvNo, ItemNo, Qty)
VALUES (1003, 1, 7);			 
INSERT INTO INVITEM(InvNo, ItemNo, Qty)
VALUES (1003, 2, 1);			 
INSERT INTO INVITEM(InvNo, ItemNo, Qty)
VALUES (1004, 4, 5);			
INSERT INTO INVITEM(InvNo, ItemNo, Qty)
VALUES (1005, 4, 10);

	/* Insert Values to CUSTOMER */

INSERT INTO CUSTOMER(CustNo, CustName, State, Phone)
VALUES (211, 'Garcia', 'NJ', '732-555-1000');
INSERT INTO CUSTOMER(CustNo, CustName, State, Phone)
VALUES (212, 'Parikh', 'NY', '212-555-2000');
INSERT INTO CUSTOMER(CustNo, CustName, State, Phone)
VALUES (225, 'Elsenhauer', 'NJ', '973-555-3333');
INSERT INTO CUSTOMER(CustNo, CustName, State, Phone)
VALUES (239, 'Bayer', 'FL', '407-555-7777');
	/* Insert Values to ITEM */

INSERT INTO ITEM(ItemNo, ItemName, ItemPrice, QtyOnHand)
VALUES (1, 'Screw', 2.25, 50);
INSERT INTO ITEM(ItemNo, ItemName, ItemPrice, QtyOnHand)
VALUES (2, 'Nut', 5.00, 110);
INSERT INTO ITEM(ItemNo, ItemName, ItemPrice, QtyOnHand)
VALUES (3, 'Bolt', 3.99, 75);
INSERT INTO ITEM(ItemNo, ItemName, ItemPrice, QtyOnHand)
VALUES (4, 'Hammer', 9.99, 125);
INSERT INTO ITEM(ItemNo, ItemName, ItemPrice, QtyOnHand)
VALUES (5, 'Washer', 1.99, 100);
INSERT INTO ITEM(ItemNo, ItemName, ItemPrice, QtyOnHand)
VALUES (6, 'Nail', 0.99, 300);

   /* TESTING TING
DELETE FROM CUSTOMER;
DELETE FROM INVITEM;
DELETE FROM INVOICE;
DELETE FROM ITEM;
SELECT * FROM CUSTOMER;
SELECT * FROM INVITEM;
SELECT * FROM INVOICE;
SELECT * FROM ITEM;
   TESTING TING */


/* Opgave 1. 
Displays the customer information */
SELECT * FROM CUSTOMER
;

/* Opgave 2. 
Displays all item names and their unit price */
SELECT ItemName, ItemPrice 
FROM ITEM
;

/* Opgave 3.
Displays invoice numbers from the invitem table */
SELECT INVITEM.InvNo FROM INVITEM
;

/* Opgave 4.
Display item information, with appropriate coloumn aliasses */
SELECT ItemNo AS 'Item Number', ItemName AS 'Name Of Item', ItemPrice AS 'Unit Price' 
FROM ITEM
;

/* Opgave 5. 
Displaying item and price using concatenation*/
SELECT CONCAT(ITEM.ItemName, ': ', item.ItemPrice, '$') AS 'Item Price'
FROM ITEM
;

/* Opgave 6.
Total value of each item */
SELECT ItemName, ItemPrice* QtyOnHand AS 'Total Value'
FROM ITEM
;

/* Opgave 7.
shows the information about customers from Florida*/
SELECT CustNo, CustName, State, Phone
FROM CUSTOMER
WHERE state like 'FL'
;

/* Opgave 8.
Displays items with an unit price at 5 or greater*/
SELECT item.ItemName, ITEM.ItemPrice
FROM ITEM
WHERE ItemPrice >= 5
;

/* Opgave 9.
shows the items between $2 and $57*/
SELECT ITEM.ItemName, ITEM.ItemPrice, ITEM.QtyOnHand
FROM ITEM
WHERE ItemPrice >= 2 AND ITEM.ItemPrice <= 57
;

/* Opgave 10.
Displays the customers from the tristate area of NJ, NY or CT*/
SELECT *
FROM CUSTOMER
WHERE state like 'NJ' OR state like 'NY' OR state like 'CT'
;

/* Opgave 11.
Finds customers with the letter E as their starting letter*/
SELECT *
FROM CUSTOMER
WHERE customer.CustName like 'E%'
;

/* Opgave 12.
Finds items with the letter E in their name*/
SELECT *
FROM ITEM
WHERE ITEM.ItemName like '%E%'
;
/* Opgave 13.
Orders customers alphabetically*/
SELECT * FROM CUSTOMER
ORDER BY CAST(CustName AS varchar)
;

/* Opgave 14.
Orders items by descending price*/
SELECT * FROM ITEM
ORDER BY ItemPrice desc
;

/* Opgave 15.
Sorting customers by name and state*/
SELECT * FROM CUSTOMER
ORDER BY CAST(state AS varchar), CAST(CustName as varchar)
;

/* Opgave 16.
Displaying customers from new jersey alphabetically*/
SELECT * FROM CUSTOMER
WHERE state like 'NJ'
ORDER BY CAST(CustName AS varchar)
;

/* Opgave 17.
Rounding item price to nearest whole number*/
SELECT ItemName, ROUND(ItemPrice, 0) AS 'ItemPrice Round'
FROM ITEM

/* Opgave 18.
Adds 2 months for the invoice date*/
SELECT INVOICE.InvNo, INVOICE.CustNo, INVOICE.InvDate,
DATEADD(month, 2, InvDate ) AS Payment_Due
FROM INVOICE
;
/* Opgave 19.
Gets the month from the date, does not really work*/
SELECT InvNo, InvDate, FORMAT (InvDate,'YYYY-MM-DD') AS 'Per Date' FROM INVOICE;

/* Opgave 20.
Gets the avarage, min, max and the sum of the item price*/
SELECT SUM(ItemPrice) AS 'Sum Price', AVG(ItemPrice) AS 'Avarage Price', MAX(itemPrice) AS 'Max Price', MIN(ItemPrice) AS 'Min Price'
FROM ITEM

/* Opgave 21.
Different items available for the customers*/
SELECT Count(*) AS 'Dfferent Items' 
FROM ITEM
;
/* Opgave 22.
Number of items ordered in each invoice*/
SELECT INVITEM.InvNo, Count(*) AS 'Items Ordered'
FROM INVITEM
GROUP BY INVITEM.InvNo
;
/* Opgave 23.
Gets invoice with over 3 items ordered*/
SELECT INVITEM.InvNo, Count(*) AS 'Items Ordered' 
FROM INVITEM
GROUP BY INVITEM.InvNo
HAVING COUNT(*) >= 3
;
/* Opgave 24.
Displaying all possible combinations from customers and item*/
SELECT CustNo, CustName, state, phone, ItemNo , ItemName, ItemPrice, QtyOnHand
FROM CUSTOMER, ITEM
;

/* Opgave 25.
Displays item qty and prices for invoice */
SELECT INVITEM.InvNo, INVITEM.Qty, item.ItemPrice
FROM INVITEM
LEFT JOIN ITEM ON ITEM.ItemNo = INVITEM.ItemNo
;

/* Opgave 26.
Total price for each invoice*/
SELECT InvNo, SUM(Qty * ITEM.ItemPrice) AS 'Total Amount'
FROM INVITEM
LEFT JOIN ITEM ON ITEM.ItemNo = INVITEM.ItemNo
GROUP BY InvNo
;

/* Opgave 27.
Displays items ordered and aswell with items not ordered*/
SELECT item.ItemNo, INVOICE.InvNo
FROM ITEM
RIGHT JOIN INVOICE ON INVOICE.InvNo = INVOICE.InvNo
ORDER BY item.ItemNo

/* Opgave 28
Displays, invoices, customer names, and items together, with the use of multiple joins*/
SELECT INVITEM.InvNo, CUSTOMER.CustName, ITEM.ItemName , INVITEM.Qty
FROM INVITEM
   FULL JOIN
   CUSTOMER
   ON INVITEM.InvNo = CUSTOMER.CustNo
   FULL JOIN
   ITEM
   ON INVITEM.Qty = ITEM.ItemNo
;

/* Opgave 29
*/

