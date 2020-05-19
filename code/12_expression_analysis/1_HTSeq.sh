#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J HTSeq
#SBATCH --mail-type=ALL
#SBATCH --mail-user Yuenting.Cheung.5797@student.uu.se

# Load modules
module load bioinfo-tools
module load samtools
module load htseq

# Your commands
cd /home/ytcheung/genome_analysis/analyses/12_expression_analysis/

sed -n '1, 3181 p' ../06_annotation/PROKKA_05052020/PROKKA_05052020.gff > ../06_annotation/PROKKA_05052020/PROKKA_05052020_seq_removed.gff

cat ../../data/raw_data/rna_file_list.txt | while read line
do
	#samtools view "./analyses/11_rna_mapping/"$line"_pilon_alignment_sorted.bam | \
	htseq-count -f bam -t CDS -r pos -i locus_tag "../11_rna_mapping/"$line"_pilon_alignment_sorted.bam" \
		../06_annotation/PROKKA_05052020/PROKKA_05052020_seq_removed.gff > "./"$line"_counts.txt"
done
