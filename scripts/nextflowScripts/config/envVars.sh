#!/bin/bash

#   Config version 2.01
#   More complete information on how to fill out
#       this Config file can be found at:
#       https://github.com/MorrellLAB/sequence_handling/wiki/Configuration

#   Where are we storing the output files?
#       Final directory is ${OUT_DIR}/Name_of_Handler
OUT_DIR=

#   Name this project
PROJECT=

#   What email should we use for job notifications?
#   Only fill out if using a queue system
EMAIL=

#   What encoding is used for quality values?
#       Look at the FastQC files to determine
#       the sequence encoding. Choose from:
#           'sanger', 'illumina'
#           'solexa', or 'phred'
QUAL_ENCODING=

#   Sequencing platform technology
#       What platform were the reads produced?
#       Valid options are:
#           CAPILLARY, LS454, ILLUMINA,
#           SOLID, HELICOS, IONTORRENT
#           ONT, and PACBIO
SEQ_PLATFORM=

#   What reference genome are we using?
#       Include the full file path.
REF_GEN=

#   Is this organism barley?
#       Choose from: "true" or "false"
BARLEY=

#   Do the quality scores need to be adjusted for GATK? Default: false
#       Change to true if you get errors from GATK like:
#       "<Sample> appears to be using the wrong encoding for quality scores: we encountered an extremely high quality score"
FIX_QUALITY_SCORES=false

############################################
##########     GBS_Demultiplex    ##########
############################################

#   What are our QS
GD_QSUB="mem=1gb,nodes=1:ppn=4,walltime=6:00:00"

GBS_SAMPLES=

#   A key file with the following columns:
#       Flowcell Lane Barcode Sample PlateName Row Column
KEY_FILE=

#   Are the barcodes at the beginning or the end of the sequence?
#       Choose from: 'beginning' or 'end'
LINE_ENDING=

#   How many mismatches are allowed?
MISMATCH_TOL=1

#   Do we allow partial overlap?
PARTIAL=0

#   What extension or naming convention do the samples have?
FILE_TYPE=

############################################
##########   Quality_Assessment   ##########
############################################

#   What are our QSub settings for Quality_Assessment?
#       Below are the recommended settings
QA_QSUB="mem=1gb,nodes=1:ppn=4,walltime=6:00:00"

#   Provide a list of FastQ, SAM, or BAM files to be used
#       Include the full file path.
QA_SAMPLES=

#   What is the size of the genome (for whole-genome sequencing)
#   or capture region (for exome capture)?
#   If unavailable, put "NA"
TARGET=

############################################
##########    Adapter_Trimming    ##########
############################################

#   What are our QSub settings for Adapter_Trimming?
#       Below are the recommended settings
AT_QSUB="mem=1gb,nodes=1:ppn=4,walltime=10:00:00"

#   Where is the list of original FastQ files?
#       Include the full file path.
RAW_SAMPLES=

#   What shared suffix do the forward samples have?
#       Example: _1_sequence.txt.gz
FORWARD_NAMING=_R1.fastq.gz

#   What shared suffix do the reverse samples have?
#       Example: _2_sequence.txt.gz
REVERSE_NAMING=_R2.fastq.gz

#   If you have single-end samples, leave
#       FORWARD_NAMING and REVERSE_NAMING
#       filled with values that do NOT
#       match your samples

#	What is our adapter file? Include the full file path.
ADAPTERS=

#   What is Scythe's prior contamination rate?
#       Scythe's documentation suggests starting at
#       0.05 and then experimenting as needed
PRIOR=0.05

############################################
##########    Quality_Trimming    ##########
############################################

#   What are our QSub settings for Quality_Trimming?
#       Below are the recommended settings
QT_QSUB="mem=1gb,nodes=1:ppn=4,walltime=10:00:00"

#   Where is our list of trimmed samples? Include the full file path.
ADAPTED_LIST=${OUT_DIR}/Adapter_Trimming/${PROJECT}_trimmed_adapters.txt

#   What shared suffix do the trimmed forward samples have?
#       If using the Adapter_Trimming handler,
#       leave the following definition as is
FORWARD_ADAPTED=_Forward_ScytheTrimmed.fastq.gz

#   What shared suffix do the trimmed reverse samples have?
#       If using the Adapter_Trimming handler,
#       leave the following definition as is
REVERSE_ADAPTED=_Reverse_ScytheTrimmed.fastq.gz

#   What shared suffix do the trimmed single samples have?
#       If using the Adapter_Trimming handler,
#       leave the following definition as is
SINGLES_ADAPTED=_Single_ScytheTrimmed.fastq.gz

#   If you have single-end samples, leave
#       FORWARD_ADAPTED and REVERSE_ADAPTED
#       filled with values that do NOT
#       match your samples

#   If you have paired-end samples, leave
#       SINGLES_ADAPTED filled with values that
#       do NOT match your samples

#   What is the threshold for trimming?
#       For standard trimming, use 20
QT_THRESHOLD=

############################################
##########  	Read_Mapping	  ##########
############################################

#   What are our QSub settings for Read_Mapping?
#       Below are the recommended settings
#       For large files, it may be necessary to use mesabi
RM_QSUB="mem=22gb,nodes=1:ppn=16,walltime=24:00:00"

#   Where is our list of trimmed samples?
#       If you're using the list from Adapter_Trimming
#       TRIMMED_LIST=${OUT_DIR}/Adapter_Trimming/${PROJECT}_trimmed_adapters.txt
#       If you're using the list from Quality_Trimming
#       TRIMMED_LIST=${OUT_DIR}/Quality_Trimming/${PROJECT}_trimmed_quality.txt
#       Include the full file path.
TRIMMED_LIST=${OUT_DIR}/Adapter_Trimming/${PROJECT}_trimmed_adapters.txt

#   How are trimmed forward samples named?
#       If using the Adapter_Trimming handler
#       FORWARD_TRIMMED=_Forward_ScytheTrimmed.fastq.gz
#       If using the Quality_Trimming handler
#       FORWARD_TRIMMED=_R1_trimmed.fastq.gz
FORWARD_TRIMMED=_Forward_ScytheTrimmed.fastq.gz

#   How are trimmed reverse samples named?
#       If using the Adapter_Trimming handler
#       REVERSE_TRIMMED=_Reverse_ScytheTrimmed.fastq.gz
#       If using the Quality_Trimming handler
#       REVERSE_TRIMMED=_R2_trimmed.fastq.gz
REVERSE_TRIMMED=_Reverse_ScytheTrimmed.fastq.gz

#   How are trimmed single-end samples named?
#       If using the Adapter_Trimming handler
#       SINGLES_TRIMMED=_Single_ScytheTrimmed.fastq.gz
#       If using the Quality_Trimming handler
#       SINGLES_TRIMMED=_single_trimmed.fastq.gz
SINGLES_TRIMMED=_Single_ScytheTrimmed.fastq.gz

#   BWA mem parameters; below are the defaults for BWA mem
#       Note that you may need to adjust parameters based on species
#       How many threads are we using?
THREADS=8

#       What is our minimum seed length?
SEED=8

#       What is the band width?
WIDTH=100

#       What is our off-diagonal x-dropoff (Z-dropoff)?
DROPOFF=100

#       What is our re-seed value?
RE_SEED=1.0

#       What is our cutoff value?
CUTOFF=10000

#       What is our matching score?
MATCH=1

#       What is our mismatch penalty?
MISMATCH=4

#       What is our gap penalty?
GAP=8

#       What is our gap extension penalty?
EXTENSION=1

#       What is our clipping penalty?
CLIP=5

#       What is our unpaired read penatly?
UNPAIRED=9

#       Do we rescue missing hits? Note, this means that reads may not be matched. Requires paired-end mode
RESCUE=false

#       Do we assume the first input query is interleaved?
INTERLEAVED=false

#       What is our minimum threshold?
RM_THRESHOLD=85

#       Do we output all alignments, and mark as secondary?
SECONDARY=false

#       Do we append FASTA/Q comments to SAM files?
APPEND=false

#       Do we use hard clipping?
HARD=false

#       Do we mark split hits as secondary?
SPLIT=true

#       What is the verbosity level?
#           Choose from:
#               'disabled', 'errors'
#               'warnings', 'all', or 'debug'
VERBOSITY='all'

############################################
##########     SAM_Processing     ##########
############################################

#   Specify how you would like your SAM files to be processed
#       Choose from:
#           'picard' (recommended) or 'samtools'
METHOD=

#   What are our QSub settings for SAM_Processing?
#       Below are the recommended settings
SP_QSUB="mem=22gb,nodes=1:ppn=16,walltime=24:00:00"

#   Where is the list of read-mapped samples?
#       To generate this list, use sample_list_generator.sh
#       located at /sequence_handling/HelperScripts/sample_list_generator.sh
MAPPED_LIST=

#   The next two variables are only used if processing with Picard
#   If using SAMtools, leave these variables blank

#   What is the maximum number of file handles that we can use?
#       For UNIX systems, the per-process maximum number of files
#           that can be open may be found with 'ulimit -n'
#       We recommend setting MAX_FILES to be slightly under this value
MAX_FILES=1000

#   Where should Picard store temporary files?
#       If you've encountered issues with running out of temp space
#           with picard, you can optionally specify a temp directory
#       Otherwise, leave blank
TMP=

############################################
##########    Coverage_Mapping    ##########
############################################

#   What are our Qsub settings for Coverage_Mapping?
#       Below are the recommended settings
CM_QSUB="mem=22gb,nodes=1:ppn=16,walltime=24:00:00"

#   Where is the list of finished BAM files?
#       To generate this list, use sample_list_generator.sh
#       located at /sequence_handling/HelperScripts/sample_list_generator.sh
BAM_LIST=

#   For exome capture, use the capture regions file (BED format)
#   For whole-genome sequencing, leave this blank
#   Coverage_Mapping should not be used for GBS data
REGIONS_FILE=

############################################
########  Realigner_Target_Creator  ########
############################################

#   What are our Qsub settings for Realigner_Target_Creator?
#       Below are the recommended settings
RTC_QSUB="mem=22gb,nodes=1:ppn=16,walltime=24:00:00"

#   Where is the list of finished BAM files?
#       To generate this list, use sample_list_generator.sh
#       located at /sequence_handling/HelperScripts/sample_list_generator.sh
RTC_BAM_LIST=

############################################
#########     Indel_Realigner      #########
############################################

#   What are our Qsub settings for Indel_Realigner?
#       Below are the recommended settings
IR_QSUB="mem=22gb,nodes=1:ppn=16,walltime=24:00:00"

#   Where is the list of finished BAM files?
#       To generate this list, use sample_list_generator.sh
#       located at /sequence_handling/HelperScripts/sample_list_generator.sh
IR_BAM_LIST=

#   Where is the list of realigner targets files (.intervals)?
#       To generate this list, use sample_list_generator.sh
#       located at /sequence_handling/HelperScripts/sample_list_generator.sh
IR_TARGETS=

#   IR_BAM_LIST and IR_TARGETS must have the same sample order.

#   What is the LOD threshold above which the cleaner will clean?
#       GATK default: 5.0, Barley: 3.0
LOD_THRESHOLD=3.0

#   What is the percentage of mismatches at a locus to be considered having high entropy (0.0 < entropy <= 1.0)?
#       GATK default: 0.15, Barley: 0.10
ENTROPY_THRESHOLD=0.10

############################################
##########    Haplotype_Caller    ##########
############################################

#   What are our Qsub settings for Haplotype_Caller?
#       Below are the recommended settings
HC_QSUB="mem=250gb,nodes=1:ppn=24,walltime=24:00:00"

#   Which queue are we submitting the job to?
HC_QUEUE="ram256g"

#   Where is the list of finished BAM files?
#       To generate this list, use sample_list_generator.sh
#       located at /sequence_handling/HelperScripts/sample_list_generator.sh
FINISHED_BAM_LIST=

#   What is the nucleotide diversity per base pair (Watterson's theta)?
#       For barley: 0.008
#       For soybean: 0.001
THETA=

#   If true, GATK will not trim down the active region from the full region
#       (active + extension) to just the active interval for genotyping
DO_NOT_TRIM_ACTIVE_REGIONS=

#   If true, all bases will be considered active regions
FORCE_ACTIVE=

############################################
##########     Genotype_GVCFs     ##########
############################################

#   USAGE NOTE: For accurate results, run Genotype_GVCFs on all of your samples at once
#       DO NOT break this job into batches of samples

#   What are our Qsub settings for Genotype_GVCFs?
#       Below are the recommended settings
GG_QSUB="mem=22gb,nodes=1:ppn=16,walltime=24:00:00"

#   Where is the list of GVCF files?
#       To generate this list, use sample_list_generator.sh
#       located at /sequence_handling/HelperScripts/sample_list_generator.sh
GVCF_LIST=

#   What is the nucleotide diversity per base pair (Watterson's theta)?
#   Genotype_GVCFs uses the THETA under Haplotype_Caller for this

#   Where is the reference dictionary file? (.dict)
#       Include the full file path.
REF_DICT=

#   How many chromosomes or chromosome parts does the reference have, excluding scaffolds? (integer value)
#       For barley: 15 (7*2 chromosome parts + chrUn)
#       For soybean: 20
NUM_CHR=

#   Optional: Leave blank if you do not wish to call SNPs on non-chromosomal sequence
#       Include the full file path to a list of the names of any and all scaffolds or parts of the reference not covered by the chromosomes above
#       One scaffold name per line, must end in .intervals, SAMtools style intervals are also acceptable, one per line (ex: chr1:100-200)
CUSTOM_INTERVALS=

#   What is the sample ploidy? (integer value)
#   For highly inbred samples (most barleys): 1
PLOIDY=

############################################
##########    Create_HC_Subset    ##########
############################################

#   What are our Qsub settings for Create_HC_Subset?
#       Below are the recommended settings
CHS_QSUB="mem=22gb,nodes=1:ppn=16,walltime=24:00:00"

#   Where is the list of chromosome part VCF files?
#       To generate this list, use sample_list_generator.sh
#       located at /sequence_handling/HelperScripts/sample_list_generator.sh
CHS_VCF_LIST=

#   If exome capture, include the full file path to the capture regions file (BED format)
#   This should be the same file as the REGIONS_FILE in Coverage_Mapping
#   If not exome capture, put "NA"
CAPTURE_REGIONS=

#   What is the depth per sample (DP) cutoff? (integer)
#       If a sample's DP is below this threshold, it will count as a "bad" sample for that site.
#       Recommended value: 5
CHS_DP_PER_SAMPLE_CUTOFF=5

#   What is the genotyping quality (GQ) cutoff? (integer)
#       If a sample's GQ is below this threshold, it will count as a "bad" sample for that site.
#       Recommended value: 10th percentile of the raw GQ percentile table
CHS_GQ_CUTOFF=

#   What is the maximum number of "bad" (low GQ, low DP, or missing genotype data) samples allowed at a site? (integer)
#       Sites with more "bad" samples than this threshold will be filtered out.
#       Recommended value: total number of samples * 0.2 (rounded to the nearest whole number)
CHS_MAX_BAD=

#   What is the maximum number of samples at a site that can be heterozygous? (integer)
#       Recommended value: total number of samples * 0.9 (rounded to the nearest whole number)
CHS_MAX_HET=

#   What is the QUAL score cutoff? (integer)
#       Sites with a QUAL below this cutoff will be excluded.
#       Recommended value: 40
CHS_QUAL_CUTOFF=40

############################################
##########  Variant_Recalibrator  ##########
############################################

#   DO NOT RUN VARIANT_RECALIBRATOR IF YOU HAVE LESS THAN 30 SAMPLES

#   What are our Qsub settings for Variant_Recalibrator?
#       Below are the recommended settings
VR_QSUB="mem=250gb,nodes=1:ppn=16,walltime=24:00:00"

#   Which queue are we submitting the job to?
VR_QUEUE="ram256g"

#   What reference genome are we using?
#       Include the full file path.
#       If barley, use the pseudomolecular reference
#           NOT the parts reference used above
VR_REF=

#   Where is the list of chromosome part VCF files from Genotype_GVCFs?
#       To generate this list, use sample_list_generator.sh
#       located at /sequence_handling/HelperScripts/sample_list_generator.sh
VR_VCF_LIST=

#   Where is the high confidence subset of variants?
#       If you used Create_HC_Subset, leave as the default
HC_SUBSET=${OUT_DIR}/Create_HC_Subset/${PROJECT}_high_confidence_subset.vcf
HC_PRIOR=5.0

#   Where are resource VCF files and their priors (integers) to be used for training our model?
#       At least one resource and prior pair is required
#       Put "NA" for missing resource files and priors
RESOURCE_1=
PRIOR_1=

RESOURCE_2=
PRIOR_2=

RESOURCE_3=
PRIOR_3=

RESOURCE_4=
PRIOR_4=

############################################
##########    Variant_Filtering   ##########
############################################

#   What are our Qsub settings for Variant_Filtering?
#       Below are the recommended settings
VF_QSUB="mem=22gb,nodes=1:ppn=16,walltime=24:00:00"

#   Where is the VCF file to be filtered?
#	If you used Variant_Recalibrator, leave as the default
VF_VCF=${OUT_DIR}/Variant_Recalibrator/${PROJECT}_recalibrated.vcf

#   If exome capture, include the full file path to the capture regions file (BED format)
#   For barley use the pseudomolecular BED file, not the parts file
#   If not exome capture, put "NA"
VF_CAPTURE_REGIONS=

#   What is the minimum number of reads needed to support a genotype? (integer)
#       Recommended value: 5
MIN_DP=5

#   What is the maximum number of reads allowed to support a genotype? (too many = gene duplication problems) (integer)
#       Recommended value: 95th percentile of the raw DP per sample percentile table
MAX_DP=

#   What is the maximum percent deviation from 50/50 reference/alternative reads allowed in heterozygotes? (decimal)
#       For example, MAX_DEV=0.1 allows 60/40 ref/alt and also 40/60 ref/alt but not anything more skewed
#       Recommended value: 0.1
MAX_DEV=0.1

#   What is the depth per sample (DP) cutoff? (integer)
#       If a sample's DP is below this threshold, it will count as a "bad" sample for that site.
#       Recommended value: 5
DP_PER_SAMPLE_CUTOFF=5

#   What is the genotyping quality (GQ) cutoff? (integer)
#       If a sample's GQ is below this threshold, it will count as a "bad" sample for that site.
#       Recommended value: 10th percentile of the raw GQ percentile table
GQ_CUTOFF=

#   What is the maximum number of "bad" (low GQ, low DP, or missing genotype data) samples allowed at a site? (integer)
#       Sites with more "bad" samples than this threshold will be filtered out.
#       Recommended value: total number of samples * 0.2 (rounded to the nearest whole number)
MAX_BAD=

#   What is the maximum number of samples at a site that can be heterozygous? (integer)
#       Recommended value: total number of samples * 0.9 (rounded to the nearest whole number)
MAX_HET=

#   What is the QUAL score cutoff? (integer)
#       Sites with a QUAL below this cutoff will be excluded.
#       Recommended value: 40
QUAL_CUTOFF=40

############################################
##########    Variant_Analysis    ##########
############################################

#   What are our Qsub settings for Variant_Analysis?
#       Below are the recommended settings
VA_QSUB="mem=22gb,nodes=1:ppn=16,walltime=24:00:00"

#   Where is the VCF file? Include the full file path.
VA_VCF=

############################################
##########      Dependencies      ##########
############################################

#   This section defines installations to
#       various dependencies for sequence_handling.
#   If you are using the Minnesota Supercomputing Institute cluster
#       then uncomment all 'module load' lines.
#       Make sure you have access to all '_ML' modules.
#   If you need to install a dependency from source,
#       then uncomment the lines for the dependency and the
#       'export PATH=', and write the full path to the directory containing
#       the executable for the program. For example:
#       If path to executable is: ${HOME}/software/parallel-20151122/bin/parallel
#       Put the following as the path:
#       PARALLEL=${HOME}/software/parallel-20151122/bin
#   If you have a system-wide installation for a program, you can
#       leave all lines commented out. sequence_handling will find
#       system-wide installed programs automatically.

#   Please visit https://github.com/MorrellLab/sequence_handling/wiki/Dependencies
#       for information on version requirements and compatibility

#   Do we have GNU parallel installed
#module load parallel/20160822
#PARALLEL=
#export PATH=${PARALLEL}:${PATH}

#   Do we have the Fastx Toolkit installed?
#module load fastx_toolkit/0.0.14
#FASTX_TOOLKIT=
#export PATH=${FASTX_TOOLKIT}:${PATH}

#   Do we have FastQC installed?
#module load fastqc/0.11.5
#FASTQC=
#export PATH=${FASTQC}:${PATH}

#   Do we have Riss-util installed?
#module load riss_util/1.0
#RISS_UTIL=
#export PATH=${RISS_UTIL}:${PATH}

#   Do we have Seqqs installed?
#module load seqqs_ML/3d05375
#SEQQS=
#export PATH=${SEQQS}:${PATH}

#   Do we have Sickle installed?
#module load sickle_ML/1.33
#SICKLE=
#export PATH=${SICKLE}:${PATH}

#   Do we have Scythe installed?
#module load scythe_ML/0.994
#SCYTHE=
#export PATH=${SCYTHE}:${PATH}

#   Do we have R installed?
#module load R/3.3.1
#R=
#export PATH=${R}:${PATH}

#   Do we have BWA installed?
#module load bwa_ML/0.7.15
#BWA=
#export PATH=${BWA}:${PATH}

#   Do we have SAMTools installed?
#module load samtools_ML/1.3.1
#SAMTOOLS=
#export PATH=${SAMTOOLS}:${PATH}

#   What is the full file path for the Picard jar file?
#PICARD_JAR=/panfs/roc/itascasoft/picard/2.9.0/picard.jar

#   Do we have BEDTools 2.17.0 installed?
#module load bedtools/2.17.0
#BEDTOOLS=
#export PATH=${BEDTOOLS}:${PATH}

#   Do we have Java installed?
#module load java/jdk1.8.0_45
#JAVA=
#export PATH=${JAVA}:${PATH}

#   What is the full file path for the GATK jar file?
#GATK_JAR=/panfs/roc/groups/9/morrellp/public/Software/GATK_ML_3.8.0/GenomeAnalysisTK.jar

#   Do we have vcftools installed?
#module load vcftools_ML/0.1.14
#VCFTOOLS=
#export PATH=${VCFTOOLS}:${PATH}

#   Do we have vcflib installed?
#module load vcflib_ML/1.0.0
#VCFLIB=
#export PATH=${VCFLIB}:${PATH}

#   Do we have python 3 installed?
#module load python3_ML/3.6.1
#PYTHON3=
#export PATH=${PYTHON3}:${PATH}

#   Do we have analysis installed?
#module load analysis/0.8.2
#ANALYSIS=
#export PATH=${ANALYSIS}:${PATH}

#   Do we have bcftools installed?
#module load bcftools/0.2.0
#BCFTOOLS=
#export PATH=${BCFTOOLS}:${PATH}

#   Do we have python-epd installed?
#module load python-epd/1.5.2
#PYTHON-EPD=
#export PATH=${PYTHON-EPD}:${PATH}

#   Do we have texlive installed?
#module load texlive/20131202
#TEXLIVE=
#export PATH=${TEXLIVE}:${PATH}