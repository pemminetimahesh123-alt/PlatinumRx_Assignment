SELECT sales_channel, SUM(amount) AS revenue
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY sales_channel;

SELECT uid, SUM(amount) AS total_spent
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;

WITH revenue AS (
    SELECT MONTH(datetime) AS month, SUM(amount) AS revenue
    FROM clinic_sales
    WHERE YEAR(datetime) = 2021
    GROUP BY MONTH(datetime)
),
expense AS (
    SELECT MONTH(datetime) AS month, SUM(amount) AS expense
    FROM expenses
    WHERE YEAR(datetime) = 2021
    GROUP BY MONTH(datetime)
)
SELECT r.month,
       r.revenue,
       e.expense,
       (r.revenue - e.expense) AS profit,
       CASE 
           WHEN (r.revenue - e.expense) > 0 THEN 'Profitable'
           ELSE 'Not Profitable'
       END AS status
FROM revenue r
JOIN expense e ON r.month = e.month;

WITH profit_calc AS (
    SELECT c.city, cs.cid,
           SUM(cs.amount) - COALESCE(SUM(e.amount),0) AS profit,
           RANK() OVER (PARTITION BY c.city ORDER BY (SUM(cs.amount) - COALESCE(SUM(e.amount),0)) DESC) rnk
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    LEFT JOIN expenses e ON cs.cid = e.cid
    GROUP BY c.city, cs.cid
)
SELECT * FROM profit_calc WHERE rnk = 1;

WITH profit_calc AS (
    SELECT c.state, cs.cid,
           SUM(cs.amount) - COALESCE(SUM(e.amount),0) AS profit,
           RANK() OVER (PARTITION BY c.state ORDER BY (SUM(cs.amount) - COALESCE(SUM(e.amount),0)) ASC) rnk
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    LEFT JOIN expenses e ON cs.cid = e.cid
    GROUP BY c.state, cs.cid
)
SELECT * FROM profit_calc WHERE rnk = 2;