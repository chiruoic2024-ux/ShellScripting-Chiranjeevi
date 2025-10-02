#!/bin/bash

set -e

# error()
# {
#     echo "There is an error"
# }
trap echo "Thre is a error in $LINENO and command is $BASH_COMMAND" ERR
echo "Hello"
echo "Before error"
jkajdskjklsjdklj  # Here Shell understands that there is an error and the signal is ERR
ajkdjsjkdfsjdjk
echo "After error"
