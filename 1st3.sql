##Mporesa kai ta dimiourgisa mona tous alla pote na ta kollisw ola mazi me to proigoumeno
#Users>3(simple)
SELECT city,
  (COUNT(CASE WHEN frequency > 3 THEN 1 END) / COUNT(DISTINCT user_id))
   AS percentage_users_exceed_3_orders
FROM
  (SELECT city,
      user_id,
      COUNT(DISTINCT order_id) / COUNT(DISTINCT user_id) AS frequency
    FROM `efood2022-391017.main_assessment.orders`
    GROUP BY city, user_id
  ) AS subquery
GROUP BY city;

#Users>3(breakfast)

SELECT city,
  (COUNT(CASE WHEN frequency > 3 THEN 1 END) / COUNT(DISTINCT user_id))
   AS percentage_users_exceed_3_orders
FROM
  (SELECT city,user_id,
      COUNT(DISTINCT order_id) / COUNT(DISTINCT user_id) AS frequency
    FROM `efood2022-391017.main_assessment.orders`
    WHERE cuisine = 'Breakfast'
    GROUP BY city, user_id) AS subquery