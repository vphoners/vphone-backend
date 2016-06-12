#!/usr/bin/env python3

import redis
from flask import Flask, jsonify, request, make_response

app = Flask(__name__)
r_server = redis.Redis("redis", decode_responses=True)

@app.route('/')
def index():
    return "Running vphone-history service"

@app.route('/users', methods=['GET'])
def list_users():
    return jsonify({'users': r_server.lrange('users', 0, -1)})

@app.route('/users/<user_id>/conversations/', methods=['GET'])
def list_conversations(user_id):
    return jsonify({'conversations':
                    r_server.zrange(conversations_key(user_id), 0, -1)
                    })


@app.route('/users/<user_id>/conversations/<conversation_id>/messages/', methods=['GET'])
def list_messages(user_id, conversation_id):
    return jsonify({'messages':
                    r_server.lrange(messages_key(user_id, conversation_id), 0, -1)
                    })

@app.route('/users/<user_id>/conversations/<conversation_id>/messages/', methods=['POST'])
def log_message(user_id, conversation_id):
    required = ['contents', 'timestamp', 'author']
    if not request.json or \
        not all(k in request.json for k in required):
        return make_response(jsonify({"error": "missing either of %s in request"%required}), 400)
    timestamp = request.json['timestamp']
    msg = {
            'timestamp': timestamp,
            'author': request.json['author'],
            'contents': request.json['contents'],
            'conversation_id': conversation_id
        }
    r_server.zadd(conversations_key(user_id), conversation_id, timestamp)
    r_server.rpush(messages_key(user_id, conversation_id), msg)
    return make_response('', 201)

def messages_key(user_id, conversation_id):
    return "%s:%s:messages"%(conversations_key(user_id), conversation_id)

def conversations_key(user_id):
    return "users:%s:conversations"%(user_id)

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
