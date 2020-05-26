#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J samtools_stats
#SBATCH --mail-type=ALL
#SBATCH --mail-user Yuenting.Cheung.5797@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa
module load samtools

# Your commands
cd /home/ytcheung/genome_analysis/analyses/11_rna_mapping/

cat ../../data/raw_data/rna_file_list.txt | while read line
do
	samtools index "./"$line"_pilon_alignment_sorted.bam"
	samtools idxstats "./"$line"_pilon_alignment_sorted.bam" > "./"$line"_stats.txt"
done
