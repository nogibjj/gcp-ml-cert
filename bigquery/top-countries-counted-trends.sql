SELECT
  REPLACE(UPPER(term), ' ', '_') AS term,
  MAX(refresh_date) AS top_date,
  country_name,
  COUNT(*) AS occurrences
FROM
  `bigquery-public-data.google_trends.international_top_rising_terms`
WHERE
  refresh_date BETWEEN "2023-04-01"
  AND "2023-04-17"
GROUP BY
  term, country_name
ORDER BY
  top_date DESC,
  occurrences DESC
LIMIT
  50

