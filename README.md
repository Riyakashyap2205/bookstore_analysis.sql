bookstore_analysis.sql

📚 SQL Bookstore Analysis Project

🔍 Objective
A SQL project analyzing an online bookstore dataset to uncover insights on sales performance, customer behavior, and inventory trends using joins, aggregations, and business-driven queries.

🛠 Tools Used
- SQL (PostgreSQL)
- Joins, Aggregations, Subqueries

🗂 Database Schema
- Books
- Customers
- Orders

📊 Key Business Questions Solved
- What is the total revenue generated?
- Which book is most frequently ordered?
- Who is the highest-spending customer?
- What is the remaining stock after fulfilling orders?
- Which genres generate the most sales?


💡 Key Insights
- Certain genres contribute significantly to overall sales volume.
- A small group of customers generates a large portion of total revenue.
- Inventory imbalances exist, with some books running low on stock.
- Customer spending patterns vary across locations.

🚀 Skills Demonstrated
- Data modeling
- SQL joins (INNER JOIN)
- Aggregations (SUM, AVG, COUNT)
- Subqueries
- Business problem solving

🧠 Sample Query
    SELECT 
        b.title,
        SUM(o.quantity) AS total_sold
    FROM books b
    JOIN orders o ON b.book_id = o.book_id
    GROUP BY b.title
    ORDER BY total_sold DESC
    LIMIT 1;
    
💡 Key Findings
- 📈 Total revenue generated from all orders shows strong sales performance, indicating consistent customer demand.

- 🏆 The most frequently ordered book (Realigned multi-tasking installation)  contributes significantly to total sales, suggesting high customer preference for specific titles.

- 👤 A small number of customers account for the highest spending, highlighting the importance of high-value customers.

- 📚 Certain genres have higher total sales, showing clear customer interest patterns across categories.

- 📦 Some books have very low remaining stock after fulfilling orders, indicating potential inventory shortages.

- 🌍 Customers who spend more than $30 are concentrated in specific cities, useful for targeted marketing.

- 💰 Higher-priced books do not always generate the most sales, suggesting price sensitivity among customers.

- 📊 Books with higher quantities ordered contribute more to revenue than one-time purchases.

🧾  Conclusion
The analysis reveals that customer purchasing behavior is driven by popular genres and repeat buyers. Inventory management should focus on high-demand books, while marketing strategies can target high-spending customers and key locations to maximize revenue.

















