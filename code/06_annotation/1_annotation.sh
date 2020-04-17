#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:30:00
#SBATCH -J prokka
#SBATCH --mail-type=ALL
#SBATCH --mail-user Yuenting.Cheung.5797@student.uu.se

# Load modules
module load bioinfo-tools
module load prokka

# Your commands
cd /home/ytcheung/genome_analysis/analyses/06_annotation
prokka ../04_assembly_correction/pilon/pilon.fasta
