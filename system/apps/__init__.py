from flask import Flask
from flask_wtf import CSRFProtect
from flask_session import Session
from flask_sqlalchemy import SQLAlchemy

from settings import config_map

import logging
from logging.handlers import RotatingFileHandler

import redis
from apps.utils.commons import ReConverter

db = SQLAlchemy()
# csrf = CSRFProtect()
redis_store = None

logging.basicConfig(level=logging.DEBUG)
formatter = logging.Formatter(
    '%(levelname)s %(filename)s:%(lineno)d %(message)s')
file_log_handler = RotatingFileHandler("logs/log",
                                       maxBytes=1024 * 1024 * 100,
                                       backupCount=10)
file_log_handler.setFormatter(formatter)
logging.getLogger().addHandler(file_log_handler)


def create_app(config_name):
    """
    Create a Flask app object.
    :param config_name:str. name of config. ("develop", "product").
    :return:
    """
    app = Flask(__name__,
                template_folder='../templates',
                static_folder='../static')
    config = config_map.get(config_name)
    app.config.from_object(config)  # TODO

    global redis_store
    redis_store = redis.StrictRedis(host=config.REDIS_HOST,
                                    port=config.REDIS_PORT)

    Session(app)

    # CSRFProtect(app)

    app.url_map.converters["re"] = ReConverter

    from . import api_1_0
    app.register_blueprint(api_1_0.api, url_prefix="/api/v1.0")

    from . import web_html
    app.register_blueprint(web_html.html)

    db.init_app(app)

    return app
