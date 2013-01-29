slaData <- read.table('auditoutline.log', fill = TRUE, header = FALSE, colClasses = "character", sep = "|")

names(slaData)
colnames(slaData) <- c("audit_time","","","app","version","instance","correlationID",
                       "requestID","","","","","client","","login","sens","cityCode",
                       "service","core_version","methode", "","timems","machine","isError",
                       "code","libelle","detail","","","Lniata","version","")


