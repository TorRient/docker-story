from typing import List, Dict
import mysql.connector
import json
import os

from app import app

def favorite_colors() -> List[Dict]:
    config = {
        'user': 'root',
        'password': "root",
        'host': 'db',
        'port': 3306,
        'database': 'knights'
    }
    connection = mysql.connector.connect(**config)
    cursor = connection.cursor()
    cursor.execute('SELECT * FROM favorite_colors')
    results = [{name: color} for (name, color) in cursor]
    cursor.close()
    connection.close()

    return results


@app.route("/")
def index():

    # Use os.getenv("key") to get environment variables
    app_name = os.getenv("APP_NAME")
    return f"Welcome to {app_name}"


@app.route('/db')
def index_db() -> str:
    app_name = os.getenv("APP_NAME")
    return json.dumps({'favorite_colors': favorite_colors(), "Service": app_name})