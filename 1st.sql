##EMFANIZEI MEXRI KAI TO FrequencyBreakfast
SELECT
  city,
  (
    SELECT SUM(amount) / COUNT(DISTINCT order_id)
    FROM `efood2022-391017.main_assessment.orders`
    WHERE cuisine = 'Breakfast' AND city = outer_query.city
  ) AS BasketBreakfast,
  SUM(amount) / COUNT(DISTINCT order_id) AS Basket,
  (
    SELECT COUNT(DISTINCT order_id) / NULLIF(COUNT(DISTINCT user_id), 0)
    FROM `efood2022-391017.main_assessment.orders`
    WHERE cuisine = 'Breakfast' AND city = outer_query.city
  ) AS FrequencyBreakfast,
  COUNT(order_id) / NULLIF(COUNT(DISTINCT user_id), 0) AS Frequency
FROM
  `efood2022-391017.main_assessment.orders` AS outer_query


GROUP BY
  city
ORDER BY
  COUNT(DISTINCT order_id) DESC
LIMIT 5;