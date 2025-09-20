#!/usr/bin/env bash
start_ns=$(date +%s%N)
for i in $(seq -w 0001 1000); do
ts=$(date +"%Y-%m-%d %H:%M:%S%z")
neutrinos=$((RANDOM % 11))

 {
    printf "Archivo: %s.txt\n" "$i"
    printf "Timestamp: %s\n" "$ts"
    printf "Neutrinos detectados: %d\n" "$neutrinos"
  } > "${i}.txt"

done

cat [0-9][0-9][0-9][0-9].txt > results.txt
end_ns=$(date +%s%N)
runtime_ns=$((end_ns - start_ns))
runtime_s=$(awk -v ns="$runtime_ns" 'BEGIN {printf "%.6f", ns/1e9}')
avg_s=$(awk -v tot="$runtime_s" 'BEGIN {printf "%.6f", tot/1000}')

{
  printf "Tiempo total: %s segundos\n" "$runtime_s"
  printf "Tiempo promedio por evento: %s segundos\n" "$avg_s"
} > performance.txt
