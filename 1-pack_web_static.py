#!/usr/bin/python3
"""Funtion to compress the web_static folder"""
from datetime import datetime
from fabric.api import local
import os


def do_pack():
    """a function to generate the .tgz file"""
    try:
        if not os.path.exists("versions"):
            local('mkdir versions')
        current_date = datetime.now()
        fmt = "%Y%m%d%H%M%S"
        archive_path = 'versions/web_static_{}.tgz'.format(current_date.
                                                           strftime(fmt))
        local('tar -cvzf {} web_static'.format(archive_path))
        return archive_path
    except Exception:
        return None
