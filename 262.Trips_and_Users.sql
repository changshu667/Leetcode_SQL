SELECT a.Request_at AS Day,
    ROUND(SUM(CASE WHEN a.Status LIKE 'cancelled%' THEN 1 ELSE 0 END) / COUNT(*), 2) AS 'Cancellation Rate'
FROM Trips a 
INNER JOIN Users b ON a.Client_Id = b.Users_Id 
INNER JOIN Users c ON a.Driver_Id = c.Users_Id
WHERE a.Request_at BETWEEN '2013-10-01' AND '2013-10-03'
    AND b.Banned = 'No'
    AND c.Banned = 'No'
GROUP BY Day
ORDER BY Day