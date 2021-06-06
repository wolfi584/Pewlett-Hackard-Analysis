SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles t ON t.emp_no = e.emp_no
WHERE e.birth_date BETWEEN '1/1/1952' AND '12/31/1955'
ORDER BY emp_no;

SELECT * FROM retirement_titles ORDER BY emp_no, to_date  LIMIT 10;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles LIMIT 10;

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_title
GROUP BY title
ORDER BY 1 DESC;

SELECT * FROM retiring_titles;

-- Mentorship Eligibility

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibilty
FROM employees e
INNER JOIN dept_emp de on de.emp_no = e.emp_no
INNER JOIN titles t on t.emp_no = e.emp_no
WHERE birth_date BETWEEN '1/1/1965' AND '12/31/1965' AND de.to_date = '1/1/9999'
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibilty ORDER BY emp_no LIMIT 10;

-- discrepancies in my output from the course image, i deptermed that another date filter was neccessary

SELECT * FROM titles WHERE emp_no = 12155;  -- Promoted from Engineer to Senior Engineer on 9/16/2001
SELECT * FROM titles WHERE emp_no = 10762;  -- Promoted from Staff to Senior Staff on 1/21/1999

-- both titles and department employee tables had to be filtered on the to_date = '1/1/9999' to signify current department and current titles.

DROP TABLE mentorship_eligibilty;
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibilty
FROM employees e
INNER JOIN dept_emp de on de.emp_no = e.emp_no
INNER JOIN titles t on t.emp_no = e.emp_no
WHERE birth_date BETWEEN '1/1/1965' AND '12/31/1965' AND de.to_date = '1/1/9999' AND t.to_date = '1/1/9999'
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibilty ORDER BY emp_no LIMIT 10;
