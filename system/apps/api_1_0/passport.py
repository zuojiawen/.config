from flask import request, jsonify, session, current_app

from datetime import datetime
from . import api
from apps import db, redis_store
from ..model import User, Logs
from ..utils.response_code import RET
from apps import constants


@api.route("/session", methods=["POST"])
def login():
    req_dict = request.get_json()
    count = req_dict.get("count")
    password = req_dict.get("password")
    if not all([count, password]):
        return jsonify(errno=RET.PARAMERR, errmsg="帐号或密码为空")
    user_ip = request.remote_addr
    try:
        access_nums = redis_store.get("access_nums_%s" % user_ip)
    except Exception as e:
        current_app.logger.error(e)
    else:
        if access_nums is not None and int(
                access_nums) >= constants.LOGIN_ERROR_MAX_TIMES:
            return jsonify(errno=RET.REQERR, errmsg="密码错误次数过多，请5分钟后重试")
    try:
        user = User.query.filter_by(count=count).first()
    except Exception as e:
        current_app.logger.error(e)
        return jsonify(errno=RET.DBERR, errmsg="获取用户信息失败")

    if user is None or not user.check_password(
            password) or user.state == 0 or user.is_delete is True:
        try:
            redis_store.incr("access_nums_%s" % user_ip)
            redis_store.expire("access_nums_%s" % user_ip,
                               constants.LOGIN_ERROR_FORBID_TIME)
        except Exception as e:
            current_app.logger.error(e)
        return jsonify(errno=RET.DATAERR, errmsg="用户名或密码错误")

    session["name"] = user.name
    session["count"] = user.count
    session["user_id"] = user.id
    user.login_ip = user_ip
    user.login_time = datetime.now()
    log = Logs()
    log.user_id = user.id
    log.login_ip = request.remote_addr
    log.method_info = "UserLogin: Count=    ,"
    log.methods_type_id = 1
    db.session.add(log)
    db.session.commit()
    return jsonify(errno=RET.OK, errmsg="登陆成功")


@api.route("/session", methods=["GET"])
def check_login():
    name = session.get("name")
    if name is not None:
        return jsonify(errno=RET.OK, errmsg="true", data={"name": name})
    else:
        return jsonify(errno=RET.SESSIONERR, errmsg="false")


@api.route("/session", methods=["DELETE"])
def logout():
    session.clear()
    return jsonify(errno=RET.OK, errmsg="OK")


@api.route("/test")
def test():
    return "hello"
