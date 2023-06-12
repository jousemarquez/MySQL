SELECT 
    COUNT(account), account, SUM(doblon), round(SUM(points))
FROM
    doblon
GROUP BY account
ORDER BY SUM(points) DESC
LIMIT 10;