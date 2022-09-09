
	--- Having an overlook of the data sorted by year.
Select *
From dbo.amz
Order BY Year, [User Rating] DESC

	-- Checking for nulls
Select *
From dbo.amz
Where Price IS NULL

Select *
From dbo.amz
Where Author IS NULL

Select *
From dbo.amz
Where Name IS NULL

-- Since  every category will have duplicates due to the nature of this list, I will not be checking for that. 

	-- Now, let's find how many books are fiction vs non fiction
Select COUNT (Genre) AS "# of Fiction Books"
From dbo.amz
Where Genre = 'Fiction'

Select COUNT (Genre) AS "# of Non Fiction Books"
From dbo.amz
Where Genre = 'Non Fiction'
-- Observations: Non Fiction books take the lead at 363 books compared to 287 Fiction books.

-- Lets take a look at the cost of these books
-- What are the most expensive books?, What's the average price? Lowest price?

Select *
from dbo.amz
Where Price = 0

Select TOP 5 [Price], [Name], [Author]
From dbo.amz
Order By Price DESC 

Select AVG(Price) AS Average_Price 
From dbo.amz

Select AVG(Price) AS Average_Price_Fiction
From dbo.amz
Where Genre = 'Fiction'

Select AVG(Price) AS Average_Price_NonFiction
From dbo.amz
Where Genre = 'Non Fiction'

-- Observation: There's 12 books in the list that were marked as zero dollars, meaning that the books were free or this is a dataset error. 
-- The most expensive book, the DSM-5, cost $105 and the average price was $12.76. 
-- The average price for Non fiction books was greater than the average price of fiction books. ($14.50 vs $10.56)

	-- Now let's see which authors and title have appeared the most throughout the list. 


Select Top 10 Author
From dbo.amz
Group By Author
Order By Count(Author) DESC

Select COUNT (Author) AS 'Times Jeff Kinney appeared'
From dbo.amz
Where Author = 'Jeff Kinney'

Select Top 1 Name
From dbo.amz
Group By Name
Order By Count(Name) DESC

-- Observations: Jeff Kinney appeared on the list the most, with a total of 14 times. The book to appear the most on the list is "The 5 Love languages"


	-- Ratings
Select Distinct Top 20 Name, [User Rating]  
From dbo.amz
Where [User Rating] >= 4.8
Order BY [User Rating] DESC


Select Distinct Top 20 Name, [User Rating]  
From dbo.amz
Order BY [User Rating] ASC


Select AVG([User Rating]) AS NonFiction_Avg_Rating
From dbo.amz
Where Genre = 'Non Fiction'


Select AVG([User Rating]) AS Fiction_Avg_Rating
From dbo.amz
Where Genre = 'Fiction'

-- Observations: From the list, the lowest rated book was "The Casual Vacancy" at 3.3. As for the highest rated books - 145 titles were rated as 4.9.
-- Both book genres recieve approximatly close ratings (4.6)


-- Conclusion:
--1. Non fiction titles were not only a bigger part of the list, but they also had a higher average price. This means that having a sale on non fiction books more often could be beneficial.
--2. Furthering the "Genre" category into more sub-categories (ex: biography, health, thriller, fantasy) could improve analysis 




