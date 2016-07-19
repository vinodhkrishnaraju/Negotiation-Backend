class Config(object):
    DEBUG = False
    TESTING = False
    # DATABASE_URI = 'sqlite://:memory:'


class DevelopmentConfig(Config):
    user = 'negotiate'
    passwd = 'negotiate123'
    db = 'negotiate_db'
    host = 'localhost'
    # DATABASE_URI = 'mysql://user@localhost/foo'