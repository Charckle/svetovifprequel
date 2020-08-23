import sys
from os import environ 


class Config(object):
    DEBUG = False
    TESTING = False
    SECRET_KEY = "B\xb2?.\xdf\x9f\xa7m\xf8\x8a%,\xf7\xc4\xfa\x91"

    IMAGE_UPLOADS = "/home/username/app/app/static/images/uploads"

    SESSION_COOKIE_SECURE = True

    # Application threads. A common general assumption is
    # using 2 per available processor cores - to handle
    # incoming requests using one and performing background
    # operations using the other.
    THREADS_PER_PAGE = 2
    
    # Enable protection agains *Cross-site Request Forgery (CSRF)*
    CSRF_ENABLED     = True
    
class ProductionConfig(Config):
    try:  
        DB_HOST = environ['DB_HOST']
        DB_NAME = environ['DB_NAME']
        DB_USERNAME = environ['DB_USERNAME']
        DB_PASSWORD = environ['DB_PASSWORD']
        
    except KeyError: 
        print("Please set the environment variables")
        #sys.exit(1)    

class DevelopmentConfig(Config):
    DEBUG = True

    DB_HOST = "127.0.0.1"
    DB_NAME = "svetovidprequel"
    DB_USERNAME = "root"
    DB_PASSWORD = ""

    SESSION_COOKIE_SECURE = False

class TestingConfig(Config):
    TESTING = True

    DB_HOST = "127.0.0.1"
    DB_NAME = "svetovidprequel"
    DB_USERNAME = "root"
    DB_PASSWORD = ""

    SESSION_COOKIE_SECURE = False