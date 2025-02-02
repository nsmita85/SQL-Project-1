use smitadb;

select * from dbo.Books;

select * from dbo.customers;

--drop table orders;

select * from Orders;

-- 1) Retrieve all books in the "Fiction" genre:

select * from Books;

select *
from Books
where Genre ='Fiction';

-- 2) Find books published after the year 1950:

select * from Books;

select *
from Books
where Published_Year>1950;

-- 3) List all customers from the Canada:

select * from Customers;

select *
from Customers
where Country='Canada';

-- 4) Show orders placed in November 2023:

select * from Orders;

select *
from Orders
where Order_Date between '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:

select * from Books;

select sum(Stock) as Total_Stock_Available
from Books;

-- 6) Find the details of the most expensive book:

select * from Books;

select Top 1 Book_ID, Title, Author, Genre, Published_Year, Price
from Books
order by Price DESC;

-- 7) Show all customers who ordered more than 1 quantity of a book:

select * from Orders;

select *
from Orders
where Quantity>1

-- 8) Retrieve all orders where the total amount exceeds $20:

select * from Orders;

select *
from Orders
where Total_Amount>$20

-- 9) List all genres available in the Books table:

select * from Books;

select Distinct(Genre)
from Books;

-- 10) Find the book with the lowest stock:

select * from Books;

select Top 1 * 
from Books
order by Stock;

-- 11) Calculate the total revenue generated from all orders:

select * from Orders;

select sum(Total_Amount) as Total_Revenue
from Orders;

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:

select * from Books; select * from Orders;

select B.Genre, sum(O.Quantity) as Total_Books_Sold
from Books B
join Orders O
on B.Book_ID=O.Book_ID
group by B.Genre;

-- 2) Find the average price of books in the "Fantasy" genre:

select * from Books;

select AVG(Price) as Avg_Fantasy_Genre
from Books
where Genre='Fantasy';

-- 3) List customers who have placed at least 2 orders:

select * from Customers; select * from Orders;

select O.Customer_ID, Count(O.Order_ID) as Order_Placed, C.Name
from Orders O
join Customers C
on O.Customer_ID= C.Customer_ID
Group By O.Customer_ID, C.Name
Having count(Order_ID)>=2;

--OR

select * from Orders;

select Customer_ID, Count(Order_ID) as Order_Placed
from Orders 
Group By Customer_ID
Having count(Order_ID)>=2;


-- 4) Find the most frequently ordered book:

select * from Orders; select * from Books;

select Top 1 O.Book_ID,B.Title, count(O.Order_ID)  as frequent_Ordered_Book
from Orders O
join Books B
on O.Book_ID=B.Book_ID
group by O.Book_ID, B.Title
order by frequent_Ordered_Book DESC;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

select * from Books;

select Top 3 *
from Books
where Genre='Fantasy'
order by Price DESC;

-- 6) Retrieve the total quantity of books sold by each author:

select * from Books; select * from Orders;

select  B.Author ,sum(O.Quantity) as Total_Quantity_Books_Sold
from Orders O
join Books B
on O.Book_ID=B.Book_ID
Group By B.Author;

-- 7) List the cities where customers who spent over $30 are located:

select * from Customers; select * from Orders;

select Distinct C.City, O.Total_Amount
from Customers C
join Orders O
on C.Customer_ID= O.Customer_ID
where O.Total_Amount> $30

-- 8) Find the customer who spent the most on orders:

select * from Customers; select * from Orders;

select Top 1 C.Customer_ID, C.Name, Sum(O.Total_Amount) as Total_spent
from Customers C
join Orders O
on C.Customer_ID=O.Customer_ID
group by  C.Customer_ID, C.Name
order by Total_spent DESC;


