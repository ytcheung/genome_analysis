#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J pilon
#SBATCH --mail-type=ALL
#SBATCH --mail-user Yuenting.Cheung.5797@student.uu.se

# Load modules
module load bioinfo-tools
module load samtools
module load Pilon

# Your commands
cd /home/ytcheung/genome_analysis/analyses/04_assembly_correction/
samtools index pacbio_illumina_alignment_sorted.bam
pilon --genome ../02_genome_assembly/PacBio/efaecium_canu.contigs.fasta --frags pacbio_illumina_alignment_sorted.bam --outdir ./pilon
