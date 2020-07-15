USE TestingSystem;

-- lấy ra danh sách cấu hỏi có ID của câu hỏi về C# --

SELECT 
    *
FROM
    Question
WHERE
    QuestionID > (	SELECT 
						QuestionID
					FROM
						Question
					WHERE
						Content = 'Hỏi về C#');
                        
                        


-- lấy ra danh sách các tài khoản có DeparmentID lớn hơn DepartmentID của tài khoản có AccountID = 3

SELECT 
    *
FROM
    `Account`
WHERE
    DepartmentID > (SELECT 
						DepartmentID
					FROM
						`Account`
					WHERE
						AccountID = 3)
ORDER BY DepartmentID;

SELECT 
    *
FROM
    `Account`
WHERE
    DepartmentID >ALL (SELECT 
						DepartmentID
					FROM
						`Account`
					WHERE
						AccountID = 3||AccountID = 5)

-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
DROP VIEW IF EXISTS sale_Department;
CREATE VIEW sale_Department AS
SELECT  FullName
FROM `Department` DE INNER JOIN `Account` AC ON DE.DepartmentID = AC.DepartmentID
WHERE DE.DepartmentName = 'sale';

Select *
from sale_department;


WITH CTE_account AS
    (SELECT AccountID,FullName,Email,DepartmentID
    FROM
        account
    WHERE
        DepartmentID = 2)
        
SELECT *
FROM CTE_account;



-- SQL – Assignment 5

-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE VIEW v_Sale AS
			SELECT 
				A.FullName
			FROM
				`Account` A
			INNER JOIN
				`Department` D ON A.DepartmentID = D.DepartmentID
			WHERE
				D.DepartmentName = 'sale';
    
SELECT * FROM v_Sale;


-- subquery
    SELECT 
		A.FullName
	FROM
		`Account` A
	INNER JOIN
		`Department` D ON A.DepartmentID = D.DepartmentID
	WHERE
		D.DepartmentID = (SELECT D1.DepartmentID FROM Department D1 Where D1.DepartmentName = 'sale');


CREATE VIEW vw_Sale
AS
	SELECT		A.*, D.DepartmentName
	FROM 		`Account` A 
	INNER JOIN 	`Department` D ON A.DepartmentID = D.DepartmentID
	WHERE		D.DepartmentName = 'Sale';

SELECT 	* 
FROM 	vw_Sale;

WITH CTE_SALE1 AS
			(SELECT 
				A.*,D.DepartmentName
			FROM
				`Account` A
			INNER JOIN
				`Department` D ON A.DepartmentID = D.DepartmentID
			WHERE
				D.DepartmentName = 'sale');
            
-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
SELECT 
    A.*,COUNT(GA.AccountID) as 'SOLUONG'
FROM
    `Account` A
INNER JOIN `GroupAccount` GA ON A.AccountID = GA.AccountID
HAVING COUNT(GA.AccountID) = (SELECT 		COUNT(GA.AccountID) 
									FROM		`Account` A 
									INNER JOIN 	GroupAccount GA ON A.AccountID = GA.AccountID
									GROUP BY	A.AccountID
									ORDER BY	COUNT(GA.AccountID) DESC
									LIMIT		1);
                
                
                
/*CREATE OR REPLACE VIEW vw_InfAccountMaxGroup
AS
SELECT 		A.*, COUNT(GA.AccountID) AS 'SO LUONG'
FROM		`Account` A 
INNER JOIN 	`GroupAccount` GA ON A.AccountID = GA.AccountID
GROUP BY	A.AccountID
HAVING		COUNT(GA.AccountID) = (
									SELECT 		COUNT(GA.AccountID) 
									FROM		`Account` A 
									INNER JOIN 	GroupAccount GA ON A.AccountID = GA.AccountID
									GROUP BY	A.AccountID
									ORDER BY	COUNT(GA.AccountID) DESC
									LIMIT		1
								  );
*/

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi

CREATE VIEW Contenttren10 AS
SELECT 
    LENGTH(Content)
FROM
    `Question`
WHERE
    LENGTH(Content) > 10;

SELECT * FROM Contenttren10;


WITH CTE_content AS
				(SELECT 
					LENGTH(Content)
				FROM
					`Question`
				WHERE
					LENGTH(Content) > 10);

				SELECT * FROM Contenttren10;


-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE VIEW Ma_dept AS
    SELECT 
        MAX(AC.DepartmentID)
    FROM
        `Account` AC
	INNER JOIN Department DE ON AC.DepartmentID = DE.DepartmentID;

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
CREATE VIEW vw_HoNguyen;
SELECT 
    A.FullName
FROM
    `Question` Q
INNER JOIN 	`Account` A ON Q.CreatorID = A.AccountID
WHERE	substring(A.FullName,1,6) = 'Nguyen';	

SELECT * FROM vw_HoNguyen;
-- SUBSTRING_INDEX(FullName,' ',1) = 'Nguyen';

