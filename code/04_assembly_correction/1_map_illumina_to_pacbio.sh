#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J map_illumina_to_pacbio
#SBATCH --mail-type=ALL
#SBATCH --mail-user Yuenting.Cheung.5797@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa
module load samtools

# Your commands
cd /home/ytcheung/genome_analysis/analyses/04_assembly_correction/
bwa index -p pacbio_index \
	../02_genome_assembly/PacBio/efaecium_canu.contigs.fasta
bwa mem -M pacbio_index \
	/home/ytcheung/genome_analysis/data/trimmed_illumina/E745_trimmed_1_paired.fq.gz \
	/home/ytcheung/genome_analysis/data/trimmed_illumina/E745_trimmed_2_paired.fq.gz > pacbio_illumina_alignment.sam
samtools sort -o pacbio_illumina_alignment_sorted.bam pacbio_illumina_alignment.sam
