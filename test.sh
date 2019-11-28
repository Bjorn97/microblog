#!/bin/sh
source venv/bin/activate && make exec-tests && make validate
