CREATE DATABASE TestingSystem;
USE TestingSystem;

-- create table: Department
CREATE TABLE Department(
	DepartmentID 			INT,
    DepartmentName 			VARCHAR(20)
);

-- create table: Position
CREATE TABLE `Position`(
	PositionID				INT,
    PositionName			VARCHAR(50)
);

-- create table: Account
CREATE TABLE `Account`(
	AccountID				INT,
    Email					VARCHAR(50),
    Username				VARCHAR(50),
    FullName				VARCHAR(50),
    DepartmentID 			INT,
    PositionID				INT,
    CreateDATE				DATE
);

-- create table: Group
CREATE TABLE `Group`(
	GroupID					INT,
    GroupName				VARCHAR(50),
    CreatorID				INT,
    CreateDATE				DATE
);

-- create table: GroupAccount
CREATE TABLE GroupAccount(
	GroupID					INT,
    AccountID				VARCHAR(50),
    JoinDATE				DATE
);

-- create table: TypeQuestion
CREATE TABLE TypeQuestion (
    TypeID 		INT,
    TypeName 	VARCHAR(50)
);

-- create table: CategoryQuestion
CREATE TABLE CategoryQuestion(
    CategoryID				INT,
    CategoryName			VARCHAR(50) 
);

-- create table: Question
CREATE TABLE Question(
    QuestionID				INT,
    Content					VARCHAR(50) ,
    CategoryID				INT,
    TypeID					INT,
    CreatorID				INT,
    CreateDATE				DATE
);

-- create table: Answer
CREATE TABLE Answer(
    Answers					INT,
    Content					VARCHAR(50),
    QuestionID				INT,
    isCorrect				BIT 
);

-- create table: Exam2
CREATE TABLE Exam(
    ExamID					INT,
    Code					VARCHAR(10),
    Title					VARCHAR(50),
    CategoryID				INT,
    Duration				INT,
    CreatorID				INT,
    CreateDATE				DATE
);

-- create table: ExamQuestion
CREATE TABLE ExamQuestion(
    ExamID				INT,
	QuestionID			INT
);