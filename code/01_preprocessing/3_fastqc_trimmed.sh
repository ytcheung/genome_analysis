#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:30:00
#SBATCH -J fsatqc_trimmed
#SBATCH --mail-type=ALL
#SBATCH --mail-user Yuenting.Cheung.5797@student.uu.se

# Load modules
module load bioinfo-tools
module load FastQC
module load MultiQC

# Your commands
cd /home/ytcheung/genome_analysis/
fastqc -o ./analyses/01_preprocessing/fastqc_trimmed ./data/trimmed_illumina/*_paired.fq.gz 
multiqc -o ./analyses/01_preprocessing/fastqc_trimmed ./analyses/01_preprocessing/fastqc_trimmed
