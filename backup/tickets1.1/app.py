from flask import Flask, render_template, request, redirect, url_for
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

# Database configuration
db_config = {
    'user': 'root',
    'password': 'fredonia8883',  # Replace with your MySQL root password
    'host': '127.0.0.1',
    'port': 3306,
    'database': 'IssueTickets'
}

def get_db_connection():
    return mysql.connector.connect(**db_config)

@app.route('/')
def index():
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("CALL generate_ticket_report()")
        tickets = cursor.fetchall()
        cursor.close()
        conn.close()
        return render_template('index.html', tickets=tickets)
    except Error as e:
        return f"Error: {e}"

@app.route('/add_ticket', methods=['GET', 'POST'])
def add_ticket():
    if request.method == 'POST':
        # Retrieve form data
        start_date = request.form['start_date']
        ticket_generation_time = request.form['ticket_generation_time']
        ticket_resolution_time = request.form['ticket_resolution_time']
        generator_id = request.form['generator_id']
        issue_id = request.form['issue_id']
        client_id = request.form['client_id']
        ticket_type_id = request.form['ticket_type_id']
        issue_recognition_id = request.form['issue_recognition_id']
        priority_id = request.form['priority_id']
        assigned_to = request.form['assigned_to']
        department_id = request.form['department_id']
        status_id = request.form['status_id']
        completed_date = request.form['completed_date']
        remarks = request.form['remarks']

        try:
            conn = get_db_connection()
            cursor = conn.cursor()
            cursor.execute(
                """
                INSERT INTO Tickets (
                    StartDate, TicketGenerationTime, TicketResolutionTime, GeneratorID, IssueID, ClientID, 
                    TicketTypeID, IssueRecognitionID, PriorityID, AssignedTo, DepartmentID, StatusID, 
                    CompletedDate, Remarks
                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                """,
                (start_date, ticket_generation_time, ticket_resolution_time, generator_id, issue_id, client_id, 
                ticket_type_id, issue_recognition_id, priority_id, assigned_to, department_id, status_id, 
                completed_date, remarks)
            )
            conn.commit()
            cursor.close()
            conn.close()
            return redirect(url_for('index'))
        except Error as e:
            return f"Error: {e}"

    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        
        # Query the necessary tables for dropdown data
        cursor.execute("SELECT GeneratorID, RMGNo, KVA, EngineLocation, Particulars FROM Generators")
        generators = cursor.fetchall()
        
        cursor.execute("SELECT IssueID, IssueName FROM Issues")
        issues = cursor.fetchall()
        
        cursor.execute("SELECT ClientID, ClientName FROM Clients")
        clients = cursor.fetchall()
        
        cursor.execute("SELECT TicketTypeID, TicketTypeName FROM TicketTypes")
        ticket_types = cursor.fetchall()
        
        cursor.execute("SELECT IssueRecognitionID, IssueRecognitionName FROM IssueRecognitions")
        issue_recognitions = cursor.fetchall()
        
        cursor.execute("SELECT PriorityID, PriorityName FROM Priorities")
        priorities = cursor.fetchall()
        
        cursor.execute("SELECT PersonID, PersonName FROM People")
        people = cursor.fetchall()
        
        cursor.execute("SELECT DepartmentID, DepartmentName FROM Departments")
        departments = cursor.fetchall()
        
        cursor.execute("SELECT StatusID, StatusName FROM Statuses")
        statuses = cursor.fetchall()
        
        cursor.close()
        conn.close()
        
        return render_template('add_ticket.html', 
                               generators=generators, 
                               issues=issues, 
                               clients=clients, 
                               ticket_types=ticket_types, 
                               issue_recognitions=issue_recognitions, 
                               priorities=priorities, 
                               people=people, 
                               departments=departments, 
                               statuses=statuses)
    except Error as e:
        return f"Error: {e}"

if __name__ == '__main__':
    app.run(debug=True)
