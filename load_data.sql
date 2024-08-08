-- Load data into Generators
INSERT INTO Generators (RMGNo, KVA, EngineType, Internal, EngineCondition, EngineLocation, Particulars) VALUES
('2', 365, 'TypeA', TRUE, 'Major Overhauling', 'Workshop', 'ParticularA'),
('3', 365, 'TypeB', TRUE, 'Ready to hire', 'Yard', 'ParticularB'),
('4', 455, 'TypeC', TRUE, 'ConditionC', 'SM Cotton - Bela', 'ParticularC'),
('5', 500, 'TypeD', TRUE, 'Alternator & turbo change', 'Workshop', 'ParticularD'),
('6', 500, 'TypeE', TRUE, 'ConditionE', 'AS Agro - Authal', 'ParticularE'),
('8', 725, 'TypeF', TRUE, 'ConditionF', 'Workshop', 'ParticularF'),
('9', 1275, 'TypeG', TRUE, 'ConditionG', 'Ajmal - Karachi', 'ParticularG'),
('10', 100, 'TypeH', TRUE, 'ConditionH', 'Dadex - Hyderabad', 'ParticularH'),
('11', 250, 'TypeI', TRUE, 'ConditionI', 'Workshop', 'ParticularI'),
('12', 635, 'TypeJ', TRUE, 'ConditionJ', 'Yard', 'ParticularJ');

-- Load data into Issues
INSERT INTO Issues (IssueName) VALUES
('Head rebuild'),
('Module card replace'),
('Module card calibrate in-house'),
('Card Installation'),
('Load testing'),
('Stolen Battery'),
('Relay Issue'),
('Stolen Cables');

-- Load data into Clients
INSERT INTO Clients (ClientName) VALUES
('DIB'),
('Ideas Pvt Ltd');

-- Load data into TicketTypes
INSERT INTO TicketTypes (TicketTypeName) VALUES
('BreakDown'),
('Cleaning Issues'),
('Operator Related'),
('Repair'),
('Outside Work for client'),
('Trouble shooting'),
('Stolen cable issue');

-- Load data into IssueRecognitions
INSERT INTO IssueRecognitions (IssueRecognitionName) VALUES
('Daily meeting'),
('Sporadic');

-- Load data into Priorities
INSERT INTO Priorities (PriorityName) VALUES
('Critical'),
('Urgent'),
('High'),
('Medium'),
('Low');

-- Load data into People
INSERT INTO People (PersonName) VALUES
('Tanveer Alam'),
('Muhammad Irshad'),
('Abdul Waseem'),
('Syed Zahid');

-- Load data into Departments
INSERT INTO Departments (DepartmentName) VALUES
('Mechanical'),
('Electrical'),
('Accounts'),
('Admin'),
('Sales');

-- Load data into Statuses
INSERT INTO Statuses (StatusName) VALUES
('Done'),
('Not Done');

-- Load data into Tickets
INSERT INTO Tickets (StartDate, TicketGenerationTime, TicketResolutionTime, GeneratorID, IssueID, ClientID, TicketTypeID, IssueRecognitionID, PriorityID, AssignedTo, DepartmentID, StatusID, CompletedDate, TimeTakenDays, PendingDays, Remarks) VALUES
('2024-08-07', '08:00:00', '17:00:00', 1, 1, 1, 4, 1, 2, 1, 1, 2, '2024-08-07', '00:00:00', '00:00:00', NULL),
('2024-08-07', '08:00:00', '17:00:00', 2, 2, 2, 5, 1, 3, 2, 1, 1, '2024-08-07', '00:00:00', '00:00:00', NULL),
('2024-08-07', '08:00:00', '17:00:00', 3, 3, 1, 1, 1, 2, 1, 2, 2, NULL, '00:00:00', '00:00:00', 'Some remarks'),
('2024-08-07', '08:00:00', '17:00:00', 4, 4, 2, 1, 2, 3, 2, 2, 2, NULL, '00:00:00', '00:00:00', 'Other remarks');
