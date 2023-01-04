set -e

## Ensure we have the correct ROOT set
if [[ -z "$ROOT" ]]
then
	echo "Error: ROOT env var is not set. Set it to be base of the artifact."
	exit -1
fi

LLC_BASE=${ROOT}/llvm_14/bin/llc
OPT=${ROOT}/llvm_14/bin/opt
LLC_NEW=${ROOT}/llvm_15/bin/llc

## Check we have the needed binaries
if [[ ! -f "$LLC_BASE" || ! -f "$OPT" || ! -f "$LLC_NEW" ]]
then
	echo "Error: LLC and OPT binaries not found"
	exit -1
fi

SWIFT=swiftc
NUM_RUNS=10
repeats=(1 2 3 4 5)

# Run several times and get average running time
function time_it() {
    exe=$1
    sum=0.0
    for i in {1..${NUM_RUNS}}
    do
        /usr/bin/time  $exe 10000000 &> ${exe}.output
        running_time=`tail -1 ${exe}.output | awk '{print $1}'`
        sum=`echo "scale=2; $sum+$running_time" | bc`
    done
    avg_time=`echo "scale=2; $running_time /$NUM_RUNS" | bc`
    echo $avg_time
}

# Compile and then run the baseline
function baseline() {
    file=$1
    base=`basename $1 .swift`
    $SWIFT -Osize -emit-bc -o ${base}.bc ${file} &> /dev/null
    $OPT -code-model=small -Oz -cost-kind=code-size -o ${base}.opt.bc ${base}.bc
    $LLC_BASE -stats -filetype=obj -code-model=small -enable-machine-outliner=never -o  ${base}.baseline.o ${base}.opt.bc  &> ${base}.baseline.stats
    $SWIFT ${base}.baseline.o  -o ${base}.baseline
    #size -m ${base}.baseline | grep ""
    time_it ./${base}.baseline
}

# Compile and then run the optimized version (multiple outlining rounds)
function opt() {
    file=$1
    avg_baseline_runtime=$2
    base=`basename $1 .swift`
    baseline_size=`size -m ${base}.baseline | grep "Section __text: " | awk '{print $3}'`
    echo " Size (baseline)= $baseline_size bytes"

    $SWIFT -Osize -emit-bc -o ${base}.bc ${file}
    $OPT -code-model=small -Oz -cost-kind=code-size -o ${base}.opt.bc ${base}.bc
    
    for i in ${repeats[@]}
    do
        $LLC_NEW -stats -filetype=obj -code-model=small  -enable-machine-outliner=always -outline-repeat-count=${i} -enable-linkonceodr-outlining -o  ${base}.opt_${i}.o  ${base}.opt.bc &> ${base}.opt_${i}.stats
        $SWIFT ${base}.opt_${i}.o  -o ${base}.opt_${i} &> /dev/null
        opt_size=`size -m ${base}.opt_${i} | grep "Section __text: " | awk '{print $3}'`
        size_save=`echo "scale=2; ($baseline_size - $opt_size) * 100 / $baseline_size" | bc`
        avg_time=`time_it ./${base}.opt_${i}`
        #echo "scale=2; (${avg_time} - ${avg_baseline_runtime}) * 100 / ${avg_time}"
        slowdown=`echo "scale=2; (${avg_time} - ${avg_baseline_runtime}) * 100 / ${avg_time}" | bc`
        echo " Avg running time (Outlining rounds ${i})= ${avg_time} sec. Slowdown = ${slowdown}%"
        echo " Size (Outlining rounds ${i}) = ${opt_size} bytes. Size saving = ${size_save}%"

    done
}

#### List of single-file swift benchmarks
### Add more benchmarks as needed
for f in Z-algorithm.swift TopologicalSort.swift simann.swift RLE.swift OctTree.swift RedBlackTree.swift SplayTree.swift LCS.swift LRUCache.swift Knuth-Morris-Pratt.swift Huffman.swift HashTable.swift GCD.swift EncodeAndDecodeTree.swift Dijkstra.swift DFS.swift CountOccurences.swift Combinatorics.swift ClosestPair.swift BFS.swift Boyer-Moore-Horspool.swift CountingSort.swift StrassenMM.swift QuickSort.swift BucketSort.swift JSON.swift
do
    echo "***** benchmark $f *****"
	avg_time=`baseline $f`
    echo " Avg running time (baseline) = $avg_time sec"
	opt $f $avg_time
done
