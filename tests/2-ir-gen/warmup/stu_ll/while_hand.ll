; ModuleID = 'if.c'
define i32 @main() #0 {
	%1 = alloca i32
	%2 = alloca i32
	store i32 10, i32* %1
	store i32 0, i32* %2
	br label %9
3:
	%4 = load i32, i32* %2
	%5 = add i32 %4, 1
	store i32 %5, i32* %2
	%6 = load i32, i32* %2
	%7 = load i32, i32* %1
	%8 = add i32 %6, %7
	store i32 %8, i32* %1
	br label %9
9:
	%10 = load i32, i32* %2
	%11 = icmp slt i32 %10, 10
	br i1 %11, label %3, label %12
12:
	%13 = load i32, i32* %1
	ret i32 %13
}