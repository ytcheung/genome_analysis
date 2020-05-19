#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J tn_seq_mapping
#SBATCH --mail-type=ALL
#SBATCH --mail-user Yuenting.Cheung.5797@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa
module load samtools

# Your commands
cd /home/ytcheung/genome_analysis/analyses/13_Tn_Seq/

bwa index -p pilon_index ../04_assembly_correction/pilon/pilon.fasta

cat ../../data/raw_data/tn_seq_file_list.txt | while read line
do
	bwa mem -M pilon_index \
		"/home/ytcheung/genome_analysis/data/raw_data/transcriptomics_data/"$line"_pass.fastq.gz" | samtools sort -o "./"$line"_pilon_alignment_sorted.bam" 
done
