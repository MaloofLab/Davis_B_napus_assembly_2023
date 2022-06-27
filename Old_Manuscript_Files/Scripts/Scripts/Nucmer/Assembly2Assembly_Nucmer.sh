source ~/.bash_profile

## Identify each array run

ref=Brassica_napus_v4.1.chromosomes

qry=Polished_Canu

base=Assembly_Analysis

echo "My reference file is: "${base}/Reference_Assemblies/${ref}".fa"
echo "My query file is: "${base}/Denovo_Assemblies/${qry}".fa"

echo "Making Directory " ${ref}_vs_${qry}
mkdir ${ref}_vs_${qry}

echo "Entering Directory " ${ref}_vs_${qry}
cd ${ref}_vs_${qry}

# Run program

nucmer \
	--maxmatch \
	-l 100 \
	-c 500 \
	${base}/Reference_Assemblies/${ref}.fa \
	${base}/Denovo_Assemblies/${qry}.fa

# Run stats

end=`date +%s`
runtime=$((end-start))
echo $runtime seconds to completion
