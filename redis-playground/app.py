import redis
import json

with open('config.json') as f:
    data = json.load(f)

r = redis.Redis(host=data['host'], port=data['port'])
	
r.set('foo', 'bar')
	
foo = r.get('foo')

print ( 'foo stored in redis and retrieved: ' + foo.decode('ASCII'))