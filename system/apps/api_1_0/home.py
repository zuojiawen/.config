from flask import request, jsonify, session, current_app

from datetime import datetime
from . import api
from apps import db, redis_store
from ..model import WindWarningRecords
from ..utils.response_code import RET
from ..utils.commons import login_required
from apps import constants


@api.route("/warning")
@login_required
def get_warning_records():
    try:
        warning_list = WindWarningRecords.query.all()
    except Exception as e:
        current_app.logger.error(e)
        return jsonify(errno=RET.DBERR, errmsg="数据库异常")
    warning_dict_list = []
    for warning in warning_list:
        warning_dict_list.append(warning.to_dict())
    return jsonify(errno=RET.OK, errmsg="OK", data=warning_dict_list)
