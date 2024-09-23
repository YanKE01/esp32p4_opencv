#!/bin/bash

# Delete the current build directory
if [ -d "build" ]; then
  echo "Deleting existing build directory..."
  rm -rf build
fi

# Create a new build directory and enter it
echo "Creating new build directory..."
mkdir build
cd build

# Run cmake
echo "Running CMake configuration..."
cmake -DBUILD_SHARED_LIBS=OFF \
      -DCV_DISABLE_OPTIMIZATION=OFF \
      -DWITH_IPP=OFF \
      -DWITH_TBB=OFF \
      -DWITH_OPENMP=OFF \
      -DWITH_PTHREADS_PF=OFF \
      -DWITH_QUIRC=OFF \
      -DWITH_1394=OFF \
      -DWITH_CUDA=OFF \
      -DWITH_OPENCL=OFF \
      -DWITH_OPENCLAMDFFT=OFF \
      -DWITH_OPENCLAMDBLAS=OFF \
      -DWITH_VA_INTEL=OFF \
      -DWITH_EIGEN=OFF \
      -DWITH_GSTREAMER=OFF \
      -DWITH_GTK=OFF \
      -DWITH_JASPER=OFF \
      -DBUILD_JPEG=OFF \
      -DOPENJPEG_USE_THREAD=OFF \
      -DWITH_OPENJPEG=OFF \
      -DWITH_JPEG=OFF \
      -DWITH_WEBP=OFF \
      -DBUILD_ZLIB=ON \
      -DBUILD_PNG=ON \
      -DWITH_PNG=ON \
      -DWITH_TIFF=OFF \
      -DWITH_V4L=OFF \
      -DWITH_LAPACK=OFF \
      -DWITH_ITT=OFF \
      -DWITH_PROTOBUF=OFF \
      -DWITH_IMGCODEC_HDR=OFF \
      -DWITH_IMGCODEC_SUNRASTER=OFF \
      -DWITH_IMGCODEC_PXM=OFF \
      -DWITH_IMGCODEC_PFM=OFF \
      -DBUILD_LIST=core,imgproc,imgcodecs \
      -DBUILD_JAVA=OFF \
      -DBUILD_opencv_python=OFF \
      -DBUILD_opencv_java=OFF \
      -DBUILD_opencv_apps=OFF \
      -DBUILD_PACKAGE=OFF \
      -DBUILD_PERF_TESTS=OFF \
      -DBUILD_TESTS=OFF \
      -DCV_ENABLE_INTRINSICS=OFF \
      -DCV_TRACE=OFF \
      -DOPENCV_ENABLE_MEMALIGN=OFF \
      -DCMAKE_TOOLCHAIN_FILE=/home/yanke/project/esp32p4_opencv/toolchain-esp32.cmake \
      ..

make -j8

echo "CMake configuration completed."

# Moving the product to the lib path of esp32p4

if [ -d "lib" ]; then
    cp -r lib/* ../esp32p4/lib/release_build/opencv/
fi

if [ -d "3rdparty" ]; then
    cp -r 3rdparty/lib/* ../esp32p4/lib/release_build/opencv/3rdparty/
fi

if [ -d "opencv2" ]; then
    cp -r opencv2/* ../esp32p4/lib/release_build/opencv/opencv2/
fi

cd ..

if [ -d "modules/core/include/opencv2" ]; then
    cp -r modules/core/include/opencv2/* esp32p4/lib/release_build/opencv/opencv2/
fi

if [ -d "modules/imgcodecs/include/opencv2" ]; then
    cp -r modules/imgcodecs/include/opencv2/* esp32p4/lib/release_build/opencv/opencv2/
fi

if [ -d "modules/imgproc/include/opencv2" ]; then
    cp -r modules/imgproc/include/opencv2/* esp32p4/lib/release_build/opencv/opencv2/
fi

if [ -d "include/opencv2" ]; then
    cp -r include/opencv2/* esp32p4/lib/release_build/opencv/opencv2/
fi

echo "Build opencv for ESP32P4 completed."