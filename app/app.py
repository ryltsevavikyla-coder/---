from flask import Flask
import os
import pymysql

app = Flask(__name__)

def db_status():
    host = os.getenv("MYSQL_HOST", "localhost")
    user = os.getenv("MYSQL_USER", "appuser")
    password = os.getenv("MYSQL_PASSWORD", "")
    database = os.getenv("MYSQL_DATABASE", "appdb")
    try:
        conn = pymysql.connect(
            host=host,
            user=user,
            password=password,
            database=database,
            port=3306,
            connect_timeout=5,
        )
        with conn.cursor() as cur:
            cur.execute("SELECT VERSION()")
            version = cur.fetchone()[0]
        conn.close()
        return "OK", version, host
    except Exception as e:
        return f"ERROR: {e}", "-", host

@app.route("/")
def index():
    status, info, host = db_status()
    return f"""
    <h1>Diploma Web App</h1>
    <p>DB status: {status}</p>
    <p>DB info: {info}</p>
    <p>DB host: {host}</p>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)