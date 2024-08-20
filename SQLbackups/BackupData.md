# Step-by-Step Instructions to Backup Data and Schema

## Step 1: Use `mysqldump` to Create the Backup

1. **Open Command Prompt (Windows) or Terminal (Mac/Linux)**.

2. **Run the `mysqldump` command**:
   Replace `root` with your MySQL username, and `IssueTickets` with the name of your database. You will be prompted to enter your MySQL password.

   ```sh
   mysqldump -u root -p IssueTickets > IssueTickets_backup.sql
