#!/usr/bin/env python
# -*- coding: utf-8 -*-
# From: https://github.com/greut/invenio-docker/blob/master/test/travis.py

from __future__ import unicode_literals, print_function

import sys
import yaml
import subprocess


def main(argv):
    action = argv[1]
    filename = ".drone.yml"
    if len(argv) > 2:
        filename = argv[2]

    with open(filename, "r") as f:
        travis = yaml.load(f)

    for cmd in travis.get(action, []):
        print("{0}> {1}".format(action, cmd), file=sys.stderr)
        status = subprocess.call(cmd, shell=True)
        if status:
            return status


if __name__ == "__main__":
    try:
        sys.exit(main(sys.argv))
    except Exception:
        import traceback
        traceback.print_exc(file=sys.stderr)
        sys.exit(1)
