set(CMAKE_SYSTEM_NAME Generic)

set(CMAKE_C_COMPILER /home/yanke/.espressif/tools/riscv32-esp-elf/esp-14.2.0_20240906/riscv32-esp-elf/bin/riscv32-esp-elf-gcc)
set(CMAKE_CXX_COMPILER /home/yanke/.espressif/tools/riscv32-esp-elf/esp-14.2.0_20240906/riscv32-esp-elf/bin/riscv32-esp-elf-g++)
set(CMAKE_ASM_COMPILER /home/yanke/.espressif/tools/riscv32-esp-elf/esp-14.2.0_20240906/riscv32-esp-elf/bin/riscv32-esp-elf-gcc)

set(CMAKE_C_FLAGS "-Wno-frame-address -march=rv32imafc -mabi=ilp32f" CACHE STRING "C Compiler Base Flags")
set(CMAKE_CXX_FLAGS "-Wno-frame-address -march=rv32imafc -mabi=ilp32f --std=c++11 -fpermissive -imacros ${CMAKE_SOURCE_DIR}/preprocess.h" CACHE INTERNAL "")

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -march=rv32imafc -mabi=ilp32f" CACHE STRING "Linker Flags")
