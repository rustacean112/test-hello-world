.SILENT: compile-java compile-c compile-cpp compile-fortran compile-js compile-lua compile-perl compile-python compile-ruby compile-rust compile-v compile-go compile-cobol compile-asm-with-dynamic-string compile-asm-with-static-string

compile-java: Hello.java
	javac java/Hello.java -d bin

compile-c: hello.c
	gcc c/hello.c -o bin/"hello-c-gcc"
	
compile-cobol:
	cobc -x -o bin/hello-cobol cobol/hello.cob
	
compile-cpp:
	g++ cpp/hello.cpp -o "hello-cpp-gpp"
	
compile-fortran:
	gfortran fortran/hello.f90 -o bin/"hello-fortran"
	
compile-go:
	go build -o bin/"hello-go" go/hello.go

compile-rust:
	rustc rust/hello.rs -o bin/"hello-rust"

compile-v: 
	v v/hello.v -o bin/"hello-v"
	
compile-asm-with-dynamic-string:
	nasm -f elf64 asm/hello.asm && ld asm/hello.o -o bin/hello-asm-string && rm asm/hello.o

compile-asm-with-static-string:
	nasm -f elf64 asm/hello-optimized.asm && ld asm/hello-optimized.o -o bin/hello-asm-static-string && rm asm/hello-optimized.o

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
