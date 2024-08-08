#base docker container
FROM mambaorg/micromamba

#install necessary softwares from conda
RUN micromamba install --yes --name base -c bioconda -c conda-forge \
 perl \
 python \
 trim-galore \
 hisat2 \
 gawk \
 r \
 r-ggplot2 \
 samtools \
 bcftools \
 seqtk
RUN micromamba clean --all --yes

#add SkimSeq_method
ADD /SkimSeq_Method/Data_Visualization_Read_Count_Graph.R /opt/
ADD /SkimSeq_Method/demultiplexNextera.pl /opt/
ADD /SkimSeq_Method/Read_Count_Per_Chromosome_Arm.sh /opt/

#set environment
ENV PATH="/opt/:$PATH"
