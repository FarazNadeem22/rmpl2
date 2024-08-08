# Setting Up the Development Environment

This guide outlines how to set up a Python virtual environment for the Ticket System project, and how to activate, deactivate, and install dependencies.

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

## Dependencies

All dependencies are listed in the `requirements.txt` file. Make sure to update this file if you install any new packages.

```plaintext
Flask==2.0.3
mysql-connector-python==8.0.28
