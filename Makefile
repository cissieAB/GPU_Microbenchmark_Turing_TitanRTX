GENCODE_SM70 := -gencode=arch=compute_70,code=\"sm_70,compute_70\"
GENCODE_SM75 := -gencode=arch=compute_75,code=\"sm_75,compute_75\"
GENCODE_SM80 := -gencode=arch=compute_80,code=\"sm_80,compute_80\"

CUOPTS = $(GENCODE_SM80)  # for A100

BASE_DIR := $(shell pwd)
BIN_DIR := $(BASE_DIR)/bin

all:
	mkdir -p $(BIN_DIR)
	cd l1_bw_32f;		make;	mv l1_bw_32f $(BIN_DIR)
	cd l2_bw_32f;  		make;	mv l2_bw_32f $(BIN_DIR)
	cd mem_bw; 		make;	mv mem_bw $(BIN_DIR)
	cd MaxFlops; 		make;	mv MaxFlops $(BIN_DIR)

clean:
	cd $(BIN_DIR); rm -f *
