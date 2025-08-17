#!/usr/bin/python3
"""
Script to insert multiple rows into the customer table
in the alx_book_store database.
"""

import MySQLdb
import sys

if __name__ == "__main__":
    # Database name passed as argument
    if len(sys.argv) < 2:
        print("Usage: ./task_6.py <database_name>")
        sys.exit(1)

    db_name = sys.argv[1]

    # Connect to MySQL
    db = MySQLdb.connect(
        host="localhost",
        user="root",       # change if your MySQL username is different
        passwd="",         # add password if needed
        db=db_name
    )

    cur = db.cursor()

    # Insert multiple rows
    sql = """
    INSERT INTO customer (customer_id, customer_name, email, address)
    VALUES
    (2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness Ave.'),
    (3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness Ave.'),
    (4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness Ave.');
    """

    try:
        cur.execute(sql)
        db.commit()
        print("Rows inserted successfully.")
    except Exception as e:
        db.rollback()
        print("Error inserting rows:", e)

    cur.close()
    db.close()
