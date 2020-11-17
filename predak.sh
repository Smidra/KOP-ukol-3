#!/bin/bash

TYPE="ZKC"
ALG="redux"
INSTANCES=10
bash kopac.sh "./data/${TYPE}/${TYPE}${INSTANCES}_inst.dat" "./calculated_${ALG}/${TYPE}${INSTANCES}" "./data/${TYPE}/${TYPE}${INSTANCES}_sol.dat" "./calculated_${ALG}/${TYPE}_summary"
INSTANCES=15
bash kopac.sh "./data/${TYPE}/${TYPE}${INSTANCES}_inst.dat" "./calculated_${ALG}/${TYPE}${INSTANCES}" "./data/${TYPE}/${TYPE}${INSTANCES}_sol.dat" "./calculated_${ALG}/${TYPE}_summary"
INSTANCES=20
bash kopac.sh "./data/${TYPE}/${TYPE}${INSTANCES}_inst.dat" "./calculated_${ALG}/${TYPE}${INSTANCES}" "./data/${TYPE}/${TYPE}${INSTANCES}_sol.dat" "./calculated_${ALG}/${TYPE}_summary"
INSTANCES=22
bash kopac.sh "./data/${TYPE}/${TYPE}${INSTANCES}_inst.dat" "./calculated_${ALG}/${TYPE}${INSTANCES}" "./data/${TYPE}/${TYPE}${INSTANCES}_sol.dat" "./calculated_${ALG}/${TYPE}_summary"
INSTANCES=25
bash kopac.sh "./data/${TYPE}/${TYPE}${INSTANCES}_inst.dat" "./calculated_${ALG}/${TYPE}${INSTANCES}" "./data/${TYPE}/${TYPE}${INSTANCES}_sol.dat" "./calculated_${ALG}/${TYPE}_summary"
INSTANCES=27
bash kopac.sh "./data/${TYPE}/${TYPE}${INSTANCES}_inst.dat" "./calculated_${ALG}/${TYPE}${INSTANCES}" "./data/${TYPE}/${TYPE}${INSTANCES}_sol.dat" "./calculated_${ALG}/${TYPE}_summary"
INSTANCES=30
bash kopac.sh "./data/${TYPE}/${TYPE}${INSTANCES}_inst.dat" "./calculated_${ALG}/${TYPE}${INSTANCES}" "./data/${TYPE}/${TYPE}${INSTANCES}_sol.dat" "./calculated_${ALG}/${TYPE}_summary"
INSTANCES=32
bash kopac.sh "./data/${TYPE}/${TYPE}${INSTANCES}_inst.dat" "./calculated_${ALG}/${TYPE}${INSTANCES}" "./data/${TYPE}/${TYPE}${INSTANCES}_sol.dat" "./calculated_${ALG}/${TYPE}_summary"
INSTANCES=35
bash kopac.sh "./data/${TYPE}/${TYPE}${INSTANCES}_inst.dat" "./calculated_${ALG}/${TYPE}${INSTANCES}" "./data/${TYPE}/${TYPE}${INSTANCES}_sol.dat" "./calculated_${ALG}/${TYPE}_summary"

#INSTANCES=37
#bash kopac.sh "./data/${TYPE}/${TYPE}${INSTANCES}_inst.dat" "./calculated_${ALG}/${TYPE}${INSTANCES}" "./data/${TYPE}/${TYPE}${INSTANCES}_sol.dat" "./calculated_${ALG}/${TYPE}_summary"
#INSTANCES=40
#bash kopac.sh "./data/${TYPE}/${TYPE}${INSTANCES}_inst.dat" "./calculated_${ALG}/${TYPE}${INSTANCES}" "./data/${TYPE}/${TYPE}${INSTANCES}_sol.dat" "./calculated_${ALG}/${TYPE}_summary"
