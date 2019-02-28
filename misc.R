runif(4)
installed.packages()

x <- "The quick brown fox jumps over the lazy dog"
split.string <- strsplit(x, " ")
extract.words <- split.string[[1]]
result <- unique(tolower(extract.words))
print(result)
