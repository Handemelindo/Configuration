file.name <- "installedPackages.Rdata"

backup <- function() {
  oldip <- installed.packages()
  save(oldip, file = file.name)
}

restore <- function() {
  load(file.name)
  newip <- installed.packages()
  for (i in setdiff(oldip[, 1], newip[, 1]))
    install.packages(i)
}