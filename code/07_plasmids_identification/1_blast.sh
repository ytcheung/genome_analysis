#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J blast_small_contigs
#SBATCH --mail-type=ALL
#SBATCH --mail-user Yuenting.Cheung.5797@student.uu.se

# Load modules
module load bioinfo-tools
module load blast

# Your commands
cd /home/ytcheung/genome_analysis/

sed -n '34699, 39508 p' ./analyses/04_assembly_correction/pilon/pilon.fasta > ./analyses/04_assembly_correction/pilon/pilon_small_contigs.fasta
blastn -num_threads 2 -db nt -query -outfmt 6 ./analyses/04_assembly_correction/pilon/pilon_small_contigs.fasta \
	-out ./analyses/07_plasmids_identification/blast_result.out
