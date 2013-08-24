'''
Created on Aug 6, 2013

@author: graca
'''


import xmlrpclib
import datetime


class MosesXmlRpcClient(object):

    def __init__(self):
        self.url = url = "http://localhost:8081/RPC2"
        self.proxy = xmlrpclib.ServerProxy(url)

    def send_translation(self,text):
        ''' 
            Sends text to be transalted to moses
        '''
        
        params = {"text":text, 
                  "align":"true", 
                  #"sg":"true",
                  "nbest-distinct":"true",
                  }
        result = self.proxy.translate(params)
        return result
    
        
        
def main():
    text = u"das ist ein kleines haus"
    cli = MosesXmlRpcClient()
    res = cli.send_translation(text)


