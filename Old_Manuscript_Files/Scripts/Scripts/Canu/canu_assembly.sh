#!/bin/bash

## Load required modules

source ~/.bash_profile
module load java/jdk1.8

# Run program

canu-1.6 \
        -assemble \
        -p B.napus \
        -d B.napus-pacbio \
        genomeSize=1.12g \
	correctedErrorRate=0.040 \
	gridOptions='--time=2-0' \
        gridOptionsBAT='--mem-per-cpu=9000m' \
	-pacbio-corrected B.napus-pacbio/B.napus.trimmedReads.fasta.gz

