#!/usr/bin/env bash

PYTHON_ENV=$1

python3 -m venv /opt/#PYTHON_ENV \
        && export PATH=/opt/$PYTHON_ENV/bin:$PATH \
        && echo "source /opt/$PYTHON_ENV/bin/activate" >> ~/.bashrc

source /opt/$PYTHON_ENV/bin/activate

pip3 install -r ./requirements/requirements.txt
