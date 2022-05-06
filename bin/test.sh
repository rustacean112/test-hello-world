#!/usr/bin/env bash

hyperfine -w 15 "./hello-asm-static-string " "./hello-asm-dynamic-asm-string" "./hello-c-gcc" "./hello-cobol" "./hello-cpp-gcc" "./hello-fortran" "./hello-go" "./hello-rust" "./hello-c-clang" "./hello-cpp-clang" "./hello-v" "java Hello"

