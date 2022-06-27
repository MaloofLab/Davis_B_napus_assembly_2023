#!/bin/bash

## Load required modules

source ~/.bash_profile
module load java/jdk1.8

# Run program

files=`ls reads/*.gz`

canu-1.6 \
	-correct \
	-p B.napus \
	-d B.napus-pacbio \
	correctedErrorRate=0.040 \
	corOutCoverage=200 \
	genomeSize=1.12g \
	gridOptions='--time=2-0' \
	-pacbio-raw ${files}

