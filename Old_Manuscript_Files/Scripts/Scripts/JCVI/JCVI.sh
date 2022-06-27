#!/bin/bash

# Convert to bed
python -m jcvi.formats.gff bed --type=mRNA --key=Name DaAe.gff3.gz -o DaAe.bed
python -m jcvi.formats.gff bed --type=mRNA --key=Name Darmor-bzh.gff3.gz -o Darmor-bzh.bed

# Format fastas
python -m jcvi.formats.fasta format DaAe.cds.fa.gz DaAe.cds
python -m jcvi.formats.fasta format Darmor-bzh.cds.fa.gz Darmor-bzh.cds

# Align
python -m jcvi.compara.catalog ortholog DaAe Darmor-bzh --cscore=.99 --no_strip_names