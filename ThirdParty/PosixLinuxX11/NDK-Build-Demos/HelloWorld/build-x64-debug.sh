#!/bin/bash

cd "$(dirname "$(readlink -f "${0}")")"
 
target_name="a.out"
int_dir="obj/local/x86_64"
out_dir="../../../../Binary/x64/Debug"

# build by ndk
# rm -rf obj/local/x86_64
# rm -rf libs/x86_64
ndk-build APP_DEBUG:=true APP_ABI:=x86_64 NDK_PROJECT_PATH:=null NDK_OUT:=obj NDK_LIBS_OUT:=libs NDK_APPLICATION_MK:=Application.mk APP_BUILD_SCRIPT:=LinuxX11.mk 

# before execute change the rpath to \$ORIGIN    
chrpath -r '$ORIGIN' ${int_dir}/${target_name}

# mkdir the out dir if necessary
mkdir -p ${out_dir}

# copy the unstriped so to out dir
rm -rf ${out_dir}/${target_name}
cp -f ${int_dir}/${target_name} ${out_dir}/

# copy the gdb related
cp -f libs/x86_64/gdbserver ${out_dir}/
#cp -f libs/x86_64/gdb.setup ${out_dir}/

# change to cwd   
cd ${out_dir}

# execute the generated ${target_name}  
gdbserver :27077 ./${target_name}
#./gdbserver :27077 ./${target_name} # the gdbserver from ndk doesn't work



