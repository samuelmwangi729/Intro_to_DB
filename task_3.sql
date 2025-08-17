import mysql.connector
from mysql.connector import Error

def list_tables():
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
            cursor.execute("USE alx_book_store;")  # Explicitly select DB
            cursor.execute("SHOW TABLES;")
            tables = cursor.fetchall()

            if tables:
                print("Tables in 'alx_book_store':")
                for (table_name,) in tables:
                    print(f"- {table_name}")
            else:
                print("No tables found in 'alx_book_store'.")

    except Error as e:
        print(f"❌ Error while connecting to MySQL: {e}")

    finally:
        if connection and connection.is_connected():
            if 'cursor' in locals() and cursor:
                cursor.close()
            connection.close()

if __name__ == "__main__":
    list_tables()
