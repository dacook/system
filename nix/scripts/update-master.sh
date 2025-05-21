#!/bin/bash
# Check out master and run Rails updates (migrations etc)

[[ -z $(git status -s) ]] && git checkout master && git pull && bin/setup || git status -s
