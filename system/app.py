from flask_migrate import Migrate
from flask_script import Manager
from apps import create_app, db

app = create_app("develop")
migrate = Migrate(app, db)
manager = Manager(app)

if __name__ == "__main__":
    # app.run()
    app.run(host='0.0.0.0')
