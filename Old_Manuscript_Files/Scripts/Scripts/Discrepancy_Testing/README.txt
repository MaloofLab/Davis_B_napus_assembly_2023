### Overall thought process for checking
#1. Gather required fastas, Canu Scaffolds and Reference with random
	ln -s /share/malooflab/John/KIAT/Dovetail/Canu/Augustus_Array/Scaffolds/chr*.fa Canu_chr*.fa .
	cat /share/malooflab/John/KIAT/Reference/Split_Chroms/chr*.fa /share/malooflab/John/KIAT/Reference/Split_Chroms/chr*_random.fa > Ref_chr*.fa

#2. Nucmer to align the 2

	 nucmer \
		--maxmatch \
		-l 100 \
		-c 500 \
		--prefix All \
		Ref_chr*.fa \
		Canu_chr*.fa

#3. Filter the results harder (Probably could be done above but it's quick)

	delta-filter \
		-1 \
		-l 10000 \
		All.delta > Filtered_All.delta
#4. Plot it

	mummerplot \
		--terminal png \
		--title chr* \
		--size large \
		--prefix All \
		--fat \
		Filtered_All.delta

#5. Identify Areas of interest with eye

#6. Extract the contigs which comprise the scaffold

	scaffold=$(grep chr* /share/malooflab/John/KIAT/Assembly_Analysis/Nucmer/Dovetail_Canu/Brassica_napus_v4.1.chromosomes_vs_brassica_napus_20Feb2018_sIHWf/aligned_names_and_lengths.txt | awk '{print $3}')
	grep ${scaffold} /share/malooflab/John/KIAT/Dovetail/Canu/table.txt | awk '{print $2}' > Contigs.txt
	seqtk subseq /share/malooflab/John/KIAT/Assembly_Analysis/Denovo_Assemblies/Pilon_Polished/Polished_Canu_2.fa Contigs.txt > Contigs.fa

#7. Nucmer to align the contigs
         nucmer \
                --maxmatch \
                -l 100 \
                -c 500 \
                --prefix Contigs \
                Canu_chr*.fa \
		Contigs.fa

#8. Filter the results harder (Probably could be done above but it's quick)
        delta-filter \
                -1 \
                -l 10000 \
                Contigs.delta > Filtered_Contigs.delta

#9. Plot it

        mummerplot \
                --terminal png \
                --title chr* \
                --size large \
                --prefix Contigs \
                --fat \
                Filtered_Contigs.delta

#10. Look at physical vs genetic map

#11. Create a Bed file for each region of interest

#12. Extract the region from the fasta

#13. Extract reads from fasta

#14. Map using Blasr

#15. Plot results

#16. Get coverage of region using samtools
