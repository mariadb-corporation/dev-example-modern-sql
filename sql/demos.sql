
/* Aggregate functions, Rollups/Super-Aggregates, 
   Table Value Constructors, Set Operators, Precedence Operators 
*/

/* Aggregate functions */
SELECT SUM(rescues) FROM demo.supers;

/* Rollup / Super-aggregates */
SELECT 
    t.name, AVG(rescues) as avg_rescues, SUM(rescues) as total_rescues
FROM 
    demo.supers AS s INNER JOIN
    demo.supersteams AS st ON s.id = st.superid LEFT JOIN
    demo.teams AS t ON st.teamid = t.id
GROUP BY 
    t.name
WITH ROLLUP;

/* Set Operators */
SELECT
    name
FROM 
    demo.supers AS s INNER JOIN
    demo.supersteams AS st ON s.id = st.superid
WHERE 
    st.teamid = 1 
UNION
SELECT 
    name
FROM 
    demo.supers AS s INNER JOIN
    demo.supersteams AS st ON s.id = st.superid
WHERE 
    st.teamid = 2

/* Table Value Constructor */
SELECT 
    name, rescues
FROM 
    demo.supers AS s INNER JOIN
    demo.supersteams AS st ON s.id = st.superid
WHERE 
    st.teamid = 1
UNION
values ('Super Developer', 0)


/* Window functions, Common Table Expressions (CTEs) */

/* Window function */
SELECT 
    s.name as name, s.rescues,
    RANK() OVER (PARTITION BY t.name ORDER BY s.rescues DESC) AS rank,
    t.name as team,
    sum(rescues) OVER(PARTITION BY t.name) as team_total
FROM 
	demo.supers s INNER JOIN
	demo.supersteams st ON s.id = st.superid INNER JOIN
	demo.teams t ON t.id = st.teamid 
ORDER BY
	t.name, s.rescues DESC

/* Non-recursive CTE */
WITH new_heroes AS (
    SELECT 
        *
    FROM 
        demo.supers
    WHERE 
        rescues < 150 and
        type = 'H'
)

SELECT * FROM new_heroes 
INTERSECT
SELECT s.*
FROM 
    demo.supers s 
    INNER JOIN demo.supersteams st ON s.id = st.superid 
    INNER JOIN demo.teams t ON st.teamid = t.id
WHERE 
    t.id = 2;

/* Recursive CTE */
WITH RECURSIVE mentors AS(
	SELECT id, name, mentor
	FROM demo.supers
	WHERE name = 'Robin/Nightwing' 
    UNION
    SELECT s.id, s.name, s.mentor
    FROM demo.supers AS s, mentors AS h
    WHERE s.id = h.mentor 
)
SELECT * FROM mentors;

/* Temporal Table - Application Time */

UPDATE demo.supers
  FOR PORTION OF date_period
FROM '2009-01-01' to '2019-12-31'
  SET type = 'H'
WHERE id = 10

SELECT 
    id, name, type, startDate, endDate
FROM
    demo.supers
WHERE 
    name = 'Catwoman' 
ORDER BY 
    startDate