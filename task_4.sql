#!/usr/bin/python3
"""
Script that prints the full description of the table `Books`
from the database `alx_book_store`.
The database name will be passed as an argument to the script.
"""

import sys
import MySQLdb

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: {} <mysql_username> <mysql_password> <database_name>".format(sys.argv[0]))
        sys.exit(1)

    username = sys.argv[1]
    password = sys.argv[2]
    db_name = sys.argv[3]

    try:
        # Connect to MySQL server
        db = MySQLdb.connect(host="localhost", user=username, passwd=password, db=db_name)
        cursor = db.cursor()

        # Query INFORMATION_SCHEMA to get full description of `Books`
        query = """
        SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_KEY, COLUMN_DEFAULT, EXTRA
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = %s AND TABLE_NAME = 'Books';
        """
        cursor.execute(query, (db_name,))
        rows = cursor.fetchall()

        # Print results in a readable format
        print("Full description of `Books` table:")
        for row in rows:
            print(row)

        cursor.close()
        db.close()

    except MySQLdb.Error as e:
        print("MySQL Error:", e)
        sys.exit(1)
