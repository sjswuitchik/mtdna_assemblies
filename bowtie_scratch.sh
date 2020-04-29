## Mito scratch ##
# in /scratch/swuitchik/mito on bioinf02

## things we know didn't work: norgal, MITObim, haven't yet tried MitoZ

module load bowtie2/2.3.2-fasrc02 NGmerge/0.2-fasrc01
cd taeGut
bowtie2-build taeGut_mtref.fa taeGut_mt
mkdir bowtie_db
mv taeGut_mt.*.bt2 bowtie_db/
cd SAMEA3532857
NGmerge -a -1 ERR1013161_1.fastq.gz -2 ERR1013161_2.fastq.gz -o SAMEA3532857
bowtie2 -x ../bowtie_db/taeGut_mt --very-sensitive -1 SAMEA3532857_1.fastq.gz -2 SAMEA3532857_2.fastq.gz -X 1000 --no-discordant --no-mixed --fr --no-unal -p 4 -S SAMEA3532857_mt.sam

cd ../../poeAcu 
bowtie2-build poeAcu_mtref.fa poeAcu_mt
mkdir bowtie_db
mv poeAcu_mt.*.bt2 bowtie_db/
cd poeAcu73788
NGmerge -a -1 ERR1013146_1.fastq.gz -2 ERR1013146_2.fastq.gz -o poeAcu73788
bowtie2 -x ../bowtie_db/poeAcu_mt --very-sensitive -1 poeAcu73788_1.fastq.gz -2 poeAcu73788_2.fastq.gz -X 1000 --no-discordant --no-mixed --fr --no-unal -p 4 -S poeAcu73788_mt.sam 

cd ../../anoImb/cisticola/
bowtie2-build anoImbCis_mt.fa anoImbCis_mt
mkdir bowtie_db
mv anoImbCis_mt.*.bt2 bowtie_db/
cd 2012JUN005A1
NGmerge -a -1 2012JUN005A1_R1.fastq.gz -2 2012JUN005A1_R2.fastq.gz -o 2012JUN005A1
bowtie2 -x ../bowtie_db/anoImbCis_mt --very-sensitive -1 2012JUN005A1_1.fastq.gz -2 2012JUN005A1_2.fastq.gz -X 1000 --no-discordant --no-mixed --fr --no-unal -p 4 -S 2012JUN005A1_mt.sam 

cd ../../prinia
bowtie2-build anoImbPri_mt.fa anoImbPri_mt
mkdir bowtie_db
mv anoImbPri_mt.*.bt2 bowtie_db/
cd 2012PS024A1
NGmerge -a -1 2012PS024A1_R1.fastq.gz -2 2012PS024A1_R2.fastq.gz -o 2012PS024A1
bowtie2 -x ../bowtie_db/anoImbPri_mt --very-sensitive -1 2012PS024A1_1.fastq.gz -2 2012PS024A1_2.fastq.gz -X 1000 --no-discordant --no-mixed --fr --no-unal -p 4 -S 2012PS024A1_mt_xdismisfr.sam

# after exporting to Geneious and manually inferring sequences, remake databases with new seq

cd ../../../taeGut
bowtie2-build taeGut_mtref_infer.fa taeGut_mtv2
mkdir bowtie_dbv2
mv taeGut_mtv2.*.bt2 bowtie_dbv2/
cd SAMEA3532857
bowtie2 -x ../bowtie_dbv2/taeGut_mtv2 --very-sensitive -1 SAMEA3532857_1.fastq.gz -2 SAMEA3532857_2.fastq.gz -X 1000 --no-discordant --no-mixed --fr --no-unal -p 4 -S SAMEA3532857_mtv2.sam

cd ../../poeAcu
bowtie2-build poeAcu_mtref_infer.fa poeAcu_mtv2
mkdir bowtie_dbv2
mv poeAcu_mtv2.*.bt2 bowtie_dbv2/
cd poeAcu73788
bowtie2 -x ../bowtie_dbv2/poeAcu_mtv2 --very-sensitive -1 poeAcu73788_1.fastq.gz -2 poeAcu73788_2.fastq.gz -X 1000 --no-discordant --no-mixed --fr --no-unal -p 4 -S poeAcu73788_mtv2.sam 

# remaking database for poeAcu v3, in /scratch/swuitchik/mito/poeAcu
bowtie2-build poeAcu_mt_infer_v3.fa poeAcu_mtv3
mkdir bowtie_dbv3
mv poeAcu_mtv3.*.bt2 bowtie_dbv3/

bowtie2 -x ../bowtie_dbv3/poeAcu_mtv3 --very-sensitive -1 poeAcu73788_1.fastq.gz -2 poeAcu73788_2.fastq.gz -X 1000 --no-discordant --no-mixed --fr --no-unal -p 4 -S poeAcu73788_mtv3.sam 

