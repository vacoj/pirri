from functools import wraps
from flask import request, Response
import data.config as config
import newrelic.agent

@newrelic.agent.background_task()
def check_auth(username, password):
    """This function is called to check if a username /
    password combination is valid.
    """
    return username.lower() == config.LOGINUSER and password == config.LOGINPASS


def authenticate():
    """Sends a 401 response that enables basic auth"""
    return Response(
        'Could not verify your access level for that URL.\n'
        'You have to login with proper credentials', 401,
        {'WWW-Authenticate': 'Basic realm="Login Required"'})


@newrelic.agent.background_task()
def requires_auth(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        auth = request.authorization
        if not auth or not check_auth(auth.username, auth.password):
            return authenticate()
        return f(*args, **kwargs)
    return decorated
