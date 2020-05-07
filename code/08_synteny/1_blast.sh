#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:30:00
#SBATCH -J blast_synteny
#SBATCH --mail-type=ALL
#SBATCH --mail-user Yuenting.Cheung.5797@student.uu.se

# Load modules
module load bioinfo-tools
module load blast

# Your commands
cd /home/ytcheung/genome_analysis/analyses/08_synteny/

blastn -num_threads 2 -query ../04_assembly_correction/pilon/pilon_small_contigs.fasta \
	-subject ../../data/raw_data/E_faecium_DO.fna \
	-out ../08_synteny/blast_result.out
