#!/bin/bash

#This script cleans the .vcf file obtained from populations-Stacks of M. haageana subespecies 
#B			1/abril/2019 		


#Creates a variable for the absolute route, need to change yours
#src=/home/pc_6/Escritorio/mamm/out_85l/mh/pop
src=/Users/m13nu/Desktop/mh/02_data

#Cleans the .vcf file since Docker with VCFTools
# --max-missing = 0.80
# --remove-indels
# --minDP = 6: includes only genotypes greater than or equal to the "--minDP" value
# --maf = 0.05: minor allele frequency, se usa para diferenciar entre alelos "comunes" y "raros" dentro de una población. maf > 0.05 = alelos comunes, maf < 0.05 raros.
docker run --rm -v $src:/data biocontainers/vcftools:0.1.15 bash -c "vcftools --vcf populations.snps.vcf --max-missing 0.80 --remove-indels --minDP 6 --maf 0.05 --recode --recode-INFO-all --out mhssp_80"

# --max-missing=1
docker run --rm -v $src:/data biocontainers/vcftools:0.1.15 bash -c "vcftools --vcf populations.snps.vcf --max-missing 1 --remove-indels --minDP 6 --maf 0.05 --recode --recode-INFO-all --out mhssp_100"
