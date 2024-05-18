/*DROP DATABASE KickstarterDW
GO
CREATE DATABASE KickstarterDW
GO
ALTER DATABASE KickstarterDW
SET RECOVERY SIMPLE
GO
*/

USE KickstarterDW
;

GO
CREATE SCHEMA Kickstarter
GO

/* Drop table Kickstarter.DimParent */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'Kickstarter.DimParent') AND OBJECTPROPERTY(id,'IsUserTable')  = 1)
DROP TABLE Kickstarter.DimParent
;

/* Create table Kickstarter.DimParent */
CREATE TABLE Kickstarter.DimParent (
	[ParentKey] int IDENTITY NOT NULL
,	[ParentID]  nchar(2) NOT NULL
,	[ParentName] nvarchar(40) NOT NULL
,	CONSTRAINT [PK_Kickstarter.DimParent] PRIMARY KEY CLUSTERED
( [ParentKey] )
) ON [PRIMARY]
;

SET IDENTITY_INSERT Kickstarter.DimParent ON
;
INSERT INTO Kickstarter.DimParent (ParentKey, ParentID, ParentName)
VALUES (-1, 'N', 'None')
;
SET IDENTITY_INSERT Kickstarter.DimParent OFF
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[Kickstarter].[Parent]'))
DROP VIEW [Kickstarter].[Parent]
GO
CREATE VIEW [Kickstarter].[Parent] AS
SELECT [ParentKey] AS [ParentKey]
, [ParentID] AS [ParentID]
, [ParentName] AS [ParentName]
FROM Kickstarter.DimParent
GO

/* Drop table Kickstarter.DimCategory */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'Kickstarter.DimCategory') AND OBJECTPROPERTY(id,'IsUserTable')  = 1)
DROP TABLE Kickstarter.DimCategory
;

/* Create table Kickstarter.DimCategory */
CREATE TABLE Kickstarter.DimCategory (
	[CategoryKey] int IDENTITY NOT NULL
,	[CategoryID] nvarchar(30) NOT NULL
,	[CategoryName] nvarchar(30) NOT NULL
,	CONSTRAINT [PK_Kickstarter.DimCategory] PRIMARY KEY CLUSTERED
( [CategoryKey] )
) ON [PRIMARY]
;

SET IDENTITY_INSERT Kickstarter.DimCategory ON
;
INSERT INTO Kickstarter.DimCategory (CategoryKey, CategoryID, CategoryName)
VALUES (-1, 'N', 'Comedy')
;
SET IDENTITY_INSERT Kickstarter.DimCategory OFF
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[Kickstarter].[Category]')) 
DROP VIEW [Kickstarter].[Category]
GO
CREATE VIEW [Kickstarter].[Category] AS
SELECT [CategoryKey] AS [CategoryKey]
, [CategoryID] AS [CategoryID]
, [CategoryName] AS [CategoryName]
FROM Kickstarter.DimCategory
GO

/* Create table Kickstarter.DimDate */
CREATE TABLE Kickstarter.DimDate (
   [DateKey]  int   NOT NULL
,  [Createdat]  date   NULL
,  [Deadline]  date NOT NULL
,  [Launchedat]  date   NOT NULL 
,  [Statechangedat]  date   NOT NULL
,	[ProjectID] int NOT NULL
, CONSTRAINT [PK_Kickstarter.DimDate] PRIMARY KEY CLUSTERED 
( [DateKey] )
) ON [PRIMARY]
;


INSERT INTO Kickstarter.DimDate (DateKey, Createdat,  Deadline, Launchedat, Statechangedat, ProjectID)
VALUES (-1, '', '', '', '','')
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[Kickstarter].[Date]'))
DROP VIEW [Kickstarter].[Date]
GO
CREATE VIEW [Kickstarter].[Date] AS 
SELECT [DateKey] AS [DateKey]
, [Createdat] AS [Createdat]
, [Deadline] AS [Deadline]
, [Launchedat] AS [Launchedat]
, [Statechangedat] AS [Statechangedat]
, [ProjectID] AS [ProjectID]
FROM Kickstarter.DimDate
GO

/* Create table Kickstarter.DimCountry */ 
CREATE TABLE Kickstarter.DimCountry (
	[CountryKey] int NOT NULL
,	[CountryID] nchar NOT NULL
,	[CountryName] nvarchar(40) NOT NULL
, CONSTRAINT [PK_Kickstarter.DimCountry] PRIMARY KEY CLUSTERED 
( [CountryKey] )
) ON [PRIMARY]
;


INSERT INTO Kickstarter.DimCountry ([CountryKey], [CountryID],  [CountryName])
VALUES (-1, 'U', 'the United States')
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[Kickstarter].[Country]'))
DROP VIEW [Kickstarter].[Country]
GO
CREATE VIEW [Kickstarter].[Country] AS 
SELECT [CountryKey] AS [CountryKey]
, [CountryID] AS [CountryID]
, [CountryName] AS [CountryName]
FROM Kickstarter.DimCountry
GO

/* Create table Kickstarter.DimProject */ 
CREATE TABLE Kickstarter.DimProject (
	[ProjectKey] int NOT NULL
,	[ProjectID] nchar NOT NULL
,	[ProjectName] nvarchar(40) NOT NULL
,	[ProjectState] nvarchar(50) NOT NULL
,	[ProjectBackers_count] int NOT NULL
,	[ProjectGoal] int NOT NULL
, CONSTRAINT [PK_Kickstarter.DimProject] PRIMARY KEY CLUSTERED 
( [ProjectKey] )
) ON [PRIMARY]
;


INSERT INTO Kickstarter.DimProject ([ProjectKey], [ProjectID],  [ProjectName], [ProjectState], [ProjectBackers_count], [ProjectGoal])
VALUES (-1, '', 'None','None', 2, 2)
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[Kickstarter].[Project]'))
DROP VIEW [Kickstarter].[Project]
GO
CREATE VIEW [Kickstarter].[Project] AS 
SELECT [ProjectKey] AS [ProjectKey]
, [ProjectID] AS [ProjectID]
, [ProjectName] AS [ProjectName]
, [ProjectState] AS [ProjectState]
, [ProjectBackers_count] AS [ProjectBackers_count]
, [ProjectGoal] AS [ProjectGoal]
FROM Kickstarter.DimProject
GO

/* Drop table Kickstarter.[FactTopCategory] */
IF EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'Kickstarter.FactTopCategory'))
    DROP TABLE Kickstarter.FactTopCategory;
GO

/* Create table Kickstarter.[FactTopCategory] */
CREATE TABLE Kickstarter.[FactTopCategory] (
   [ParentKey]  int   NOT NULL
,  [CategoryKey]  int   NOT NULL
,  [CountryKey]  int   NOT NULL
,  [ProjectKey]  int   NOT NULL
,  [DateKey] int NOT NULL
,  [Averagedays] int NOT NULL
,  [Sumdays] int NOT NULL
CONSTRAINT CompositeKey PRIMARY KEY ([ParentKey], [CategoryKey], [CountryKey], [ProjectKey], [DateKey], [Averagedays], [Sumdays])
);

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[Kickstarter].[TopCategory]'))
DROP VIEW [Kickstarter].[TopCategory]
GO
CREATE VIEW [Kickstarter].[TopCategory] AS 
SELECT [ParentKey] AS [ParentKey]
, [CategoryKey] AS [CategoryKey]
, [CountryKey] AS [CountryKey]
, [ProjectKey] AS [ProjectKey]
, [DateKey] AS [DateKey]
, [Averagedays] AS [Averagedays]
, [Sumdays] AS [Sumdays]
FROM Kickstarter.[FactTopCategory]
GO

ALTER TABLE Kickstarter.FactTopCategory ADD CONSTRAINT
	FK_Kickstarter_FactTopCategory_ParentKey FOREIGN KEY
	(
	ParentKey
	) REFERENCES Kickstarter.DimParent
	( ParentKey )
	  ON UPDATE NO ACTION
	  ON DELETE NO ACTION
;

ALTER TABLE Kickstarter.FactTopCategory ADD CONSTRAINT
	FK_Kickstarter_FactTopCategory_CategoryKey FOREIGN KEY
	(
	CategoryKey
	) REFERENCES Kickstarter.DimCategory
	( CategoryKey )
	  ON UPDATE NO ACTION
	  ON DELETE NO ACTION
;

ALTER TABLE Kickstarter.FactTopCategory ADD CONSTRAINT
	FK_Kickstarter_FactTopCategory_CountryKey FOREIGN KEY
	(
	CountryKey
	) REFERENCES Kickstarter.DimCountry
	( CountryKey)
	  ON UPDATE NO ACTION
	  ON DELETE NO ACTION
;

ALTER TABLE Kickstarter.FactTopCategory ADD CONSTRAINT
	FK_Kickstarter_FactTopCategory_ProjectKey FOREIGN KEY
	(
	ProjectKey
	) REFERENCES Kickstarter.DimProject
	( ProjectKey)
	  ON UPDATE NO ACTION
	  ON DELETE NO ACTION
;

ALTER TABLE Kickstarter.FactTopCategory ADD CONSTRAINT 
    FK_Kickstarter_FactTopCategory_ProjectID FOREIGN KEY 
    (
    DateKey
    ) REFERENCES Kickstarter.DimDate 
    (DateKey)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
;