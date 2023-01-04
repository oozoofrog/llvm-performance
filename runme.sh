#!/bin/bash
set -e
ROOT=`pwd`

## BUILD LLVM
function build_llvm() {
  cmake -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS=clang -DLLVM_FORCE_ENABLE_STATS:BOOL=ON -G "Ninja" ../llvm-project/llvm
  ninja
}

git reset --hard
git clean -fdx

echo "Installing..."
rm -rf ./llvm-project
# First compile the original LLVM project https://github.com/llvm/llvm-project.git with GITSHA 3bd4b5a925bd5bd5a5498d8d84596ec099e9c198
git clone https://github.com/llvm/llvm-project.git
cd ${ROOT}/llvm-project
git switch release/14.x
cd ${ROOT}
mkdir -p llvm_14
cd llvm_14
build_llvm

## Now build our patched version
cd ${ROOT}/llvm-project
git switch release/15.x
cd ${ROOT}
mkdir -p llvm_15
cd llvm_15
build_llvm

## Benchmarks
echo "Running benchmarks..."
cd ${ROOT}/benchmarks
. run.sh

## Apps
#echo "Running Apps..."
#cd ${ROOT}/apps
#. run.sh
