#!/usr/bin/python
import json,sys

obj=json.load(sys.stdin)

#print "####"
#print obj[0]['username']
#print obj[0]['state']

returnStr=''
for item in obj:
  if item['state'] == 'active':
    returnStr += str(item['username'])+' '
print(returnStr)
