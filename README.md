# Sanktions-detektion

Baseret på opgave fra Specialisterne.

Python scriptet `GenFraudInfo.py` generer lister over fiktive bankkunder og saktionslister, som så bliver sammenlignet af et cobol program.

# Getting Started

## Påkræver

- GnuCobol - [Windows installer kan hentes her](https://superbol.eu/developers/windows/)

- Python 3.14 eller højer

## Generaring af input data

Åben comand prompt terminalen og naviger til mappen. \
Inde i mappen, kør python scripted:
```
python GenInputData.py
```

## Byg og kør programmet

Programmet kan bygges gennem comand promt terminalen.
Naviger til mappen og kør følgende komando:
```
cobbuild.bat <fil-navn>.cob [<fil-navn>.cob ...]
```
Flere cobol filer kan angives, hvor de alle bliver bygget, en efter en. \
Derefter kan programmet køres gennem terminalen ved at kalde:
```
cobrun.bat <fil-navn>
```

Programmet kan også bygges og køres gennem `Run Build Task` kommandoen inde i Visual Studio Code (genvejs-tasten er `Ctrl + Shift + B`).