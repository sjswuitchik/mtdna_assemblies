######################
## MITObim pipeline ##
######################

# for one Lonchura flaviprymna individual, BAM aligned to Taeniopygia guttata, using L. flaviprymna as an MT reference

samtools bam2fq KFS200final.bam > KFS200.fastq
nohup mira manifest_KFS200.conf &> log_KFS200.txt&
./MITObim.pl -start 1 -end 10 -sample lonFla -ref lonFla.mtref.fa -readpool /scratch/swuitchik/mito/munia_fastqs/KFS200.fastq -maf /scratch/swuitchik/mito/initial_mapping_lonFla200_assembly/initial_mapping_lonFla200_d_results/initial_mapping_lonFla200_out.maf &> log200 

# for paired reads from Anomalospiza imberbis, using T. guttata as an MT reference 

nohup mira manifest_2012JUN005A1.conf &> log_2012JUN005A1.txt&
python2 /scratch/swuitchik/mito/anoImb/interleave_fastq.py 2012JUN005A1_R1.fastq 2012JUN005A1_R2.fastq > 2012JUN005A1.interleaved.fastq
./MITObim.pl -start 1 -end 10 -sample anoImbCis -ref taeGut_mtref.fa -readpool /scratch/swuitchik/mito/anoImb/cisticola/2012JUN005A1/2012JUN005A1.interleaved.fastq	 -maf /scratch/swuitchik/mito/anoImb/cisticola/2012JUN005A1/initial_mapping_anoImbCis_2012JUN005A1_assembly/initial_mapping_anoImbCis_2012JUN005A1_d_results/initial_mapping_anoImbCis_2012JUN005A1_out.maf &> log2012JUN005A1
