#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:30:00
#SBATCH -J mummerplot
#SBATCH --mail-type=ALL
#SBATCH --mail-user Yuenting.Cheung.5797@student.uu.se

# Load modules
module load bioinfo-tools
module load MUMmer

# Your commands
cd /home/ytcheung/genome_analysis/analyses/05_assembly_evalutation_post_correction/Mummerplot

nucmer --mum -p ref_and_pilon ../../../data/raw_data/GCF_001750885.1_ASM175088v1_genomic.fna \
        ../../04_assembly_correction/pilon/pilon.fasta

mummerplot --png --layout -p ref_and_pilon ref_and_pilon.delta
