from apps import db
from datetime import datetime
from werkzeug.security import generate_password_hash, check_password_hash


class MethodsType(db.Model):
    __tablename__ = 'methods_type'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    type = db.Column(db.String(255), unique=True)
    logs = db.relationship('Logs', backref='method_type')


class User(db.Model):
    __tablename__ = 'user'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    count = db.Column(db.String(255), unique=True, nullable=False)
    name = db.Column(db.String(255), unique=True, nullable=False)
    password = db.Column(db.String(255), nullable=False)
    sex = db.Column(db.Integer, default=2)
    permission = db.Column(db.Boolean, default=True)
    age = db.Column(db.Integer)
    email = db.Column(db.String(255))
    phone = db.Column(db.String(255))
    zc_ip = db.Column(db.String(255))
    zctime = db.Column(db.DateTime, default=datetime.now)
    thumb = db.Column(db.String(255))
    login_ip = db.Column(db.String(255))
    login_time = db.Column(db.DateTime,
                           default=datetime.now,
                           onupdate=datetime.now)
    is_delete = db.Column(db.Boolean, default=False)
    miss_number = db.Column(db.Integer, default=0)
    miss_time = db.Column(db.DateTime)
    miss_flag = db.Column(db.Boolean, default=0)
    state = db.Column(db.Boolean, default=True)
    logs = db.relationship('Logs', backref='user')

    # @property
    # def password(self):
    # return AttributeError("The password is a readonly attribute")

    # @password.setter
    # def password(self, value):
    # self.password = generate_password_hash(value)

    def generate_password_hash(self, origin_password):
        self.password = generate_password_hash(origin_password)

    def check_password(self, passwd):
        return check_password_hash(self.password, passwd)

    def to_dict(self):
        if self.state == 0:
            state = "禁用"
        else:
            state = "启用"
        if self.permission == 0:
            role = "管理员"
        else:
            role = "普通用户"
        user_info = {
            "user_id": self.id,
            "count": self.count,
            "name": self.name,
            "role": role,
            "phone": self.phone,
            "email": self.email,
            "state": state
        }
        return user_info


class Logs(db.Model):
    __tablename__ = 'logs'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(db.Integer, db.ForeignKey(User.id))
    login_ip = db.Column(db.String(255))
    method_info = db.Column(db.String(255))
    method_time = db.Column(db.DateTime, default=datetime.now)
    method_type_id = db.Column(db.Integer, db.ForeignKey(MethodsType.id))

    def to_dict(self):
        log = {
            "log_id": self.id,
            "count": self.user.count,
            "name": self.user.name,
            "login_ip": self.login_ip,
            "method_info": self.method_info,
            "method_time": self.method_time,
            "methods_type": self.method_type.type
        }
        return log


class WindTurbines(db.Model):
    __tablename__ = 'wind_turbines'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(255), nullable=False)
    number = db.Column(db.Integer, nullable=False)
    latitude = db.Column(db.Float)
    longitude = db.Column(db.Float)
    state = db.Column(db.Boolean, nullable=False)
    warning_records = db.relationship('WindWarningRecords',
                                      backref='wind_turbines')


class WindWarningType(db.Model):
    __tablename__ = 'wind_warning_type'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(255), nullable=False)
    warning_records = db.relationship('WindWarningRecords',
                                      backref='wind_warning_type')


class WindWarningRecords(db.Model):
    __tablename__ = 'wind_warning_records'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    w_t_id = db.Column(db.Integer,
                       db.ForeignKey(WindTurbines.id),
                       nullable=False)
    w_w_t_id = db.Column(db.Integer, db.ForeignKey(WindWarningType.id))
    warning_time = db.Column(db.DateTime, default=datetime.now)
    warning_data = db.Column(db.String(255))

    def to_dict(self):
        d = {
            "warning_records_id": self.id,
            "wind_turbine_name": self.wind_turbines.name,
            "wind_warning_type": self.wind_warning_type.name,
            "warning_time": self.warning_time,
            "warning_data": self.warning_data
        }
        return d
