import redis
import json

with open('config.json') as f:
    data = json.load(f)

r = redis.Redis(host=data['host'], port=data['port'])

def main():
        
    r.set('foo', 'bar')
    r.set('foo', 'bunny')
        
    foo = r.get('foo')

    print ( 'foo stored in redis and retrieved: ' + foo.decode('ASCII'))

def binarystore():
    f = open('chicken.jpg', 'rb')
    file_content = f.read()
    f.close()

    r.set('binaryfoo', file_content)
    print(file_content)

def binaryread():
    binaryfoo = r.get('binaryfoo')

    with open("binaryfoo.jpg", 'wb') as f:
        f.write(binaryfoo)

if __name__ == "__main__":
    binarystore()
    binaryread()