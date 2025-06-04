; ModuleID = 'assign.c'
define i32 @main() #0 {
	%1 = alloca [4 x i32]
	%2 = getelementptr [4 x i32], [4 x i32]* %1, i32 0, i32 0
	store i32 10, i32* %2
	%3 = getelementptr [4 x i32], [4 x i32]* %1, i32 0, i32 1
	%4 = load i32, i32* %2
	%5 = mul i32 %4, 2
	store i32 %5, i32* %3
	%6 = load i32, i32* %3
	ret i32 %6
}