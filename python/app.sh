#!/bin/bash

cd /app
echo ${PIP_SOURCES}
pip install -r requirements.txt ${PIP_SOURCES}
/usr/local/bin/python main.py ${0} ${@}