WITH quartiles AS (
  SELECT
    APPROX_QUANTILES(score, 4) AS quartile_scores
  FROM
    `bigquery-public-data.hacker_news.full`
)

SELECT
  "First Quartile" AS quartile,
  quartile_scores[OFFSET(1)] AS score
FROM quartiles
UNION ALL
SELECT
  "Second Quartile",
  quartile_scores[OFFSET(2)] AS score
FROM quartiles
UNION ALL
SELECT
  "Third Quartile",
  quartile_scores[OFFSET(3)] AS score
FROM quartiles
UNION ALL
SELECT
  "Fourth Quartile",
  quartile_scores[OFFSET(4)] AS score
FROM quartiles
