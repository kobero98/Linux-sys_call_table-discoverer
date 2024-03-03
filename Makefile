obj-m += the_usctm.o
the_usctm-objs += usctm.o ./lib/vtpmo.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules 
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
insmod:
	insmod the_usctm.ko
rmmod:
	rmmod the_usctm.ko
compile-extern:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD)/Module/Linux-sys_call_table-discoverer modules 
clean-extern:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD)/Module/Linux-sys_call_table-discoverer clean
insmod-extern:
	insmod Module/Linux-sys_call_table-discoverer/the_usctm.ko
rmmod-extern:
	rmmod -f the_usctm.ko