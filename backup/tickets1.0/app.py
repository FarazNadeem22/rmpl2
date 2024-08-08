from flask import Flask, render_template, request, redirect, url_for
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

# Database configuration
db_config = {
    'user': 'root',
    'password': 'fredonia8883',
    'host': '127.0.0.1',
    'port': 3306,
    'database': 'maintenancetickets'
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
        time_taken_days = request.form['time_taken_days']
        pending_days = request.form['pending_days']
        remarks = request.form['remarks']

        try:
            conn = get_db_connection()
            cursor = conn.cursor()
            cursor.execute(
                """
                INSERT INTO Tickets (
                    StartDate, TicketGenerationTime, TicketResolutionTime, GeneratorID, IssueID, ClientID, 
                    TicketTypeID, IssueRecognitionID, PriorityID, AssignedTo, DepartmentID, StatusID, 
                    CompletedDate, TimeTakenDays, PendingDays, Remarks
                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                """,
                (start_date, ticket_generation_time, ticket_resolution_time, generator_id, issue_id, client_id, 
                ticket_type_id, issue_recognition_id, priority_id, assigned_to, department_id, status_id, 
                completed_date, time_taken_days, pending_days, remarks)
            )
            conn.commit()
            cursor.close()
            conn.close()
            return redirect(url_for('index'))
        except Error as e:
            return f"Error: {e}"

    return render_template('add_ticket.html')

if __name__ == '__main__':
    app.run(debug=True)
