if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
suppressWarnings(BiocManager::install())


pkgs_to_install <- c("tidyverse","tibble","RCurl",
"cowplot","scater", "AnnotationHub",
"ensembldb", "rio","devtools","dplyr","XLConnect","janitor",
"pheatmap","DESeq2","reshape","edgeR","tximport")

## Start the actual installation:
ok <- BiocManager::install(pkgs_to_install, update=FALSE, ask=FALSE) %in% rownames(installed.packages())
if (!all(ok))
    stop("Failed to install:\n  ",
         paste(pkgs_to_install[!ok], collapse="  \n  "))

suppressWarnings(BiocManager::install(update=TRUE, ask=FALSE))

## Install formats for rio

rio::install_formats()
