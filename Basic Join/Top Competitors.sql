SELECT h.hacker_id,
       h.NAME
FROM   submissions s
       LEFT JOIN hackers h
              ON s.hacker_id = h.hacker_id
       LEFT JOIN challenges c
              ON s.challenge_id = c.challenge_id
       LEFT JOIN difficulty d
              ON c.difficulty_level = d.difficulty_level
WHERE  s.score = d.score
GROUP  BY h.hacker_id
HAVING( Count(*) > 1 )
ORDER  BY Count(*) DESC,
          s.hacker_id;
