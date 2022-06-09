module load busco/3.0.2

# Run program

mkdir Polished_Canu

cd Polished_Canu

BUSCO.py \
	-c 20 \
	-i ../Assemblies/Polished_Canu.fa \
	-o Polished_Canu \
	-l ${BUSCO_LINEAGE}/embryophyta_odb9 \
	-m genome

# Run stats

end=`date +%s`
runtime=$((end-start))
echo $runtime seconds to completion
