import sys
from flask import Flask
from flask_talisman import Talisman # <--- IMPORTAR TALISMAN
from service import config
from service.common import log_handlers

# Create Flask application
app = Flask(__name__)
app.config.from_object(config)

# CONFIGURACIÓN DE TALISMAN
# Esto añade encabezados de seguridad automáticamente
talisman = Talisman(app)

# Import the routes After the Flask app is created
from service import routes, models  # noqa: F401 E402
from service.common import error_handlers, cli_commands  # noqa: F401 E402

# ... (resto del código de logging e init_db igual)