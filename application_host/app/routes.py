import socket
import datetime
from flask import render_template, jsonify
from app import app

@app.route('/', methods=['GET'])
def index():
  return render_template('index.html')

@app.route('/ip', methods=['GET'])
def get_ip():
  ip_address = socket.gethostbyname(socket.gethostname())
  return render_template('resource.html', resource='ip', value=ip_address)

@app.route('/time', methods=['GET'])
def get_time():
  time = str(datetime.datetime.now())
  return render_template('resource.html', resource='time', value=time)

@app.route('/api/ip', methods=['GET'])
def api_ip():
  obj = {
    'ip_address' : socket.gethostbyname(socket.gethostname())
  }
  return jsonify(obj)

@app.route('/api/time', methods=['GET'])
def api_time():
  obj = {
    'time' : str(datetime.datetime.now())
  }
  return jsonify(obj)