-- Clients
INSERT INTO Clients (ClientName) VALUES ('DIB'), ('Ideas Pvt Ltd');

-- Issue Recognitions
INSERT INTO IssueRecognitions (IssueRecognitionName) VALUES ('Daily meeting'), ('Sporadic');

-- Departments
INSERT INTO Departments (DepartmentName) VALUES ('Mechanical'), ('Electrical'), ('Accounts'), ('Admin'), ('Sales');

-- People
INSERT INTO People (PersonName, Details, DepartmentID) VALUES 
('Tanveer Alam', 'Mechanical Incharge', 1), 
('Muhammad Irshad', 'Electrical Incharge', 2), 
('Abdul Waseem', NULL, NULL), 
('Syed Zahid', 'Manager Sales', 5);

-- Priorities
INSERT INTO Priorities (PriorityName) VALUES ('Critical'), ('Urgent'), ('High'), ('Medium'), ('Low');

-- Ticket Types
INSERT INTO TicketTypes (TicketTypeName, Details) VALUES 
('BreakDown', NULL), 
('Cleaning Issues', NULL), 
('Operator Related', NULL), 
('Repair', NULL), 
('Outside Work for client', 'This is work we do for our clients that we charge them for. This is a profit generating head'), 
('Trouble shooting', NULL), 
('Stolen cable issue', NULL);

-- Generators
INSERT INTO Generators (RMGNo, KVA, EngineType, Internal, EngineCondition, EngineLocation, Particulars) VALUES 
(2, 365, NULL, TRUE, 'Major Overhauling', 'Workshop', NULL), 
(3, 365, NULL, TRUE, 'Ready to hire', 'Yard', NULL), 
(4, 455, NULL, TRUE, NULL, 'SM Cotton - Bela', NULL),
(5, 500, NULL, TRUE, 'Alternator & turbo change', 'Workshop', NULL),
(6, 500, NULL, TRUE, NULL, 'AS Agro - Authal', NULL),
(8, 725, NULL, TRUE, NULL, 'Workshop', NULL),
(9, 1275, NULL, TRUE, NULL, 'Ajmal - Karachi', NULL),
(10, 100, NULL, TRUE, NULL, 'Dadex - Hyderabad', NULL),
(11, 250, NULL, TRUE, NULL, 'Workshop', NULL),
(12, 635, NULL, TRUE, NULL, 'Yard', NULL),
(14, 500, NULL, TRUE, NULL, 'Yard', NULL),
(16, 635, NULL, TRUE, NULL, 'Yard', NULL),
(18, 725, NULL, TRUE, NULL, 'DIB - Karachi', NULL),
(19, 100, NULL, TRUE, NULL, 'Yard', NULL),
(20, 250, NULL, TRUE, NULL, 'Yard', NULL),
(21, 365, NULL, TRUE, NULL, 'Jullay lal - Sangarh', NULL),
(22, 1000, NULL, TRUE, NULL, 'Quality dyeing - Karachi', NULL),
(25, 25, NULL, TRUE, NULL, 'Maheen - Karachi', NULL),
(28, 33, NULL, TRUE, NULL, 'Yard', NULL),
(37, 20, NULL, TRUE, NULL, 'Parveen - Karachi', NULL),
(40, 100, NULL, TRUE, NULL, 'Ideas - Faisalabad', NULL),
(41, 365, NULL, TRUE, NULL, 'Yard', NULL),
(43, 275, NULL, TRUE, NULL, NULL, NULL),
(44, 310, NULL, TRUE, NULL, NULL, NULL),
(47, 100, NULL, TRUE, NULL, NULL, NULL),
(49, 500, NULL, TRUE, NULL, NULL, NULL),
(50, 60, NULL, TRUE, NULL, NULL, NULL),
(NULL, 1000, NULL, FALSE, NULL, NULL, 'External DADEX engine'),
(NULL, NULL, NULL, TRUE, NULL, NULL, 'Accounts and admin issues');

-- Statuses
INSERT INTO Statuses (StatusName) VALUES ('Done'), ('Not Done');

-- Issues
INSERT INTO Issues (IssueName, Details) VALUES 
('Head rebuild', NULL), 
('Module card replace', NULL), 
('Module card calibrate in-house', NULL), 
('Card Installation', NULL), 
('Load testing', NULL), 
('Stolen Battery', NULL), 
('Relay Issue', 'Generator is not starting because of Relay'), 
('Stolen Cables', NULL);

-- Tickets
INSERT INTO Tickets (StartDate, TicketGenerationTime, TicketResolutionTime, GeneratorID, IssueID, ClientID, TicketTypeID, IssueRecognitionID, PriorityID, AssignedTo, DepartmentID, StatusID, CompletedDate, TimeTakenDays, PendingDays, Remarks) VALUES 
('2024-08-07', '08:00:00', '17:00:00', 1, 1, 1, 4, 1, 2, 1, 1, 2, '2024-08-07', 0, 0, NULL), 
('2024-08-07', '08:00:00', '17:00:00', 2, 2, 2, 5, 1, 3, 2, 1, 1, '2024-08-07', 0, 0, NULL),
-- ... (Continue inserting the rest of the ticket data)
