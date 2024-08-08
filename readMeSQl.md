# Database Setup Guide

```sh
# Step 1: Drop the Previous Database

# Open MySQL Command Line
mysql -u root -p

# Enter your MySQL root password when prompted.

# Drop the previous database
DROP DATABASE IF EXISTS maintenancetickets;

# Exit the MySQL command line
EXIT;

# Step 2: Create a New Database

# Open MySQL Command Line
mysql -u root -p

# Enter your MySQL root password when prompted.

# Create the new database
CREATE DATABASE IssueTickets;

# Exit the MySQL command line
EXIT;

# Step 3: Load Data into the New Database

# Prepare the SQL files
# Save the schema into a file named schema.sql.
# Save the data loading SQL into a file named load_data.sql.

# Open your command line terminal.

# Navigate to the directory containing your SQL files
cd path/to/your/sql/files

# Load the schema into the new database
mysql -u root -p IssueTickets < schema.sql

# Load the data into the new database
mysql -u root -p IssueTickets < load_data.sql

# Open MySQL Command Line
mysql -u root -p

# Enter your MySQL root password when prompted.

# Drop the previous database and create a new one
DROP DATABASE IF EXISTS issuetickets;
CREATE DATABASE IssueTickets;
EXIT;
