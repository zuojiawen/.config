from werkzeug.routing import BaseConverter
import functools
from flask import session, jsonify, g
from apps.utils.response_code import RET


class ReConverter(BaseConverter):

    def __init__(self, url_map, regex):
        super(ReConverter, self).__init__(url_map)
        self.regex = regex


def login_required(view_func):

    @functools.wraps(view_func)
    def wrapper(*args, **kwargs):
        user_id = session.get("user_id")
        if user_id is not None:
            g.user_id = user_id
            return view_func(*args, **kwargs)
        else:
            return jsonify(errno=RET.SESSIONERR, errmsg="用户未登录")

    return wrapper


def admin_required(view_func):

    @functools.wraps(view_func)
    def wrapper(*args, **kwargs):
        user_id = g.user_id
        from ..model import User
        u = User.query.get(user_id)
        if u.permission == 0:
            return view_func(*args, **kwargs)
        else:
            return jsonify(errno=RET.SESSIONERR, errmsg="您的权限不足，不能执行此操作")

    return wrapper
