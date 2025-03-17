META <- read.table("fichiers-microbiomeanalyst/MetaFlower - Copie.txt",row.names=1)
library(tibble)
# Import ASV table
ASV <- read.csv("fichiers-microbiomeanalyst/ASVFlower - Copie.csv")
ASV2 <- read.csv("ASVFlower.csv")

ASV2=as.matrix(ASV2)

ASV4=t(ASV2)
write.csv(ASV4,"ASV4.csv")
colnames(ASV4)=ASV4[1,1:ncol(ASV4)] 
ASV4=ASV4[-1,]
ASV6=cbind(rownames(ASV4),ASV4)
colnames(ASV4)[0]="#NAME"
write.csv(ASV6,"ASVFlower_real.csv")
##colnames(ASV4)=ASV4[1,1:45]
write.csv(ASV4,"ASV4.csv")
ASV4.2<-read.csv("ASV4.csv",row.names=1)

# Import taxonomy table
TAXONOMY <- read.csv("TaxonomyFlower2.csv")


TAX1 <- read.csv("TaxonomyFlower (1).csv",row.names=1)


write.csv(TAX2,"Tax2.csv")
TAX1=t(TAX3)
TAX3 <- TAXO

colnames(TAX3)[1] <- "#TAXONOMY"
colnames(TAX1)[1] <- "#TAXONOMY"
write.csv(TAX3,"Tax3.csv") #This tax table looks good

row.names(META)==row.names(ASV2)
which(colnames(ASV2)!=row.names(TAX3))

colnames(ASV2)[1]="#NAME"

write.csv(ASV2,"ASV2.csv")
write.csv(ASV3,"ASV3.csv")


#Essai pour rendre les tables similaires au tuto_mdp
#Débuggage taxa
ASV2 <- read.csv("ASVFlower.csv")
ASV4=t(ASV2) #D'après le tuto faut avoir la table dans ce sens
write.csv(ASV4,"ASV4.csv") # Juste pour test ce qu'on fait
colnames(ASV4)=ASV4[1,1:ncol(ASV4)]  #On renomme les colonne par les vals de la 1ère ligne et on la supprime
ASV4=ASV4[-1,]
colnames(ASV4)[0]="#NAME" #Accède au nom de la colonne des rownames
write.csv(ASV4,"ASV4.csv")
#Débuggage Taxonomy
TAX3 <- read.csv("TaxonomyFlower (1).csv")
rownames(TAX3) <- TAX3[1:nrow(TAX3),1]
TAX3=TAX3[,-1]
colnames(TAX3)[0]="#NAME"
write.csv(TAX3,"TaxonomyFlower_real.csv")
#Débuggage metadata
META2 <- read.table("MetaFlower.txt")
colnames(META2)[1]="#NAME"
#rownames(META2)=NULL On test
write.table(META2,"MetaFlower_real.txt") #Comme dans le MetaFlower originel ya 2 colonnes de samples: on verra


TAX4=rownames_to_column(TAX4,var="#NAME") %>% head
