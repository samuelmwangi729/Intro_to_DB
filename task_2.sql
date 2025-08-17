#!/usr/bin/python3
"""
Script that lists all databases in a MySQL server
"""

import mysql.connector
import sys

if __name__ == "__main__":
    try:
        conn = mysql.connector.connect(
            host="localhost",
            user=sys.argv[1],
            password=sys.argv[2],
            port=3306
        )
        cursor = conn.cursor()
        cursor.execute("SHOW DATABASES;")
        for db in cursor:
            print(db[0])
        cursor.close()
        conn.close()

    except mysql.connector.Error as err:
        print("Error: {}".format(err))
