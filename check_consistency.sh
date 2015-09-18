#!/bin/bash

# grep --include="*.tex" "\\ref{[^}]*}" -r -o | sort
# grep --include="*.tex" "\\label{[^}]*}" -r -o | sort


#grep --include="*.tex" "(?<=cite{)[^}]*(?=})" -r -o -h -P | sort -u

grep --include="*.tex" "(?<=label{)[^}]*(?=})" -r -o -h -P | uniq -d
