# app.py - a minimal flask api using flask_restful
from flask import Flask
from flask import request
from flask_restful import Resource, Api
from ddtrace import config, tracer
config.requests['trace_query_string'] = True

app = Flask(__name__)
api = Api(app)

class HelloWorld(Resource):
    def get(self):
        return {'hello': 'world'}

api.add_resource(HelloWorld, '/')

# Example URL: http://localhost:5000/Parameters?param1=myfirstparam&param2=86329893
class Param(Resource):
    def get(self):
        # Get the active span
        current_span = tracer.current_span()
        if current_span:
            current_span.set_tags{
                'param1': request.args.get('param1'),
                'param2': request.args.get('param2'),
            }
        return {request.args.get('param1'): request.args.get('param2')}

api.add_resource(Param, '/Parameters')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
