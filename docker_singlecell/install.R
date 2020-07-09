if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
suppressWarnings(BiocManager::install())


pkgs_to_install <- c("tidyverse","tibble","RCurl",
"cowplot","SingleCellExperiment","scater","reticulate", "AnnotationHub",
"ensembldb", "Seurat","rio","devtools","tidyverse","XLConnect","janitor",
"pheatmap","DESeq2","reshape")

## Start the actual installation:
ok <- BiocManager::install(pkgs_to_install, update=FALSE, ask=FALSE) %in% rownames(installed.packages())
if (!all(ok))
    stop("Failed to install:\n  ",
         paste(pkgs_to_install[!ok], collapse="  \n  "))

devtools::install_github("immunogenomics/harmony")

suppressWarnings(BiocManager::install(update=TRUE, ask=FALSE))

## Install formats for rio

rio::install_formats()
