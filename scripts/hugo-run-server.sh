#!/bin/bash

next_boot() {
    cat << EOT
========================================
Hugo NexT version $1
========================================
EOT
}

next_boot `cat themes/hugo-theme-next/VERSION`

hugo server --port 1414 --buildDrafts --buildFuture
