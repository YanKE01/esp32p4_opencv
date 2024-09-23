set(CMAKE_SYSTEM_NAME Generic)

set(CMAKE_C_COMPILER riscv32-esp-elf-gcc)
set(CMAKE_CXX_COMPILER riscv32-esp-elf-g++)
set(CMAKE_ASM_COMPILER riscv32-esp-elf-g++)

set(CMAKE_C_FLAGS "-Wno-frame-address -march=rv32imafc -mabi=ilp32f" CACHE STRING "C Compiler Base Flags")
set(CMAKE_CXX_FLAGS "-Wno-frame-address -march=rv32imafc -mabi=ilp32f --std=c++11 -fpermissive -imacros /home/yanke/project/esp32p4_opencv/stdint.h" CACHE INTERNAL "")
# set(CMAKE_CXX_FLAGS "-Wno-frame-address -march=rv32imafc -mabi=ilp32f --std=c++11 -fpermissive " CACHE INTERNAL "")

# 链接器标志
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -march=rv32imafc -mabi=ilp32f" CACHE STRING "Linker Flags")
