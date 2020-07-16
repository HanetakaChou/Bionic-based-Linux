 
### install the rpms

[Prebuilt RPMs](https://github.com/YuqiaoZhang/Bionic-based-Linux/tree/rpms)    
   
### build by ndk
```
rm -rf obj/local/x86_64
rm -rf libs/x86_64
ndk-build APP_DEBUG:=your-built-type APP_ABI:=your-target-arch NDK_PROJECT_PATH:=null NDK_OUT:=obj NDK_LIBS_OUT:=libs NDK_APPLICATION_MK:=Application.mk APP_BUILD_SCRIPT:=Android.mk 
```

### before execute change the rpath to \$ORIGIN     
```
chrpath -r '$ORIGIN' libs/x86_64/a.out
```

### debug by vscode  
[launch.json](.vscode/launch.json)  
> set program to the a.out in obj instead of the one in libs  
> set miDebuggerArgs to --init-command=.../gdb.setup  
