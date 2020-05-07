#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J trimmomatic
#SBATCH --mail-type=ALL
#SBATCH --mail-user Yuenting.Cheung.5797@student.uu.se

# Load modules
module load bioinfo-tools
module load trimmomatic

# Your commands
cd /home/ytcheung/genome_analysis/ 
trimmomatic PE -phred33 ./data/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz \
	./data/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz \
	./analyses/01_preprocessing/trimmomatic/E745_trimmed_1_paired.fq.gz \
	./analyses/01_preprocessing/trimmomatic/E745_trimmed_1_unpaired.fq.gz \
	./analyses/01_preprocessing/trimmomatic/E745_trimmed_2_paired.fq.gz \
	./analyses/01_preprocessing/trimmomatic/E745_trimmed_2_unpaired.fq.gz \
	ILLUMINACLIP:./data/raw_data/TruSeq3-PE-2.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36
