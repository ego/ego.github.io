#!/bin/bash
set -o errexit

next_boot() {
    cat << EOT
========================================
Ego Hugo NexT version $1
========================================
EOT
}

next_boot `cat themes/hugo-theme-next/VERSION`

# First time update
# git submodule update --init --recursive
# Next time update
set -o verbose
git submodule update --remote --merge
