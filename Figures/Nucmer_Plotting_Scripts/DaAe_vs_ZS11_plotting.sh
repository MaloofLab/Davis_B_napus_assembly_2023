#!/bin/bash

## Load required modules
module load mummer/4.0.0rc1
export gnuplot=/share/malooflab/Packages/gnuplot-5.2.4/bin/gnuplot

#Nucmer
nucmer \
  --threads 5 \
  --prefix DaAe_vs_ZS11 \
  ../../Assemblies/DaAe.fa \
  ../../Assemblies/ZS11.fa

#Filtering
delta-filter \
  -l 100000 \
  DaAe_vs_ZS11.delta > filtered.DaAe_vs_ZS11.delta

#Plotting
mummerplot \
  --filter \
  --terminal png \
  --size large \
  --prefix New_DaAe_vs_ZS11 \
  --Rfile ../../Assemblies/DaAe.fa \
  --title "DaAe vs ZS11" \
  filtered.DaAe_vs_ZS11.delta

#Edit gnuplot file (New_DaAe_vs_ZS11.gp)
# Change line 1
## OLD
# set terminal png tiny size 1400,1400
## NEW
# set terminal png tiny size 1400,1400 font "Helvetica,25"
# Change line 2
## OLD
# set output "New_DaAe_vs_ZS11.png"
## New
# set output "DaAe_vs_ZS11.png"
# Change line 53
## OLD
# set xlabel "REF"
## New
# set xlabel "DaAe"
# Change line 54
## OLD
# set ylabel "QRY"
## New
# set xlabel "ZS11"
# Remove line 55 (set mouse format "%.0f")
# Remove line 56 (set mouse mouseformat "[%.0f, %.0f]")
# Change line 64
## OLD
#  "New_DaAe_vs_ZS11.fplot" title "FWD" w lp ls 1, \
## New
#  "New_DaAe_vs_ZS11.fplot" title "FWD" w lp ls 1 linecolor rgb "red", \
# Change line 65
## OLD
#  "New_DaAe_vs_ZS11.rplot" title "REV" w lp ls 2
## New
#  "New_DaAe_vs_ZS11.rplot" title "REV" w lp ls 2 linecolor rgb "blue"

#Replot
gnuplot New_DaAe_vs_ZS11.gp
