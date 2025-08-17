#!/usr/bin/python3
"""
task_5.py - Insert a single row into the customers table in alx_book_store.
"""

import sys
import mysql.connector

def main():
    if len(sys.argv) != 4:
        print("Usage: ./task_5.py <user> <password> <database>")
        sys.exit(1)

    user = sys.argv[1]
    password = sys.argv[2]
    database = sys.argv[3]

    try:
        # Connect to the database
        conn = mysql.connector.connect(
            host="localhost",
            user=user,
            password=password,
            database=database
        )
        cursor = conn.cursor()

        # Insert single row
        insert_query = """
        INSERT INTO customers (customer_id, customer_name, email, address)
        VALUES (%s, %s, %s, %s)
        """
        values = (1, "Cole Baidoo", "cbaidoo@sandtech.com", "123 Happiness Ave.")

        cursor.execute(insert_query, values)
        conn.commit()

        print("✅ Row inserted successfully into customers table.")

    except mysql.connector.Error as err:
        print(f"❌ Error: {err}")
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()

if __name__ == "__main__":
    main()
