cd tests/2-ir-gen/warmup/c_cases
clang -S -emit-llvm assign.c -o 1.ll
lli 1.ll
echo $?
clang -S -emit-llvm fun.c -o 1.ll
lli 1.ll
echo $?
clang -S -emit-llvm if.c -o 1.ll
lli 1.ll
echo $?
clang -S -emit-llvm while.c -o 1.ll
lli 1.ll
echo $?
rm 1.ll
cd -