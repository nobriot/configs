#!/usr/bin/env sh

x=0; while [ $x -lt $(tput cols) ]; do echo -n '─';let x=$x+1; done;
