#!/bin/bash
#Uma Mahto

if [ "$1" == "" ]; then
	printf "\nUSAGE: vafextraction.sh directory/of/vep/annotated/5/files\n"

else
	TISSUE_DIR=$1
	
	NUM_VARIANTS=$(cat ${TISSUE_DIR}/VEPannotated_5/*VEPfiltered* | grep -v "#" | wc -l)
	NUM_SAMPLES=$(ls ${TISSUE_DIR}/VEPannotated_5/*VEPfiltered* | wc -l)

	printf "Total num samples: $NUM_SAMPLES\n"
	printf "Total num variants: $NUM_VARIANTS\n"

	awk '{print $0 "\t" FILENAME}' ${TISSUE_DIR}/VEPannotated_5/*VEPfiltered* | cut -f 11 | cut -d ':' -f 11 > vaf.txt
	
	chmod 766 vaf.txt
	
	printf "VAF for all samples saved in vaf.txt"
fi

	

