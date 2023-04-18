SELECT
  term,
  MAX(refresh_date) AS top_date
FROM
  `bigquery-public-data.google_trends.international_top_rising_terms`
WHERE
  refresh_date BETWEEN "2023-04-01"
  AND "2023-04-17"
GROUP BY
  term
ORDER BY
  top_date DESC
LIMIT
  100