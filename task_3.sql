import mysql.connector
from mysql.connector import Error

def list_tables():
    connection = None
    cursor = None
    try:
        # Connect to MySQL server (update credentials if needed)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",         # change to your MySQL username
            password="password", # change to your MySQL password
            database="alx_book_store"
        )

        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("SHOW TABLES;")
            tables = cursor.fetchall()

            print("Tables in 'alx_book_store':")
            for table in tables:
                print(table[0])

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        if cursor:
            cursor.close()
        if connection and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    list_tables()
