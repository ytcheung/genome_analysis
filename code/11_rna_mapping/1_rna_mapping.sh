#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J rna_mapping
#SBATCH --mail-type=ALL
#SBATCH --mail-user Yuenting.Cheung.5797@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa
module load samtools

# Your commands
cd /home/ytcheung/genome_analysis/analyses/11_rna_mapping/

bwa index -p pilon_index ../04_assembly_correction/pilon/pilon.fasta

cat ../../data/raw_data/rna_file_list.txt | while read line
do
	bwa mem -M pilon_index \
		"/home/ytcheung/genome_analysis/data/trimmed_rna/"$line"_1_paired.fq.gz" \
		"/home/ytcheung/genome_analysis/data/trimmed_rna/"$line"_2_paired.fq.gz" | samtools sort -o "./"$line"_pilon_alignment_sorted.bam" 
done
