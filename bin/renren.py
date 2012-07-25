#!/usr/bin/env python
#encoding=utf-8

#
# 核心思想：整个过程就是模拟人的登录和访问过程
#
import urllib, urllib2, cookielib, json, time, hashlib, re, sys

class  Renren(object):

    def __init__(self,email,password):
        self.email=email
        self.password=password
        # 人人网的登录主页
        self.origURL='http://www.renren.com/Home.do'
        #self.origURL='http://apps.renren.com/happyfarm/'
        self.domain='renren.com'
        # 如果有本地cookie，登录时无需验证。
        self.cj = cookielib.LWPCookieJar()
        try:
            self.cj.revert('renren,cookie')
        except:
            None
        self.opener = urllib2.build_opener(urllib2.HTTPCookieProcessor(self.cj))
        urllib2.install_opener(self.opener)

    def login(self):
        """模拟登录"""
        # 通过查看renren页面源码，找到要填充的变量，如下面的'email', 'password'等
        params = {'email':self.email,'password':self.password,'origURL':self.origURL,'domain':self.domain}
        # 进行编码，并请求
        req = urllib2.Request(
            'http://www.renren.com/PLogin.do',
            #'http://www.renren.com/',
            urllib.urlencode(params)
        )
        r = self.opener.open(req)

    def status(self, status):
        #发布状态
        params = {'content':status, 'hostid':'222785680', 'channel':'renren'}
        # 进行编码，并请求
        req = urllib2.Request(
            'http://shell.renren.com/222785680/status',
            urllib.urlencode(params)
        )
        r=self.opener.open(req)
        print r.read()

if __name__ == "__main__":
    a=Renren(sys.argv[1], sys.argv[2])
    print "%s %s" % (sys.argv[1], sys.argv[2])
    a.login()
    a.status(sys.argv[3])
    print "%s" % (sys.argv[3])
