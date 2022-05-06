.SILENT: compile-java compile-c-gcc compile-cpp-gcc compile-fortran compile-js compile-lua compile-perl compile-python compile-ruby compile-rust compile-v compile-go compile-cobol compile-asm-with-dynamic-string compile-asm-with-static-string compile-cpp-clang compile-c-clang compile-all clean-bin

compile-java: Hello.java
	javac java/Hello.java -d bin

compile-c-gcc:
	CFLAGS="-O2 -march=skylake -pipe" gcc c/hello.c -o bin/"hello-c-gcc"
	
compile-c-clang:
	CFLAGS="-O2 -march=skylake" clang c/hello.c -o bin/"hello-c-clang"
	
compile-cobol:
	cobc -x -o bin/hello-cobol cobol/hello.cob
	
compile-cpp-gcc:
	CXXFLAGS="-O2 -march=skylake -pipe" g++ cpp/hello.cpp -o bin/"hello-cpp-gcc"
	
compile-cpp-clang:
	CXXFLAGS="-O2 -march=skylake" clang++ cpp/hello.cpp -o bin/"hello-cpp-clang"
	
compile-fortran:
	gfortran fortran/hello.f90 -o bin/"hello-fortran"
	
compile-go:
	go build -o bin/"hello-go" go/hello.go

compile-rust:
	rustc rust/hello.rs -o bin/"hello-rust"

compile-v: 
	v v/hello.v -o bin/"hello-v"
	
compile-asm-with-dynamic-string:
	nasm -f elf64 asm/hello-dynamic-string.asm && ld asm/hello-dynamic-string.o -o bin/hello-asm-dynamic-asm-string && rm asm/hello-dynamic-string.o

compile-asm-with-static-string:
	nasm -f elf64 asm/hello-static-string.asm && ld asm/hello-static-string.o -o bin/hello-asm-static-string && rm asm/hello-static-string.o

compile-all:
	nasm -f elf64 asm/hello-static-string && ld asm/hello-static-string.o -o bin/hello-asm-static-string && rm asm/hello-static-string
	nasm -f elf64 asm/hello-dynamic-string && ld asm/hello-dynamic-string.o -o bin/hello-asm-dynamic-asm-string && rm asm/hello-dynamic-string
	v v/hello.v -o bin/"hello-v"
	rustc rust/hello.rs -o bin/"hello-rust"
	go build -o bin/"hello-go" go/hello.go
	gfortran fortran/hello.f90 -o bin/"hello-fortran"
	CXXFLAGS="-O2 -march=skylake" clang++ cpp/hello.cpp -o bin/"hello-cpp-clang"
	CXXFLAGS="-O2 -march=skylake -pipe" g++ cpp/hello.cpp -o bin/"hello-cpp-gcc"
	cobc -x -o bin/hello-cobol cobol/hello.cob
	CFLAGS="-O2 -march=skylake" clang c/hello.c -o bin/"hello-c-clang"
	CFLAGS="-O2 -march=skylake -pipe" gcc c/hello.c -o bin/"hello-c-gcc"
	javac java/Hello.java -d bin

clean-bin:
	rm -rf bin/hello* && rm -rf bin/Hello*

compile-js:
	bash -c "time node javascript/hello.js"	

compile-lua:
	bash -c "time lua lua/hello.lua"
	
compile-perl:
	bash -c "time perl perl/hello.pl"
	
compile-python:
	bash -c "time python3 python/hello.py"

compile-ruby:
	bash -c "time ruby ruby/hello.rb"
