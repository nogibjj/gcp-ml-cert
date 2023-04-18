SELECT
  views,
  title
FROM
  `bigquery-public-data.wikipedia.pageviews_2023`
WHERE
  DATE(datehour) = "2023-04-18"
  AND NOT (title LIKE "Main_Page"
    OR title LIKE "Special:%"
    OR title LIKE "Wikipedia:%"
    OR title LIKE "Wikidata:%"
    OR title LIKE "Cookie_(informatique)"
    OR title LIKE "Wikipédia:Accueil_principal"
    OR title LIKE "メインページ")
ORDER BY
  views DESC
LIMIT
  1000