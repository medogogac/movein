options(max.print=100)
options(scipen=10)
options(menu.graphics=FALSE)
options(prompt="> ")
options(continue="... ")
options(width = 80)


utils::rc.settings(ipck=TRUE)

.First <- function(){
  if(interactive()){
    library(utils)
    timestamp(,prefix=paste("##------ [",getwd(),"] ",sep=""))

  }
}

.Last <- function(){
  if(interactive()){
    hist_file <- Sys.getenv("R_HISTFILE")
    if(hist_file=="") hist_file <- "~/.RHistory"
    savehistory(hist_file)
  }
}

message("")


