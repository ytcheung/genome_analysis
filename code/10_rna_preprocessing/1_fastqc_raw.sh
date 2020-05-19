#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:30:00
#SBATCH -J fsatqc
#SBATCH --mail-type=ALL
#SBATCH --mail-user Yuenting.Cheung.5797@student.uu.se

# Load modules
module load bioinfo-tools
module load FastQC
module load MultiQC

# Your commands
cd /home/ytcheung/genome_analysis/

fastqc -o ./analyses/10_rna_preprocessing/fastqc_BH_raw ./data/raw_data/transcriptomics_data/RNA-Seq_BH/trim_paired_*.fastq.gz 
multiqc -o ./analyses/10_rna_preprocessing/fastqc_BH_raw ./analyses/10_rna_preprocessing/fastqc_BH_raw 

fastqc -o ./analyses/10_rna_preprocessing/fastqc_Serum_raw ./data/raw_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_*.fastq.gz
multiqc -o ./analyses/10_rna_preprocessing/fastqc_Serum_raw ./analyses/10_rna_preprocessing/fastqc_Serum_raw

