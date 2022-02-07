from flask import Blueprint, render_template, make_response
from flask_wtf import csrf

html = Blueprint("web_html", __name__)


@html.route("/<re(r'.*'):html_file_name>")
def get_html(html_file_name):
    if not html_file_name:
        html_file_name = "index.html"
    if html_file_name:
        html_file_name = "/" + html_file_name
    csrf_token = csrf.generate_csrf()
    resp = make_response(render_template(html_file_name))
    resp.set_cookie("csrf_token", csrf_token)
    return resp
