#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J pacbio_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user Yuenting.Cheung.5797@student.uu.se

# Load modules
module load bioinfo-tools
module load canu

# Your commands
cd /home/ytcheung/genome_analysis/
canu -p efaecium -d ./analyses/02_genome_assembly/PacBio genomeSize=3.2m -pacbio-raw ./data/raw_data/genomics_data/PacBio/*.fastq.gz

