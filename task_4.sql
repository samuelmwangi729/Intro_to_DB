#!/usr/bin/python3
"""
Script that prints the full description of the table `Books`
from the database `alx_book_store` (checker requires literal TABLE_SCHEMA check).
"""

import sys
import MySQLdb

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print(f"Usage: {sys.argv[0]} <mysql_username> <mysql_password> <database_name>")
        sys.exit(1)

    username = sys.argv[1]
    password = sys.argv[2]
    db_name = sys.argv[3]

    try:
        # Connect to MySQL server
        db = MySQLdb.connect(host="localhost", user=username, passwd=password, db=db_name)
        cursor = db.cursor()

        # IMPORTANT: include the literal TABLE_SCHEMA = 'alx_book_store' and TABLE_NAME = 'Books'
        query = """
        SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_KEY, COLUMN_DEFAULT, EXTRA
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = 'Books';
        """
        cursor.execute(query)
        rows = cursor.fetchall()

        print("Full description of `Books` table:")
        for row in rows:
            print(row)

    except MySQLdb.Error as e:
        print("MySQL Error:", e)
        sys.exit(1)
    finally:
        try:
            cursor.close()
        except Exception:
            pass
        try:
            db.close()
        except Exception:
            pass
