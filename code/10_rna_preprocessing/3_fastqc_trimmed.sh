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
fastqc -o ./analyses/10_rna_preprocessing/fastqc_BH_trimmed ./data/trimmed_rna/RNA-Seq_BH/*_paired.fq.gz 
multiqc -o ./analyses/10_rna_preprocessing/fastqc_BH_trimmed ./analyses/10_rna_preprocessing/fastqc_BH_trimmed

fastqc -o ./analyses/10_rna_preprocessing/fastqc_Serum_trimmed ./data/trimmed_rna/RNA-Seq_Serum/*_paired.fq.gz
multiqc -o ./analyses/10_rna_preprocessing/fastqc_Serum_trimmed ./analyses/10_rna_preprocessing/fastqc_Serum_trimmed

