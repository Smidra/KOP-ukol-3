#!/bin/bash

# --- New kopac ---
# python main.py ${KDE_JE_ZADANI} ${KAM_ULOZIT_VYSLEDEK_SOL} ${KAM_ULOZIT_VYSLEDEK_COMPLEXITY} ${KDE_JE_KONTROLNI_VYSLEDEK} ${KAM_ULOZIT_SUMMARY} ${JAKY_SOLVER}
# python main.py ${1}             ${2}                       ${3}                              ${4}                         ${5}                  ${6}

# Setup of python
TYPE="GEN"
ALG="redux"

# Setup of generator
THINGS=5        # total number of things
INSTANCES=150    # generate this much of knapsack instances
MAX_WEIGHT=5000  # Maxmimum weight of a thing
MAX_COST=5000    # Maxmimum cost of a thing
PERMUTATIONS=10
# Optional
CAPACITY_TO_SUM_WEIGHT=0.8  # -m Ratio of capacity to sum weight. Default [0.8]. Can be interval.
HEAVY_THINGS="bal"  # -w More *heavy*, *light* or *bal*anced things [bal]
CORELATION="strong"    # -c Weight-cost correlation *uni*, *cor*, *strong* [uni]
GRANULARITY="1"     # -k Granularity. -w must be set. [1]
mkdir -p "./data/GEN/"

# Generator paths
GENERATING_NAME="${THINGS}-${INSTANCES}_(w${MAX_WEIGHT}c${MAX_COST})[m${CAPACITY_TO_SUM_WEIGHT}w${HEAVY_THINGS}c${CORELATION}k${GRANULARITY}]"
GENERATING_PATH="./data/${TYPE}/${GENERATING_NAME}"

# Prepare arguments for python script
mkdir -p "./calculated_${ALG}"
                 KDE_JE_ZADANI="${GENERATING_PATH}_inst.dat"
       KAM_ULOZIT_VYSLEDEK_SOL="./calculated_${ALG}/${GENERATING_NAME}_solution.dat"
KAM_ULOZIT_VYSLEDEK_COMPLEXITY="./calculated_${ALG}/${GENERATING_NAME}_complexity.dat"
     KDE_JE_KONTROLNI_VYSLEDEK="${GENERATING_PATH}_sol.dat"
            KAM_ULOZIT_SUMMARY="./calculated_${ALG}/${GENERATING_NAME}_summary"
                  JAKY_SOLVER="${ALG}"


# Generate instances with generator -- do it only once
# echo ./hen/kg2 -n "$THINGS" -N "$INSTANCES" -W "$MAX_WEIGHT" -C "$MAX_COST" -m "$CAPACITY_TO_SUM_WEIGHT" -w "$HEAVY_THINGS" -c "$CORELATION" -k "$GRANULARITY"
if [ ! -f "${GENERATING_PATH}_sol.dat" ]; then
  ./gen/kg2 -n "$THINGS" -N "$INSTANCES" -W "$MAX_WEIGHT" -C "$MAX_COST" -m "$CAPACITY_TO_SUM_WEIGHT" -w "$HEAVY_THINGS" -c "$CORELATION" -k "$GRANULARITY" > "${GENERATING_PATH}_inst.dat"
  cat "${GENERATING_PATH}_inst.dat" | ./gen/kg_perm -d 1000 -N "${PERMUTATIONS}" > "${GENERATING_PATH}_permut.dat"
fi

# Is there a solution file? If not, create it.
if [ ! -f "${GENERATING_PATH}_sol.dat" ]; then
  echo "${GENERATING_PATH}_sol.dat does not exist!"
  # The solution file does not exist, create it.
  python main.py "${GENERATING_PATH}_inst.dat" "${GENERATING_PATH}_sol.dat" "/dev/null" "/dev/null" "/dev/null" "dynamic"
  echo "${GENERATING_PATH}_sol.dat created!"
fi

# Start python script
python main.py ${KDE_JE_ZADANI} ${KAM_ULOZIT_VYSLEDEK_SOL} ${KAM_ULOZIT_VYSLEDEK_COMPLEXITY} ${KDE_JE_KONTROLNI_VYSLEDEK} ${KAM_ULOZIT_SUMMARY} ${JAKY_SOLVER}

echo "========================================="
echo "Solved with ${JAKY_SOLVER}."
echo "N= $THINGS"
echo "Generated instances: ${GENERATING_NAME}"