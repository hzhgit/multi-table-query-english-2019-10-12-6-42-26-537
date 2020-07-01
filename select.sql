# 1.Query the existence of 1 course
SELECT
	* 
FROM
	student,
	student_course 
WHERE
	student.id = student_course.studentId 
	AND student_course.courseId = 1;
	
# 2.Query the presence of both 1 and 2 courses
SELECT
	* 
FROM
	student s
	LEFT JOIN student_course sc ON s.id = sc.studentId 
	AND sc.courseId = 1
	LEFT JOIN student_course sc2 ON s.id = sc2.studentId 
	AND sc2.courseId = 2 
WHERE
	sc.score > 0 && sc2.score > 0;
	
# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select
	s.id,s.name
from
	student s
	join (select studentId,avg(score) avg from student_course GROUP BY studentId) as sc
	on s.id = sc.studentId
where
	sc.avg >= 60;
	
# 4.Query the SQL statement of student information that does not have grades in the student_course table
select
	*
from
	student s
	left join student_course sc on s.id = sc.studentId
where
	score is NULL;
	
# 5.Query all SQL with grades
select
	*
from
	student s
	left join student_course sc on s.id = sc.studentId;
		
# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select
	*
from
	student s
	left join student_course sc on s.id = sc.studentId
	and sc.courseId = 1
	left join student_course sc2 on s.id = sc2.studentId
	and sc2.courseId = 2
where
	sc.score > 0 and sc2.score > 0;
	
# 7.Retrieve 1 student score with less than 60 scores in descending order
select
	*
from
	student s
	left join student_course sc on s.id = sc.studentId
where 
	sc.score < 60 and sc.courseId = 1
order by
	sc.score
desc;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select
	courseId,avg( score )
from
	student_course 
group by courseId
order by avg(score) desc,courseId asc;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select
	s.name,sc.score
from
	course c,student s,student_course sc
where
	c.name = 'math'
	and c.id = sc.courseId
	and s.id = sc.studentId
	and sc.score < 60