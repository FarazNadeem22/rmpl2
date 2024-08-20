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
    return render_template('index.html')
    
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        
        cursor.callproc('generate_ticket_report')
        
        # Fetch the result of the stored procedure
        tickets = []
        for result in cursor.stored_results():
            tickets.extend(result.fetchall())

        # Apply the filtering in Python
        if status_filter:
            tickets = [ticket for ticket in tickets if ticket.get('StatusName') == status_filter]

        # Fetch statuses for the dropdown
        cursor.execute("SELECT StatusName FROM Statuses")
        statuses = cursor.fetchall()

        cursor.close()
        conn.close()
        return render_template('index.html', tickets=tickets, statuses=statuses)
    except Error as e:
        return f"Error: {e}"

@app.route('/view_open_tickets', methods=['GET'])
def view_open_tickets():
    # Get filter values from the request
    ticket_number = request.args.get('ticket_number')
    rmg_number = request.args.get('rmg_number')
    issue_name = request.args.get('issue_name')
    client_name = request.args.get('client_name')
    ticket_type = request.args.get('ticket_type')
    priority_filter = request.args.get('priority')
    assigned_to_filter = request.args.get('assigned_to')
    
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        
        cursor.callproc('generate_ticket_report')
        
        # Fetch the result of the stored procedure
        tickets = []
        for result in cursor.stored_results():
            tickets.extend(result.fetchall())

        # Filter open tickets
        open_tickets = [ticket for ticket in tickets if ticket.get('StatusName') == 'Open']
        
        # Apply filters
        if ticket_number:
            open_tickets = [ticket for ticket in open_tickets if str(ticket.get('TicketID')) == ticket_number]
        
        if rmg_number:
            open_tickets = [ticket for ticket in open_tickets if rmg_number.lower() == ticket.get('RMGNo', '').lower()]
        
        if issue_name:
            open_tickets = [ticket for ticket in open_tickets if issue_name.lower() in ticket.get('IssueName', '').lower()]
        
        if client_name:
            open_tickets = [ticket for ticket in open_tickets if client_name.lower() in ticket.get('ClientName', '').lower()]
        
        if ticket_type:
            open_tickets = [ticket for ticket in open_tickets if ticket.get('TicketTypeName') == ticket_type]
        
        if priority_filter:
            open_tickets = [ticket for ticket in open_tickets if ticket.get('PriorityName') == priority_filter]

        if assigned_to_filter:
            open_tickets = [ticket for ticket in open_tickets if ticket.get('AssignedToName') == assigned_to_filter]

        # Fetch ticket numbers for open tickets only
        cursor.execute("SELECT TicketID FROM Tickets WHERE StatusID = (SELECT StatusID FROM Statuses WHERE StatusName = 'Open')")
        ticket_numbers = cursor.fetchall()
        
        # Fetch RMG numbers, priorities, ticket types, people, and clients for the dropdowns
        cursor.execute("SELECT DISTINCT RMGNo FROM Generators")
        rmg_numbers = cursor.fetchall()
        
        cursor.execute("SELECT PriorityName FROM Priorities")
        priorities = cursor.fetchall()
        
        cursor.execute("SELECT TicketTypeName FROM TicketTypes")
        ticket_types = cursor.fetchall()

        cursor.execute("SELECT PersonName FROM People")
        people = cursor.fetchall()

        cursor.execute("SELECT ClientName FROM Clients")
        clients = cursor.fetchall()

        cursor.close()
        conn.close()
        
        return render_template('view_open_tickets.html', open_tickets=open_tickets, ticket_numbers=ticket_numbers, rmg_numbers=rmg_numbers, priorities=priorities, ticket_types=ticket_types, people=people, clients=clients)
    except Error as e:
        return f"Error: {e}"




@app.route('/view_closed_tickets')
def view_closed_tickets():
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        
        cursor.callproc('generate_ticket_report')
        
        # Fetch the result of the stored procedure
        tickets = []
        for result in cursor.stored_results():
            tickets.extend(result.fetchall())

        # Filter closed tickets
        closed_tickets = [ticket for ticket in tickets if ticket.get('StatusName') == 'Closed']

        cursor.close()
        conn.close()
        return render_template('view_closed_tickets.html', closed_tickets=closed_tickets)
    except Error as e:
        return f"Error: {e}"

@app.route('/add_ticket', methods=['GET', 'POST'])
def add_ticket():
    if request.method == 'POST':
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
        completed_date = request.form['completed_date'] if request.form['completed_date'] else None
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
        
        cursor.execute("SELECT GeneratorID, RMGNo, KVA, EngineLocation, Particulars FROM Generators")
        generators = cursor.fetchall()
        
        cursor.execute("SELECT IssueID, IssueName FROM Issues ORDER BY IssueName  ASC")
        issues = cursor.fetchall()
        
        cursor.execute("SELECT ClientID, ClientName FROM Clients ORDER BY ClientName ASC")
        clients = cursor.fetchall()
        
        cursor.execute("SELECT TicketTypeID, TicketTypeName FROM TicketTypes ORDER BY TicketTypeName ASC")
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

@app.route('/edit_ticket/<int:ticket_id>', methods=['GET', 'POST'])
def edit_ticket(ticket_id):
    if request.method == 'POST':
        status_id = request.form['status_id']
        completed_date = request.form['completed_date'] if request.form['completed_date'] else None
        priority_id = request.form['priority_id']
        assigned_to = request.form['assigned_to']
        
        try:
            conn = get_db_connection()
            cursor = conn.cursor()
            cursor.execute(
                """
                UPDATE Tickets
                SET StatusID = %s, CompletedDate = %s, PriorityID = %s, AssignedTo = %s
                WHERE TicketID = %s
                """,
                (status_id, completed_date, priority_id, assigned_to, ticket_id)
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
        cursor.execute("SELECT * FROM Tickets WHERE TicketID = %s", (ticket_id,))
        ticket = cursor.fetchone()

        cursor.execute("SELECT StatusID, StatusName FROM Statuses")
        statuses = cursor.fetchall()

        cursor.execute("SELECT PriorityID, PriorityName FROM Priorities")
        priorities = cursor.fetchall()

        cursor.execute("SELECT PersonID, PersonName FROM People")
        people = cursor.fetchall()
        
        cursor.close()
        conn.close()

        return render_template('edit_ticket.html', ticket=ticket, statuses=statuses, priorities=priorities, people=people)
    except Error as e:
        return f"Error: {e}"

@app.route('/void_ticket/<int:ticket_id>')
def void_ticket(ticket_id):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(
            """
            UPDATE Tickets
            SET StatusID = (SELECT StatusID FROM Statuses WHERE StatusName = 'Void')
            WHERE TicketID = %s
            """,
            (ticket_id,)
        )
        conn.commit()
        cursor.close()
        conn.close()
        return redirect(url_for('index'))
    except Error as e:
        return f"Error: {e}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
