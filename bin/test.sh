#!/usr/bin/env bash

hyperfine -w 15 "./hello-asm-static-string " "./hello-asm-dynamic-string " "./hello-c-gcc" "./hello-cob" "./hello-cpp-gcc" "./hello-fortran" "./hello-go" "./hello-rust" "./hello-c-clang" "./hello-cpp-clang" "./hello-v" "java Hello"
