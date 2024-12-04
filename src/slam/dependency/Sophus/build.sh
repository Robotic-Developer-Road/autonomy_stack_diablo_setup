rm -rf build 
mkdir build install && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=../install
make -j4
make install