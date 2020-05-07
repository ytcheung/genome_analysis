#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 06:00:00
#SBATCH -J illumina_nanopore_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user Yuenting.Cheung.5797@student.uu.se

# Load modules
module load bioinfo-tools
module load spades

# Your commands
cd /home/ytcheung/genome_analysis/
spades.py -1 ./data/trimmed_illumina/E745_trimmed_1_paired.fq.gz \
	-2 ./data/trimmed_illumina/E745_trimmed_2_paired.fq.gz \
	--nanopore ./data/raw_data/genomics_data/Nanopore/E745_all.fasta.gz \
        -o ./analyses/02_genome_assembly/Illumina_and_Nanopore/ \
	-k 55,67,77
