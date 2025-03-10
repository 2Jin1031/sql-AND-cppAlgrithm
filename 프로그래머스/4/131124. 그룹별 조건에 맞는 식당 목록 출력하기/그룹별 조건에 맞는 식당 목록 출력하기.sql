SELECT p.MEMBER_NAME, r.REVIEW_TEXT, DATE_FORMAT(r.REVIEW_DATE, "%Y-%m-%d") AS REVIEW_DATE
FROM MEMBER_PROFILE p, REST_REVIEW r
WHERE p.MEMBER_ID = r.MEMBER_ID
    AND p.MEMBER_ID = (SELECT MEMBER_ID
                        FROM REST_REVIEW
                        GROUP BY MEMBER_ID
                        ORDER BY COUNT(REVIEW_ID) DESC
                        LIMIT 1)
ORDER BY REVIEW_DATE, REVIEW_TEXT;