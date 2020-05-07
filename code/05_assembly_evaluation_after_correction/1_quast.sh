#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:30:00
#SBATCH -J quast
#SBATCH --mail-type=ALL
#SBATCH --mail-user Yuenting.Cheung.5797@student.uu.se

# Load modules
module load bioinfo-tools
#module load python3
module load quast/3.2

# Your commands
cd /home/ytcheung/genome_analysis/

quast.py -o ./analyses/05_assembly_evalutation_post_correction/Quast/ \
#	./analyses/02_genome_assembly/Illumina_and_Nanopore/efaecium_spades.contigs.fasta \
	./analyses/02_genome_assembly/PacBio/efaecium_canu.contigs.fasta \
	./analyses/04_assembly_correction/pilon/pilon.fasta \
	-R ./data/raw_data/GCF_001750885.1_ASM175088v1_genomic.fna.gz
