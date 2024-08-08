-- Create Tables
CREATE TABLE Generators (
    GeneratorID INT PRIMARY KEY AUTO_INCREMENT,
    RMGNo VARCHAR(255),  -- Changed to VARCHAR
    KVA INT,
    EngineType VARCHAR(255),
    Internal BOOLEAN,
    EngineCondition VARCHAR(255),
    EngineLocation VARCHAR(255),
    Particulars VARCHAR(255)
);

CREATE TABLE Issues (
    IssueID INT PRIMARY KEY AUTO_INCREMENT,
    IssueName VARCHAR(255)
);

CREATE TABLE Clients (
    ClientID INT PRIMARY KEY AUTO_INCREMENT,
    ClientName VARCHAR(255)
);

CREATE TABLE TicketTypes (
    TicketTypeID INT PRIMARY KEY AUTO_INCREMENT,
    TicketTypeName VARCHAR(255)
);

CREATE TABLE IssueRecognitions (
    IssueRecognitionID INT PRIMARY KEY AUTO_INCREMENT,
    IssueRecognitionName VARCHAR(255)
);

CREATE TABLE Priorities (
    PriorityID INT PRIMARY KEY AUTO_INCREMENT,
    PriorityName VARCHAR(255)
);

CREATE TABLE People (
    PersonID INT PRIMARY KEY AUTO_INCREMENT,
    PersonName VARCHAR(255)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(255)
);

CREATE TABLE Statuses (
    StatusID INT PRIMARY KEY AUTO_INCREMENT,
    StatusName VARCHAR(255)
);

CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY AUTO_INCREMENT,
    StartDate DATE,
    TicketGenerationTime TIME,
    TicketResolutionTime TIME,
    GeneratorID INT,
    IssueID INT,
    ClientID INT,
    TicketTypeID INT,
    IssueRecognitionID INT,
    PriorityID INT,
    AssignedTo INT,
    DepartmentID INT,
    StatusID INT,
    CompletedDate DATE,
    TimeTakenDays TIME,
    PendingDays TIME,
    Remarks VARCHAR(255),
    FOREIGN KEY (GeneratorID) REFERENCES Generators(GeneratorID),
    FOREIGN KEY (IssueID) REFERENCES Issues(IssueID),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (TicketTypeID) REFERENCES TicketTypes(TicketTypeID),
    FOREIGN KEY (IssueRecognitionID) REFERENCES IssueRecognitions(IssueRecognitionID),
    FOREIGN KEY (PriorityID) REFERENCES Priorities(PriorityID),
    FOREIGN KEY (AssignedTo) REFERENCES People(PersonID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (StatusID) REFERENCES Statuses(StatusID)
);
