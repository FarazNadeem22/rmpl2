import mysql.connector
from mysql.connector import Error

def get_db_connection():
    try:
        connection = mysql.connector.connect(
            host='127.0.0.1',
            port=3306,
            database='maintenancetickets',
            user='root',
            password='fredonia8883'
        )
        if connection.is_connected():
            db_info = connection.get_server_info()
            print("Connected to MySQL database... MySQL Server version on ", db_info)
            cursor = connection.cursor()
            cursor.execute("SELECT DATABASE();")
            record = cursor.fetchone()
            print("You're connected to - ", record)
            cursor.close()
            connection.close()
            print("MySQL connection is closed")
    except Error as e:
        print("Error while connecting to MySQL", e)

if __name__ == "__main__":
    get_db_connection()
