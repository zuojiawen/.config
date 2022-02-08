from flask import Blueprint

api = Blueprint("api_1_0", __name__)
from . import passport
from . import home
from . import user_manage, log_manage
