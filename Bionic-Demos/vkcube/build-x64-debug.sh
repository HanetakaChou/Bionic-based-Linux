#!/bin/bash

cd "$(dirname "$(readlink -f "${0}")")"
 
target_name="vkcube"
int_dir="obj/local/x86_64"
out_dir="../../Binary/x64/Debug"

rm -rf generated
mkdir -p generated

# glslang
/system/bin64/glslangValidator -V cube.vert -x -o generated/cube.vert.inc
/system/bin64/glslangValidator -V cube.frag -x -o generated/cube.frag.inc

# include-bin
../include-bin/bin64/include-bin lunarg.ppm generated/lunarg.ppm.h
../include-bin/bin64/include-bin ../Assets/Lenna/l_hires-ASTC.pvr generated/ll_hires-ASTC.pvr.h

# build by ndk
rm -f ${int_dir}/${target_name}
ndk-build APP_DEBUG:=true APP_ABI:=x86_64 NDK_PROJECT_PATH:=null NDK_OUT:=obj NDK_LIBS_OUT:=libs NDK_APPLICATION_MK:=Application.mk APP_BUILD_SCRIPT:=LinuxX11.mk 

# before execute change the rpath to \$ORIGIN    
chrpath -r '$ORIGIN' ${int_dir}/${target_name}

# mkdir the out dir if necessary
mkdir -p ${out_dir}

# copy the unstriped so to out dir
rm -rf ${out_dir}/${target_name}
cp -f ${int_dir}/${target_name} ${out_dir}/  
