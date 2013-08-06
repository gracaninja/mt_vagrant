'''
Created on Aug 6, 2013

@author: graca
'''


import xmlrpclib
import datetime

url = "http://localhost:8081/RPC2"
proxy = xmlrpclib.ServerProxy(url)

text = u"das ist ein kleines haus"
params = {"text":text, "align":"true", "report-all-factors":"true"}

result = proxy.translate(params)
print result['text']
if 'align' in result:
    print "Phrase alignments:"
    aligns = result['align']
    for align in aligns:
        print "%s,%s,%s" %(align['tgt-start'], align['src-start'], align['src-end'])


