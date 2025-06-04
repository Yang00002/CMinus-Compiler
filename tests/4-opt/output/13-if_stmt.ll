; ModuleID = 'cminus'
source_filename = "/home/yang/lab1/2024ustc-jianmu-compiler/tests/testcases_general/13-if_stmt.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @main() {
label_entry:
  %op0 = icmp ne i32 2, 0
  br i1 %op0, label %label_1, label %label_2
label_1:                                                ; preds = %label_entry
  br label %label_2
label_2:                                                ; preds = %label_entry, %label_1
  ret void
}
