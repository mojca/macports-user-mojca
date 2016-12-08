Build instructions:
* https://sourceforge.net/p/mingw-w64/mingw-w64/ci/master/tree/mingw-w64-doc/howto-build/

* https://wiki.debian.org/Mingw-W64
* https://packages.debian.org/sid/gcc-mingw-w64-i686

# List of required packages

* Host Support Libraries
  * GNU MP Bignum Library (already packaged, gmp)
    * Depended by: MPC, MPFR, PPL, CLooG
  * MPFR (already packaged, mpfr)
    * Depends on GMP
  * MPC (already packaged, libmpc)
    * Depends on GMP
  * The Parma Polyhedra Library – PPL (already packaged, ppl, unmaintained, outdated)
    * Optional
    * Depends on GMP
    * Dependent by: CLooG
      * build CLoog with `--with-ppl=<PPL install prefix>`
* Target Support Libraries
  * pthreads-win32
    * optional, Required for GCC libgomp support
  * ADA Bootstrap Phase
  * MinGW-w64 cross Binutils

# Packages installed by MacPorts

### i686-w64-mingw32-binutils

    /opt/local/bin/i686-w64-mingw32-*
    /opt/local/i686-w64-mingw32/bin/
    /opt/local/i686-w64-mingw32/host/*.h
    /opt/local/i686-w64-mingw32/lib/ldscripts/
    /opt/local/share/doc/i686-w64-mingw32-binutils/
    /opt/local/share/info/i686-w64-mingw32-*.info
    /opt/local/share/man/man1/i686-w64-mingw32-*.1.gz

### i686-w64-mingw32-headers

    /opt/local/i686-w64-mingw32/include/

(Note that Debian installs under

    /usr/share/mingw-w64/include

for both architectures in a package `mingw-w64-common`.)

# Packages installed by Debian


* binutils-mingw-w64 - Cross-binutils for Win32 and Win64 using MinGW-w64
* binutils-mingw-w64-i686 - Cross-binutils for Win32 (x86) using MinGW-w64
* binutils-mingw-w64-x86-64 - Cross-binutils for Win64 (x64) using MinGW-w64

* g++-mingw-w64 - GNU C++ compiler for MinGW-w64
* g++-mingw-w64-i686 - GNU C++ compiler for MinGW-w64 targeting Win32
* g++-mingw-w64-x86-64 - GNU C++ compiler for MinGW-w64 targeting Win64

* gcc-mingw-w64 - GNU C compiler for MinGW-w64
  * installs just copyright
  * depends on gcc-mingw-w64-i686, gcc-mingw-w64-x86-64
  * recommends g++-mingw-w64, gfortran-mingw-w64, gnat-mingw-w64
* gcc-mingw-w64-base - GNU Compiler Collection for MinGW-w64 (base package)
* gcc-mingw-w64-i686 - GNU C compiler for MinGW-w64 targeting Win32
  * depends on binutils-mingw-w64-i686, gcc-mingw-w64-base, mingw-w64-i686-dev
    libatomic1, libc, libgcc, libgmp10, libisl15, libmpc3, libmpfr4,
    libstdc++6, 
* gcc-mingw-w64-x86-64 - GNU C compiler for MinGW-w64 targeting Win64

* gdb-mingw-w64 - Cross-debugger for Win32 and Win64 using MinGW-w64
* gdb-mingw-w64-target - Cross-debugger server for Win32 and Win64 using MinGW-w64

* gfortran-mingw-w64 - GNU Fortran compiler for MinGW-w64
* gfortran-mingw-w64-i686 - GNU Fortran compiler for MinGW-w64 targeting Win32
* gfortran-mingw-w64-x86-64 - GNU Fortran compiler for MinGW-w64 targeting Win64

* gnat-mingw-w64 - GNU Ada compiler for MinGW-w64
* gnat-mingw-w64-base - GNU Ada compiler for MinGW-w64 (base package)
* gnat-mingw-w64-i686 - GNU Ada compiler for MinGW-w64 targeting Win32
* gnat-mingw-w64-x86-64 - GNU Ada compiler for MinGW-w64 targeting Win64

* gobjc++-mingw-w64 - GNU Objective-C++ compiler for MinGW-w64
* gobjc++-mingw-w64-i686 - GNU Objective-C++ compiler for MinGW-w64 targeting Win32
* gobjc++-mingw-w64-x86-64 - GNU Objective-C++ compiler for MinGW-w64 targeting Win64
* gobjc-mingw-w64 - GNU Objective-C compiler for MinGW-w64
* gobjc-mingw-w64-i686 - GNU Objective-C compiler for MinGW-w64 targeting Win32
* gobjc-mingw-w64-x86-64 - GNU Objective-C compiler for MinGW-w64 targeting Win64

* mingw-w64 - Development environment targetting 32- and 64-bit Windows
  * metapackage, installs just copyright
  * depends on g++-mingw-w64, gcc-mingw-w64
* mingw-w64-common - Common files for Mingw-w64
* mingw-w64-tools - Development tools for 32- and 64-bit Windows
* mingw-w64-i686-dev - Development files for MinGW-w64 targeting Win32
* mingw-w64-x86-64-dev - Development files for MinGW-w64 targeting Win64

### mingw-w64-common

````
/usr/share/mingw-w64/include/
````

### gcc-mingw-w64-i686

    /usr/bin/i686-w64-mingw32-cpp-posix
    /usr/bin/i686-w64-mingw32-cpp-win32
    /usr/bin/i686-w64-mingw32-gcc-6.2-posix
    /usr/bin/i686-w64-mingw32-gcc-6.2-win32
    /usr/bin/i686-w64-mingw32-gcc-ar-posix
    /usr/bin/i686-w64-mingw32-gcc-ar-win32
    /usr/bin/i686-w64-mingw32-gcc-nm-posix
    /usr/bin/i686-w64-mingw32-gcc-nm-win32
    /usr/bin/i686-w64-mingw32-gcc-posix
    /usr/bin/i686-w64-mingw32-gcc-ranlib-posix
    /usr/bin/i686-w64-mingw32-gcc-ranlib-win32
    /usr/bin/i686-w64-mingw32-gcc-win32
    /usr/bin/i686-w64-mingw32-gcov-posix
    /usr/bin/i686-w64-mingw32-gcov-tool-posix
    /usr/bin/i686-w64-mingw32-gcov-tool-win32
    /usr/bin/i686-w64-mingw32-gcov-win32
    /usr/lib/gcc/i686-w64-mingw32/6.2-posix/
    /usr/lib/gcc/i686-w64-mingw32/6.2-posix/include/
    /usr/lib/gcc/i686-w64-mingw32/6.2-posix/install-tools/
    /usr/lib/gcc/i686-w64-mingw32/6.2-posix/plugin/
    /usr/lib/gcc/i686-w64-mingw32/6.2-posix/plugin/include/
    /usr/lib/gcc/i686-w64-mingw32/6.2-win32/
    /usr/lib/gcc/i686-w64-mingw32/6.2-win32/include/
    /usr/lib/gcc/i686-w64-mingw32/6.2-win32/install-tools/
    /usr/lib/gcc/i686-w64-mingw32/6.2-win32/plugin/
    /usr/lib/gcc/i686-w64-mingw32/6.2-win32/plugin/include/
