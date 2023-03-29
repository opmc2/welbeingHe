## code to prepare `dtUSoc` dataset goes here

library(data.table)
library(magrittr)

dataDir <- ifelse(
  sessioninfo::os_name() %like% "Fedora",
  "/home/opmc/Dropbox/work/dataOnline/UnderstandingSocietyBHPS/stata/",
  "C:\\Users\\qtnzopm\\Dropbox\\work\\dataOnline\\UnderstandingSocietyBHPS\\stata\\"
)

# # load bhps data
# listBhps <- list()
# for (i in 1:18) {
#   l <- letters[i]
#   listBhps[[i]] <- haven::read_sav(file = paste0(dataDir, "\\bhps_w", i, "\\b", l, "_indresp.sav")) %>%
#     dplyr::rename_all(~ stringr::str_replace(., stringr::regex("^b._"), ""))
# }
#
# listBhps <- lapply(listBhps, haven::as_factor)
#
# # ensure variables with same name have same attributes
# varnames <- names(listBhps[[1]]) # variable names
# vattr <- purrr::map_chr(varnames, ~class(listBhps[[1]][[.x]])) # variable attributes
#
# for (i in seq_along(listBhps)) {
#   # assign the same attributes of list item 1 to the rest of the list
#   for (j in seq_along(varnames)) {
#     if (varnames[[j]]  %in% names(listBhps[[i]])) {
#       class(listBhps[[i]][[varnames[[j]]]]) <- vattr[[j]]
#     }
#   }
# }
#
#
# listBhps <- lapply(listBhps, as.data.table)
# dtBhps <- rbindlist(listBhps, fill = TRUE)
#
# # load ukhls data
# listUkhls <- list()
# for (i in 1:8) {
#   l <- letters[i]
#   listUkhls[[i]] <- haven::read_sav(file = paste0(dataDir, "\\ukhls_w", i, "\\", l, "_indresp.sav")) %>%
#     dplyr::rename_all(~ stringr::str_replace(., stringr::regex("^._"), ""))
# }
#
# varnames <- names(dfs[[1]]) # variable names
# vattr <- purrr::map_chr(varnames, ~class(dfs[[1]][[.x]])) # variable attributes
#
# for (i in seq_along(dfs)) {
#   # assign the same attributes of list 1 to the rest of the lists
#   for (j in seq_along(varnames)) {
#     if (varnames[[j]]  %in% names(dfs[[i]])) {
#       class(dfs[[i]][[varnames[[j]]]]) <- vattr[[j]]
#     }
#   }
# }
#
# listUkhls <- lapply(listUkhls, as.data.table)
#
# dtUkhls <- rbindlist

dtUkhls <- haven::read_dta(paste0(dataDir, "UKHLS_long_allwaves.dta"))

usethis::use_data(dtUkhls, overwrite = TRUE)
