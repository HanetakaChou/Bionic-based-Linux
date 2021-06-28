all: generated/cube.vert.inc generated/cube.frag.inc generated/lunarg.ppm.h generated/lenna.h
	
generated/cube.vert.inc : cube.vert
	glslangValidator -V cube.vert -x -o generated/cube.vert.inc

generated/cube.frag.inc : cube.frag
	glslangValidator -V cube.frag -x -o generated/cube.frag.inc

generated/lunarg.ppm.h : lunarg.ppm
	../include-bin/bin64/include-bin lunarg.ppm generated/lunarg.ppm.h

generated/lenna.h : ../Assets/Lenna/l_hires-DirectXTex.dds
	../include-bin/bin64/include-bin ../Assets/Lenna/l_hires-DirectXTex.dds generated/lenna.h


