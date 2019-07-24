#!/usr/bin/env bash

set -e

OUTPUT=./pdf_out
mkdir -p $OUTPUT

find Prologue Chapter* -name "*.ipynb" | grep -v "PyMC2" | xargs jupyter nbconvert --to pdf --template article --output-dir $OUTPUT

# merge all files:
pdfjoin $OUTPUT/Prologue.pdf $OUTPUT/Ch*.pdf $OUTPUT/DontOverfit.pdf $OUTPUT/MachineLearning.pdf -o $OUTPUT/ppbmh-$(cat .git/refs/heads/master).pdf
