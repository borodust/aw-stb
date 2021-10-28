cmake_minimum_required(VERSION 3.20)
project(stb.clawed)

set(LIBRARY_DIR ${CMAKE_CURRENT_SOURCE_DIR}/stb)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

if (MSVC)
    add_compile_options(/O2)
    set(TARGET_TRIPLE x86_64-pc-windows-gnu)
    if (NOT ANDROID_ABI)
      add_compile_options(/arch:AVX)
    endif()
else()
    add_compile_options(-O2)
    if (NOT ANDROID_ABI)
      set(TARGET_TRIPLE x86_64-pc-linux-gnu)
      add_compile_options(-mavx)
    else()
      set(TARGET_TRIPLE aarch64-linux-android)
      add_compile_options(-mfpu=neon)
    endif()
endif()

option(BUILD_SHARED_LIBS ON)

#
# IMAGE
#
set(IMAGE_TARGET stbi.clawed)
set(IMAGE_ADAPTER "image_adapter.${TARGET_TRIPLE}.c")

add_library(${IMAGE_TARGET} SHARED ${IMAGE_ADAPTER})

target_include_directories(${IMAGE_TARGET}
  PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../"
  PRIVATE "${LIBRARY_DIR}/")


#
# IMAGE WRITE
#
set(IMAGE_WRITE_TARGET stbiw.clawed)
set(IMAGE_WRITE_ADAPTER "image_write_adapter.${TARGET_TRIPLE}.c")

add_library(${IMAGE_WRITE_TARGET} SHARED ${IMAGE_WRITE_ADAPTER})

target_include_directories(${IMAGE_WRITE_TARGET}
  PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../"
  PRIVATE "${LIBRARY_DIR}/")
