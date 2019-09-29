#!/bin/bash
pipenv shell
xvfb-run -a -s "-screen 0 128x128x24" -- python main.py
