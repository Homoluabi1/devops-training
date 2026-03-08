#!/usr/bin/env python3

from flask import Flask, jsonify
import redis
import os

app = Flask(__name__)

# Connect to Redis
redis_host = os.environ.get('REDIS_HOST', 'localhost')
r = redis.Redis(host=redis_host, port=6379, decode_responses=True)

@app.route('/')
def home():
    # Increment visit counter in Redis
    visits = r.incr('visit_count')
    return f"""
    <html>
    <body style="font-family: Arial; text-align: center; padding: 50px; background: #0f0f23; color: white;">
        <h1 style="color: #00ff88;">🚀 Full-Stack DevOps App</h1>
        <p>Built by Samuel Olukunle Aribikolasi</p>
        <div style="background: #1a1a3e; padding: 30px; border-radius: 15px; margin: 20px auto; max-width: 500px; border: 1px solid #00ff88;">
            <h2>Total Visits: {visits}</h2>
            <p style="color: #aaa;">Stored in Redis — persists across refreshes!</p>
        </div>
        <div style="background: #1a1a3e; padding: 20px; border-radius: 15px; margin: 20px auto; max-width: 500px;">
            <p>Environment: {os.environ.get('APP_ENV', 'development')}</p>
            <p>Redis Host: {redis_host}</p>
        </div>
    </body>
    </html>
    """

@app.route('/health')
def health():
    try:
        r.ping()
        redis_status = "connected"
    except:
        redis_status = "disconnected"
    
    return jsonify({
        "status": "healthy",
        "redis": redis_status,
        "environment": os.environ.get('APP_ENV', 'development')
    })

@app.route('/reset')
def reset():
    r.set('visit_count', 0)
    return jsonify({"message": "Visit count reset to 0"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=False)
