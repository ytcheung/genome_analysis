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
	../02_genome_assembly/PacBio/efaecium.contigs.fasta
bwa mem -M pacbio_index \
	/home/ytcheung/genome_analysis/data/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz \
	/home/ytcheung/genome_analysis/data/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz > alignment.sam
samtools sort -o alignment_sorted.bam alignment.sam
