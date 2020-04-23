import redis as r
import filetype
redis = r.Redis()
f = open('chicken.jpg', 'rb')
file_content = f.read()
f.close()
redis.set('binaryfoo', file_content)
binaryfoo = redis.get('binaryfoo')
extension = filetype.guess(binaryfoo)
print (extension.mime)