SELECT
  id,
  `by`,
  score,
  TIMESTAMP_SECONDS(time) AS readable_time,
  title,
  url
FROM
  `bigquery-public-data.hacker_news.full`
WHERE
  type = 'story'
ORDER BY
  score DESC
LIMIT
  10