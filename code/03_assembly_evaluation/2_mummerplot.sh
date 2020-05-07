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
cd /home/ytcheung/genome_analysis/analyses/03_assembly_evaluation/Mummerplot

nucmer --mum -p ref_and_spades ../../../data/raw_data/GCF_001750885.1_ASM175088v1_genomic.fna \
        ../../02_genome_assembly/Illumina_and_Nanopore/efaecium_spades.contigs.fasta \

nucmer --mum -p ref_and_canu ../../../data/raw_data/GCF_001750885.1_ASM175088v1_genomic.fna \
        ../../02_genome_assembly/PacBio/efaecium_canu.contigs.fasta

mummerplot --png --layout -p ref_and_spades ref_and_spades.delta
mummerplot --png --layout -p ref_and_canu ref_and_canu.delta
