## Build OpenCV for Android
### 0. Requirements
* Linux OS (Ubuntu or other Debian-based OS)
* [Android NDK r19c](https://developer.android.com/ndk/downloads)
* [Android SDK](https://developer.android.com/studio) (include in Android Studio) or [Here: android-sdk_r24.4.1-linux.tgz](http://tools.android-studio.org/index.php/sdk)
* [Apache Ant](https://ant.apache.org/) and JDK (for libopencv_java.so)
* CMake >=2.8, Python
* [OpenCV](https://github.com/opencv/opencv/releases), [OpenCV_contrib](https://github.com/opencv/opencv_contrib/releases) (here use 3.4.5)

### 1. Installation

```
$ export ANDROID_NDK_PATH=[your ndk path]
# such as: export ANDROID_NDK_PATH=/home/xxx/android-ndk-r19c
$ sudo apt-get install build-essential cmake pkg-config ffmpeg
$ cd opencv-3.4.5
$ mkdir build
$ cd build
# build for static lib and libopencv_java3.so
# ANDROID_ABI could be changed (such as "x86" "x86_64" "armeabi" "arm64-v8a" "armeabi-v7a" "mips" "mips64")
$ cmake -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
        -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK_ROOT}/build/cmake/android.toolchain.cmake" \
        -DANDROID_NDK="${ANDROID_NDK_ROOT}" \
        -DANDROID_NATIVE_API_LEVEL=21 \
        -DANDROID_ABI="arm64-v8a" \
        -DBUILD_FAT_JAVA_LIB=ON \
        -DBUILD_opencv_java=ON \
        -DWITH_CUDA=OFF \
        -DWITH_MATLAB=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_ANDROID_EXAMPLES=OFF \
        -DBUILD_ANDROID_PROJECTS=OFF \
        -DBUILD_DOCS=OFF \
        -DBUILD_PERF_TESTS=OFF \
        -DBUILD_TESTS=OFF \
        -DANT_EXECUTABLE="/usr/bin/ant" \
        -DOPENCV_EXTRA_MODULES_PATH="/path_to_contrib/opencv_contrib-3.4.5/modules/" \
        -DCMAKE_INSTALL_PREFIX="./build/static-lib/opencv-3.4.5-android-sdk" \

# build for dynamic link lib
$ cmake -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
        -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK_ROOT}/build/cmake/android.toolchain.cmake" \
        -DANDROID_NDK="${ANDROID_NDK_ROOT}" \
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
        -DOPENCV_EXTRA_MODULES_PATH="/path_to_contrib/opencv_contrib-3.4.5/modules/" \
        -DCMAKE_INSTALL_PREFIX="./build/shared-lib/opencv-3.4.5-android-sdk" \
```

next 


```
make -j8
make install
```


The final library will be located in 
```
[opencv_source_code_path]/build/shared-lib/opencv-3.4.5-android-sdk
and 
[opencv_source_code_path]/build/static-lib/opencv-3.4.5-android-sdk
```

### Note:
* **DCMAKE_TOOLCHAIN_FILE** path is used in ${ANDROID_NDK_ROOT} folder
* ~~opencv-3.4.5/platforms/android/android.toolchain.cmake~~ is useless for android-ndk-19
* (not recommend): [An interactive script to download and build OpenCV and OpenCV contrib for Android ](https://github.com/tzutalin/build-opencv-for-android)
* could use cmake-gui to show the information about ***android.toolchain.cmake*** file, but should not recommend to build for android sdk
* **ANT_EXECUTABLE** must be setted in cmake command (for libopencv_java3.so)
