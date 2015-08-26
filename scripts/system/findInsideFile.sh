#!/bin/bash

echo "word to find:"
read word

echo "location"
read location


grep -rnwi $location -e "$word"
