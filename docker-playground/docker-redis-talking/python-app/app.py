import threading
import redis
import sys
import time

def doStuff(hostAddress, port, id, heartbeatInterval):
	threading.Timer(float(heartbeatInterval), doStuff, [hostAddress, port, id, heartbeatInterval]).start()
	r = redis.Redis(host=hostAddress, port=int(port))
	print r.ping()
	r.zadd("heartbeat", id, time.time())
	print id
	sys.stdout.flush()

if __name__ == "__main__":
	print sys.argv
	doStuff(*sys.argv[1:])