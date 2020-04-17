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
module load quast

# Your commands
cd /home/ytcheung/genome_analysis/
quast.py -o ./analyses/05_assembly_evalutation_post_correction/Quast/ ./analyses/04_assembly_correction/pilon/pilon.fasta \
	-R ./data/raw_data/GCF_000174395.2_ASM17439v2_genomic.fna.gz

