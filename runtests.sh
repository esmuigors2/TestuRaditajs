#!/bin/bash

for un in $(ls -v test*.sh | grep -v test0.sh); do
    ./${un} && echo -e "$un\t:\tyes" || echo -e "$un\t:\tno"
done
