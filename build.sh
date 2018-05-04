#!/usr/bin/env sh

# Fix for bug: http://ipxe-devel.ipxe.narkive.com/WTeTcwrO/gcc-defaults-to-pie
echo "CFLAGS	+= -fno-pie" >> arch/x86/Makefile.pcbios
echo "LDFLAGS	+= -no-pie" >> arch/x86/Makefile.pcbios

make all EMBED=defaults.ipxe

rm bin/*.o
rm bin/*.a
rm bin/*tmp*

ls -la bin/

#make bin/ipxe.usb EMBED=defaults.ipxe
#make bin/undionly.kpxe EMBED=defaults.ipxe

#make vmware

