#!/bin/bash

module load samtools/1.4.1

base=Raw_Sequence/Brassica/Da-Ae_Brassica_napus

echo "Starting"
samtools bam2fq -@ 10 ${base}/r54048_20170713_221759/B1/2_B01_Primary/m54048_170714_084938.subreads.bam > m54048_170714_084938.subreads.fq
gzip m54048_170714_084938.subreads.fq
echo "Process finished"
