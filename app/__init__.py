# Import flask and template operators
from flask import Flask, render_template

# Import SQLite3
import MySQLdb

# Define the WSGI application object
app = Flask(__name__)

# Configurations
app.config.from_object("config.DevelopmentConfig")

#connection = sqlite3.connect("sqlite:///razor_notes.sqlite3")
connection = MySQLdb.connect (host = app.config['DB_HOST'],
                              user = app.config['DB_USERNAME'],
                              passwd = app.config['DB_PASSWORD'],
                              db = app.config['DB_NAME'])
while True:
    try:
        cursor = connection.cursor()
        break
    
    except:
        pass

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

