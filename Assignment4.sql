USE TestingSystem;


-- Exercise 1: Join
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT 		*
FROM 		`Account` A 
INNER JOIN 	Department D	ON 	A.DepartmentID = D.DepartmentID;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT		*
FROM		`Account`
WHERE		CreateDate < '2020-03-20';
-- Question 3: Viết lệnh để lấy ra tất cả các developer

SELECT 
	*
FROM
    `Account` A
INNER JOIN Position P ON A.PositionID = P.PositionID
WHERE PositionName = 'Dev'; 
-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên

SELECT 
    *
FROM
	`Account` ac
INNER JOIN 
	'Department' d ON ac.DepartmentID = d.DepartmentID
GROUP BY DepartmentName
HAVING COUNT(ac.DepartmentID) > 3; 

SELECT 		D.DepartmentID, D.DepartmentName, COUNT(A.DepartmentID) AS 'SO LUONG'
FROM 		`Account` A 
INNER JOIN 	Department  D ON D.DepartmentID = A.DepartmentID
GROUP BY 	A.DepartmentID
HAVING 		COUNT(A.DepartmentID) > 3;
-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất

SELECT  QuestionID,count(1)
FROM	TestingSystem.examquestion
group by QuestionID
having count(1) = (	SELECT MAX(tansuatcauhoi)
					From (	SELECT count(1) AS tansuatcauhoi,QuestionID
					FROM	examquestion
					group by QuestionID) AS table_tamp);


SELECT MAX(QuestionID)
FROM (
SELECT COUNT(QuestionID)
FROM ExamQuestion
GROUP BY QuestionID
ORDER BY COUNT(QuestionID) DESC)
LIMIT 1;


-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question

SELECT		CategoryName,COUNT(Q.CategoryID)
FROM		CategoryQuestion CQ 
LEFT JOIN 	Question Q ON CQ.CategoryID = Q.CategoryID
GROUP BY	CQ.CategoryID
ORDER BY	CQ.CategoryID ASC;
-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
-- Question 8: Lấy ra Question có nhiều câu trả lời nhất

SELECT 
	a.Answer,q.Content,COUNT(*) AS a
FROM
Answer a
JOIN Question
ON a.Answers = q.Answers
GROUP BY q.QuestionID;

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT 
    G.GroupID, COUNT(GA.AccountID) AS SOLUONG
FROM
    GroupAccount;

-- Question 10: Tìm chức vụ có ít người nhất


SELECT *
FROM `Account`
HAVING positionID = 2
GROUP BY PositionID
ORDER BY COUNT(1) 
LIMIT 1;



SELECT *
FROM `Account`
JOIN `position` using(PositionID)
GROUP BY  q.PositionID
having count(1) = 2;

SELECT 		P.PositionName, COUNT(A.PositionID) AS 'SO LUONG'
FROM		Position P 
INNER JOIN 	`Account` A ON P.PositionID = A.PositionID
GROUP BY 	P.PositionID
HAVING		COUNT(A.PositionID)	=	(SELECT 	MIN(CountP)
									 FROM		(SELECT 	COUNT(P.PositionID) AS CountP
												FROM		Position P 
												INNER JOIN 	`Account` A ON P.PositionID = A.PositionID		
												GROUP BY	P.PositionID) AS MinCountP);
-- Question 11: thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
-- QuestioestionID) AS a);n 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
-- question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
-- Question 13: lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT		T.TypeName, COUNT(Q.TypeID)
FROM		Question Q 
INNER JOIN 	TypeQuestion T ON Q.TypeID = T.TypeID
GROUP BY	Q.TypeID;

SELECT 
    *
FROM
    TypeQuestion
GROUP BY TypeID;

-- Question 14: lấy ra group không có account nào



SELECT 		G.GroupID,GA.GroupID,GA.AccountID	
FROM 		`Group` G
LEFT JOIN 	GroupAccount GA ON G.GroupID = GA.GroupID
WHERE 		GA.AccountID IS NULL;


/*không có account nào thì phải đặt đkien IS NULL*/
-- Question 15: lấy ra group không có account nào
-- Question 16: lấy ra question không có answer nào Error Code: 1146. Table 'testingsystem.answers' doesn't exist


SELECT 		*
FROM 		`Question` Q
LEFT JOIN 	Answer A ON Q.QuestionID = A.QuestionID
WHERE 		A.QuestionID IS NULL;     -- có thể lấy content để thay thế cho QuéstionID (A.content) --
-- Exercise 2: Union
-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
SELECT 
    *
FROM
    GroupAccount
WHERE
    GROUPID = 1;
-- b) Lấy các account thuộc nhóm thứ 2 --
SELECT 
    *
FROM
    GroupAccount
WHERE
    GROUPID = 3;
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT 
    AccountID
FROM
    GroupAccount
WHERE
    GROUPID = 1
union
SELECT 
    AccountID
FROM
    GroupAccount
WHERE
    GROUPID = 3;
    
    
    
    
    
SELECT 		A.FullName
FROM 		`Account` A
JOIN 		GroupAccount GA ON A.AccountID = GA.AccountID
WHERE 		GA.GroupID = 1
UNION
SELECT 		A.FullName
FROM 		`Account` A
JOIN 		GroupAccount GA ON A.AccountID = GA.AccountID
WHERE 		GA.GroupID = 3;
-- Question 18:
-- a) Lấy các group có lớn hơn 5 thành viên
-- b) Lấy các group có nhỏ hơn 7 thành viên
-- c) Ghép 2 kết quả từ câu a) và câu b)-- 


SELECT 
    COUNT(1) group_concat(questionid)
FROM
    Answer
GROUP BY QuestionID
HAVING COUNT(1) = 4;



