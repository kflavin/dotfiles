#!/usr/bin/env python
import boto3
from botocore.awsrequest import AWSRequest
import botocore.auth as auth
import urllib.request
import sys

import pprint

profile     = sys.argv[1]
instance_id = sys.argv[2]
region = "us-east-1"

session = boto3.session.Session(profile_name = profile)
credentials = session.get_credentials()
sigv4auth = auth.SigV4Auth(credentials, "rds", region)

rds_client = session.client('rds')
files = rds_client.describe_db_log_files(DBInstanceIdentifier = instance_id)

for file in files["DescribeDBLogFiles"]:
    file_name = file["LogFileName"]

    #Judge download exclusion from file name
    if not file_name.startswith("error/"):
        continue
    if file_name == "error/postgres.log":
        continue

    #downloadCompleteLogFile API URL
    remote_host = "rds." + region + ".amazonaws.com"
    url = "https://" + remote_host + "/v13/downloadCompleteLogFile/" + instance_id + "/" + file_name

    #Sig V4 signature
    awsreq = AWSRequest(method = "GET", url = url)
    sigv4auth.add_auth(awsreq)

    req = urllib.request.Request(url, headers = {
        "Authorization": awsreq.headers['Authorization'],
        "Host": remote_host,
        "X-Amz-Date": awsreq.context['timestamp'],
       })

    #Echo command for download progress
    echo_cmd = "echo '" + file_name + "' >&2"
    print(echo_cmd)

    #curl command
    header = " ".join(["-H '" + k + ": " + v + "'" for (k, v) in req.headers.items()])
    cmd = "curl " + header + " '" + url + "'"
    print(cmd)
