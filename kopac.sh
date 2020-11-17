#!/bin/bash

# kopac.sh KDE_JE_ZADANI  KAM_ULOZIT_VYSLEDEK   KDE_JE_KONTROLNI_VYSLEDEK

#python main.py ./data/NR4_inst.dat ./calculated/NK4_solution.dat ./calculated/NK4_complexity.dat
#diff ./data/NK4_sol.dat ./calculated/NK4_solution.dat


ZADANI=$1
ULOZIT=$2
KONTROLNI_VYSLEDEK=$3

# echo "=> Kopu ${ZADANI}"
python main.py "${ZADANI}" "${ULOZIT}_solution.dat" "${ULOZIT}_complexity.dat" "${KONTROLNI_VYSLEDEK}" "$4"

# echo "=> Diff solutions ${INSTANCES}_sol.dat (empty OK)"
# diff "${KONTROLNI_VYSLEDEK}" "${ULOZIT}_solution.dat"
# echo "=> Kopac end"

#INSTANCES=$1
#echo "=> Kopu ${INSTANCES}_inst.dat"
#python main.py "./data/${INSTANCES}_inst.dat" "./calculated/${INSTANCES}_solution.dat" "./calculated/${INSTANCES}_complexity.dat"
#echo "=> Diff solutions ${INSTANCES}_sol.dat (empty OK)"
#diff "./data/${2}_sol.dat" "./calculated/${INSTANCES}_solution.dat"
#echo "=> Kopac end"