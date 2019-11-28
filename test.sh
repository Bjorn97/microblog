#!/bin/sh
cd /home/microblog && source venv/bin/activate && make exec-tests && make validate
