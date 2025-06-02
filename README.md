# RISC CPU Architecture Overview

## INTRODUCE
A **RISC (Reduced Instruction Set Computer) CPU** is designed to execute a minimal set of simple instructions with high efficiency, ensuring sequential program execution based on simplified processing principles. The CPU performs the following core operations:
### Bảng mã Opcode và hoạt động

| Opcode | Mã  | Hoạt động | Output |
|--------|-----|-----------|--------|
| **HLT** | 000 | Dừng hoạt động chương trình | `inA` |
| **SKZ** | 001 | Kiểm tra kết quả của ALU: nếu bằng 0 thì bỏ qua lệnh tiếp theo, ngược lại thực thi bình thường | `inA` |
| **ADD** | 010 | Cộng giá trị trong Accumulator với giá trị tại địa chỉ bộ nhớ trong lệnh, kết quả trả về Accumulator | `inA + inB` |
| **AND** | 011 | Thực hiện phép AND giữa giá trị trong Accumulator và giá trị tại địa chỉ bộ nhớ, kết quả trả về Accumulator | `inA AND inB` |
| **XOR** | 100 | Thực hiện phép XOR giữa giá trị trong Accumulator và giá trị tại địa chỉ bộ nhớ, kết quả trả về Accumulator | `inA XOR inB` |
| **LDA** | 101 | Đọc giá trị từ địa chỉ trong lệnh và đưa vào Accumulator | `inB` |
| **STO** | 110 | Ghi dữ liệu từ Accumulator vào địa chỉ trong lệnh | `inA` |
| **JMP** | 111 | Nhảy không điều kiện đến địa chỉ đích trong lệnh và tiếp tục thực thi chương trình | `inA` |
