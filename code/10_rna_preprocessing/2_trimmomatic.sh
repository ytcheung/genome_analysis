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

cat ./data/raw_data/rna_file_list.txt | while read line
do
	trimmomatic PE -phred33 "./data/raw_data/transcriptomics_data/"$line"_pass_1.fastq.gz" \
		"./data/raw_data/transcriptomics_data/"$line"_pass_2.fastq.gz" \
		"./analyses/10_rna_preprocessing/trimmomatic/"$line"_1_paired.fq.gz \
		"./analyses/10_rna_preprocessing/trimmomatic/"$line"_1_unpaired.fq.gz \
		"./analyses/10_rna_preprocessing/trimmomatic/"$line"_2_paired.fq.gz \
		"./analyses/10_rna_preprocessing/trimmomatic/"$line"_2_unpaired.fq.gz \
		ILLUMINACLIP:./data/raw_data/TruSeq3-PE-2.fa:2:30:10
done
