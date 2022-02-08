from flask import request, jsonify, current_app

from datetime import datetime
from . import api
from apps import db, redis_store
from ..model import User
from ..utils.response_code import RET
from ..utils.commons import login_required, admin_required
from apps import constants


@api.route("/user/show")
def get_user_profile():
    page = request.args.get("page")
    try:
        page = int(page)
    except Exception as e:
        current_app.logger.error(e)
        page = 1
    try:
        users_page_obj = User.query.paginate(
            page=page,
            per_page=constants.USER_LIST_PAGE_CAPACITY,
            error_out=False)
    except Exception as e:
        current_app.logger.error(e)
        return jsonify(errno=RET.DBERR, error="数据库异常")
    users_list = users_page_obj.items
    users = []
    for user in users_list:
        users.append(user.to_dict())

    total_page_num = users_page_obj.pages

    return jsonify(errno=RET.OK,
                   errmsg="OK",
                   data={
                       "total_page_num": total_page_num,
                       "current_page": page,
                       "users": users
                   })


@api.route("/user/add", methods=["POST"])
def add_user():
    user_info = request.get_json()
    count = user_info.get("count")
    password = user_info.get("password")
    name = user_info.get("name")
    role = user_info.get("role")
    phone = user_info.get("phone")
    email = user_info.get("email")

    if not all([count, password, name, role]):
        return jsonify(errno=RET.PARAMERR, errmsg="参数不完整")

    if role == "管理员":
        permission = False
    else:
        permission = True
    user = User(count=count,
                password=password,
                name=name,
                permission=permission)
    user.generate_password_hash(password)
    if phone:
        user.phone = phone
    if email:
        user.email = email
    try:
        db.session.add(user)
        db.session.commit()
    except Exception as e:
        current_app.logger.error(e)
        db.session.rollback()
        return jsonify(errno=RET.DBERR, errmsg="数据库异常")
    return jsonify(errno=RET.OK, errmsg="成功添加")


@api.route("/user/delete/<int:user_id>", methods=["PUT"])
def delete_user(user_id):
    if not user_id:
        return jsonify(errno=RET.PARAMERR, errmsg="参数缺失")
    try:
        user = User.query.get(user_id)
    except Exception as e:
        current_app.logger.error(e)
        return jsonify(errno=RET.DBERR, errmsg="查询数据失败")
    if not user:
        return jsonify(errno=RET.NODATA, errmsg="用户不存在")
    user.is_delete = True
    db.session.commit()
    return jsonify(errno=RET.OK, errmsg="删除用户成功")


@api.route("/user/state/<int:user_id>", methods=["PUT"])
def changer_user_state(user_id):
    if not user_id:
        return jsonify(errno=RET.PARAMERR, errmsg="参数缺失")
    try:
        user = User.query.get(user_id)
    except Exception as e:
        current_app.logger.error(e)
        return jsonify(errno=RET.DBERR, errmsg="查询数据失败")
    if not user:
        return jsonify(errno=RET.NODATA, errmsg="用户不存在")
    if user.state is True:
        user.state = False
    else:
        user.state is False
    db.session.commit()
    return jsonify(errno=RET.OK, errmsg="修改用户状态成功")


@api.route("/user/search")
def search_users():
    count = request.args.get("uc")
    phone = request.args.get("up")
    state = request.args.get("us")
    page = request.args.get("p")
    try:
        page = int(page)
    except Exception as e:
        current_app.logger.error(e)
        page = 1
    filter_param = []
    if count:
        filter_param.append(User.count == count)
    if phone:
        filter_param.append(User.phone == phone)
    if state:
        filter_param.append(User.state == state)
    try:
        filtered_users = User.query.filter(*filter_param)
    except Exception as e:
        current_app.logger.error(e)
        return jsonify(errno=RET.DBERR, errmsg="数据库异常")
    try:
        page_obj = filtered_users.paginate(
            page=page,
            per_page=constants.USER_LIST_PAGE_CAPACITY,
            error_out=False)
    except Exception as e:
        current_app.logger.error(e)
        return jsonify(errno=RET.DBERR, errmsg="数据库异常")
    user_list = page_obj.items
    users = []
    for user in user_list:
        users.append(user.to_dict())
    total_page_num = page_obj.pages
    return jsonify(errno=RET.OK,
                   errmsg="OK",
                   data={
                       "total_page_num": total_page_num,
                       "current_page": page,
                       "users": users
                   })
