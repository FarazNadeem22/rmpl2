# RMPL Project Setup Guide

This guide outlines how to set up a Python virtual environment for the RMPL project, and how to activate, deactivate, and install dependencies.

## Creating the Virtual Environment

1. **Navigate to the project directory**:
   
    ```sh
    cd path/to/your/project
    ```

2. **Create a virtual environment**:

    ```sh
    python -m venv rmpl
    ```

## Activating the Virtual Environment

- On **Windows**:

    ```sh
    rmpl\Scripts\activate
    ```

- On **macOS/Linux**:

    ```sh
    source rmpl/bin/activate
    ```

## Installing Dependencies

1. **Ensure the virtual environment is activated**.
2. **Install the required dependencies**:

    ```sh
    pip install -r requirements.txt
    ```

## Deactivating the Virtual Environment

- To deactivate the virtual environment, simply run:

    ```sh
    deactivate
    ```

## Testing the Database Connection

1. **Create a file named `connectionDriver.py` with the following content**:

    ```python
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
    ```

2. **Run the test script**:

    ```sh
    python connectionDriver.py
    ```

## Dependencies

All dependencies are listed in the `requirements.txt` file.

```plaintext
Flask==2.0.3
mysql-connector-python==8.0.28
