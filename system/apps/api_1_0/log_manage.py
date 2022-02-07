from flask import request, jsonify, current_app

from datetime import datetime
from . import api
from apps import db, redis_store
from ..model import Logs, User
from ..utils.response_code import RET
from ..utils.commons import login_required, admin_required
from apps import constants


@api.route("/log/show")
def get_log():
    page = request.args.get("page")
    try:
        page = int(page)
    except Exception as e:
        current_app.logger.error(e)
        page = 1
    try:
        logs_page_obj = Logs.query.order_by(Logs.method_time.desc()).paginate(
            page=page,
            per_page=constants.LOG_LIST_PAGE_CAPACITY,
            error_out=False)
    except Exception as e:
        current_app.logger.error(e)
        return jsonify(errno=RET.DBERR, error="数fds库异常")
    logs_list = logs_page_obj.items
    logs = []
    for log in logs_list:
        logs.append(log.to_dict())

    total_page_num = logs_page_obj.pages

    return jsonify(errno=RET.OK,
                   errmsg="OK",
                   data={
                       "total_page_num": total_page_num,
                       "current_page": page,
                       "logs": logs
                   })


@api.route("/log/search")
def search_logs():
    start_date = request.args.get("sd")
    end_date = request.args.get("ed")
    page = request.args.get("p")
    try:
        if start_date:
            start_date = datetime.strptime(start_date, "%Y-%m-%d")
        if end_date:
            end_date = datetime.strptime(end_date, "%Y-%m-%d")
        if start_date and end_date:
            assert start_date <= end_date
    except Exception as e:
        current_app.logger.error(e)
        return jsonify(errno=RET.PARAMERR, errmsg="日期格式有误")
    try:
        page = int(page)
    except Exception as e:
        current_app.logger.error(e)
        page = 1
    filter_param = []
    if start_date and end_date:
        filter_param.append(Logs.method_time <= end_date)
        filter_param.append(Logs.method_time >= start_date)
    elif start_date:
        filter_param.append(Logs.method_time >= start_date)
    elif end_date:
        filter_param.append(Logs.method_time <= end_date)
    try:
        filtered_logs = Logs.query.filter(*filter_param).order_by(
            Logs.method_time.desc())
    except Exception as e:
        current_app.logger.error(e)
        return jsonify(errno=RET.DBERR, errmsg="数据库异常")
    try:
        page_obj = filtered_logs.paginate(
            page=page,
            per_page=constants.LOG_LIST_PAGE_CAPACITY,
            error_out=False)
    except Exception as e:
        current_app.logger.error(e)
        return jsonify(errno=RET.DBERR, errmsg="数据库异常")
    log_list = page_obj.items
    logs = []
    for log in log_list:
        logs.append(log.to_dict())
    total_page_num = page_obj.pages
    return jsonify(errno=RET.OK,
                   errmsg="OK",
                   data={
                       "total_page_num": total_page_num,
                       "current_page": page,
                       "logs": logs
                   })
