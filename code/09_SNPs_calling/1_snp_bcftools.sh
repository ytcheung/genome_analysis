#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J snp_calling
#SBATCH --mail-type=ALL
#SBATCH --mail-user Yuenting.Cheung.5797@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa
module load samtools
module load bcftools

# Your commands
cd /home/ytcheung/genome_analysis/analyses/09_SNPs_calling/

#Index the reference genome
bwa index -p snp_ref_index \
	../../data/raw_data/for_SNPs_calling/GCF_001481405.1_ASM148140v1_genomic.fna

#Align reads to reference genome
bwa mem -M snp_ref_index \
	/home/ytcheung/genome_analysis/data/trimmed_illumina/E745_trimmed_1_paired.fq.gz \
	/home/ytcheung/genome_analysis/data/trimmed_illumina/E745_trimmed_2_paired.fq.gz > snp_ref_illumina_alignment.sam

#Sort and convert sam to bam
samtools sort -o snp_ref_illumina_alignment_sorted.bam snp_ref_illumina_alignment.sam
samtools index snp_ref_illumina_alignment_sorted.bam

#Index the reference genome
samtools faidx ../../data/raw_data/for_SNPs_calling/GCF_001481405.1_ASM148140v1_genomic.fna

# Calculate the read coverage of positions in the genome
samtools mpileup -u -g -f ../../data/raw_data/for_SNPs_calling/GCF_001481405.1_ASM148140v1_genomic.fna snp_ref_illumina_alignment_sorted.bam \
	| bcftools call -m -v -o variants.vcf

#https://datacarpentry.org/wrangling-genomics/04-variant_calling/
# Filter and report the SNP variants in variant calling format (VCF)
vcfutils.pl varFilter variants.vcf  > final_variants.vcf
 
