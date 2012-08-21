#!/bin/sh -eu

find . -name \*.pp | xargs -n1 puppet parser validate

echo "Done"
