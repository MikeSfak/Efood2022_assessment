##Den eimai sigouros, ekana mia apopeira me poly psaximo kai peiramata,pou fernei apotelesmata me alla den 3erw an einai ta swsta
SELECT city,
  SUM(user_order_count) / total_city_orders * 100 AS percentage_of_orders
FROM
  (SELECT city, user_id,
      COUNT(order_id) AS user_order_count,
      SUM(COUNT(order_id)) OVER (PARTITION BY city) AS total_city_orders,
      ROW_NUMBER() OVER (PARTITION BY city ORDER BY COUNT(order_id) DESC) AS user_rank
    FROM `efood2022-391017.main_assessment.orders`
    GROUP BY
      city, user_id) AS subquery
WHERE user_rank <= 10
GROUP BY city, total_city_orders;
