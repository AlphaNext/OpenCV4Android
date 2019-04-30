#!/bin/bash
cmake -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
      -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK_APTH}/android-ndk-r19c/build/cmake/android.toolchain.cmake" \
      -DANDROID_NDK="${ANDROID_NDK_PATH}" \
      -DANDROID_NATIVE_API_LEVEL=21 \
      -DANDROID_ABI="arm64-v8a" \
      -DBUILD_FAT_JAVA_LIB=OFF \
      -DBUILD_opencv_java=ON \
      -DWITH_CUDA=OFF \
      -DWITH_MATLAB=OFF \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=ON \
      -DBUILD_ANDROID_EXAMPLES=OFF \
      -DBUILD_ANDROID_PROJECTS=OFF \
      -DBUILD_DOCS=OFF \
      -DBUILD_PERF_TESTS=OFF \
      -DBUILD_TESTS=OFF \
      -DANT_EXECUTABLE="/usr/bin/ant" \
      -DOPENCV_EXTRA_MODULES_PATH="/home/xxx/Downloads/opencv_contrib-3.4.5/modules/" \
      -DCMAKE_INSTALL_PREFIX="/home/xxx/Downloads/opencv-3.4.5-android-sdk" \
      ..
