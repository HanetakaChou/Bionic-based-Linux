#!/bin/bash

cd "$(dirname "$(readlink -f "${0}")")"
 
target_name="vkcube"
int_dir="obj/local/x86"

rm -rf generated
mkdir -p generated

# glslang
/system/bin64/glslangValidator -V cube.vert -x -o generated/cube.vert.inc
/system/bin64/glslangValidator -V cube.frag -x -o generated/cube.frag.inc

# include-bin
../include-bin/bin64/include-bin lunarg.ppm generated/lunarg.ppm.h
../include-bin/bin64/include-bin ../Assets/Lenna/l_hires-DirectXTex.dds generated/ll_hires-ASTC.pvr.h

# build by ndk
rm -f ${int_dir}/${target_name}
ndk-build APP_DEBUG:=true APP_ABI:=x86 NDK_PROJECT_PATH:=null NDK_OUT:=obj NDK_LIBS_OUT:=libs NDK_APPLICATION_MK:=Application.mk APP_BUILD_SCRIPT:=LinuxX11.mk 

# before execute change the rpath to \$ORIGIN    
chrpath -r '$ORIGIN' ${int_dir}/${target_name}

# stdc++
rm -rf ${int_dir}/libstdc++.so 
ln -s libc++_shared.so ${int_dir}/libstdc++.so 