#!/bin/bash

grep --include="*.tex" "\\ref{[^}]*}" -r -o | sort
grep --include="*.tex" "\\label{[^}]*}" -r -o | sort
