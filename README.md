# TXMexportR

Application Shiny permettant d'exporter les unités lexicales (formes graphiques, lemmes, étiquettes morpho-syntaxiques...) présentes dans un corpus TXM après un étiquetage réalisé par le logiciel TreeTagger.

# Installation

Dans une session R ou bien RStudio :

```R
devtools::install_git("https://framagit.org/leodumont/txmexportr/")
```

Attention cela implique d'avoir préalablement installé et chargé le paquet `devtools` et que [git](https://git-scm.com/downloads) soit installé sur votre ordinateur :

```R
install.packages("devtools")
library(devtools)
```

# Utilisation

```R
library(txmexportr)
launchApp()
```

Il n'y alors plus qu'à utiliser l'interface graphique.
Attention les temps d'exécution sont très longs, tant qu'une roue apparaît en haut à droite de l'interface, c'est que la récupération des unités lexicales n'est pas terminée.

![Capture d'écran de TXMexporteR](ss_TXMexporteR.png "Capture d'écran de TXMexporteR")

## Taille des fichiers XML
Dans la version actuelle du package les fichiers XML à importer sont limités à une taille de 50 mo. Pour augmenter celle-ci, il est possible de modifier la variable suivante avant de lancer le shiny :

```R
# pour passer la limite à 60 mo
options(shiny.maxRequestSize = 60*1024^2)
```
