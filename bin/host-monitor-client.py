#!/usr/bin/env python
# encoding: utf-8

import os, sys
import argparse
import requests

if __name__ == '__main__':
    parser = argparse.ArgumentParser(
            prog='host-monitor-client.py',
            description='host-monitor client, ENV Variable: "HOST_MONITOR_URI=http://api.domain.com/"')
    parser.add_argument('-n', '--name', required=True, help='name of host')
    args = vars(parser.parse_args())

    if 'HOST_MONITOR_URI' not in os.environ:
        parser.print_help()
        exit(-1)

    host_monitor_uri = os.environ['HOST_MONITOR_URI']
    host_name = args['name']

    request_url = host_monitor_uri + args['name'] + '/'
    response = requests.get(request_url).json()
    print(response['ip'])
