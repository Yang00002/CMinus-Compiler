; ModuleID = 'cminus'
source_filename = "/home/yang/lab1/2024ustc-jianmu-compiler/tests/testcases_general/18-global_var.cminus"

@a = global i32 0
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  store i32 10, i32* @a
  %op0 = load i32, i32* @a
  ret i32 %op0
}
