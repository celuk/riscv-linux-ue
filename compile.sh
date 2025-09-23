set -e

#make clean;
#make mrproper;
#make distclean;
make ARCH=riscv CROSS_COMPILE=/media/shc/0EDEBC4906059163/tools/riscv-toolchain-linux/_install/bin/riscv32-unknown-linux-gnu- 32-bit.config;
make ARCH=riscv CROSS_COMPILE=/media/shc/0EDEBC4906059163/tools/riscv-toolchain-linux/_install/bin/riscv32-unknown-linux-gnu- -j16;
python3 /home/shc/projects/cva-soc/tools/bin2hex.py ./arch/riscv/boot/Image > ./arch/riscv/boot/Image.hex;
/media/shc/0EDEBC4906059163/tools/riscv-toolchain-linux/_install/bin/riscv32-unknown-linux-gnu-objdump -m riscv:rv32 -d vmlinux > vmlinux.dump;
/media/shc/0EDEBC4906059163/tools/riscv-toolchain-linux/_install/bin/riscv32-unknown-linux-gnu-objcopy -O verilog ./vmlinux ./vmlinux.vmem;
