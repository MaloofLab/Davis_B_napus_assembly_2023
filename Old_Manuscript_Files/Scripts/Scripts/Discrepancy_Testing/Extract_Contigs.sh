# aligned_names_and_lengths.txt is created by picking the scaffolds of interest

scaffold=$(grep chr* aligned_names_and_lengths.txt | awk '{print $3}')

grep ${scaffold} table.txt | awk '{print $2}' > Contigs.txt

seqtk subseq Polished_Canu.fa Contigs.txt > Contigs.fa