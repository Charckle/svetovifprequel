# Import flask and template operators
from flask import Flask, render_template
import time

# Import SQLite3
import MySQLdb

# Define the WSGI application object
app = Flask(__name__)

# Configurations
app.config.from_object("config.DevelopmentConfig")

#connection = sqlite3.connect("sqlite:///razor_notes.sqlite3")
sql_host = app.config['DB_HOST']
sql_user = app.config['DB_USERNAME']
sql_passwrd = app.config['DB_PASSWORD']
sql_db = app.config['DB_NAME']

class DB:
    conn = None
  
    def connect(self):
        self.conn = MySQLdb.connect(host = sql_host,
                                      user = sql_user,
                                      passwd = sql_passwrd,
                                      db = sql_db)
  
    def query(self, sql):
        try:
            cursor = self.conn.cursor()
            cursor.execute(sql)
            
        except (AttributeError, MySQLdb.OperationalError):
            self.connect()
            cursor = self.conn.cursor()
            cursor.execute(sql)
            
        return cursor

db = DB()


# Sample HTTP error handling
@app.errorhandler(404)
def not_found(error):
    return render_template('404.html'), 404

@app.route('/robots.txt')
def static_file():
    return app.send_static_file("robots.txt")

# Import a module / component using its blueprint handler variable (mod_auth)
from app.main_page_module.controllers import main_page_module as main_module

# Register blueprint(s)
app.register_blueprint(main_module)
# app.register_blueprint(xyz_module)
# ..

