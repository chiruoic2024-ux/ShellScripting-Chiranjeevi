#!/bin/bash

set -e

error()
{
    echo "There is an error"
}
trap error ERR   #trap is a command calling error function with ERR signal, we can also write echo with trap
echo "Hello"
echo "Before error"
jkajdskjklsjdklj  # Here Shell understands that there is an error and the signal is ERR
ajkdjsjkdfsjdjk
echo "After error"
