/* Generated by :claw at 2021-09-16T20:20:16.603839Z */

#if defined(__cplusplus)
#include <new>
#endif

#define STB_IMAGE_IMPLEMENTATION 1

#include "stb_image.h"

#if !defined(__CLAW_API)
#  if defined(_WIN32)
#    define __CLAW_API __declspec(dllexport)
#  elif defined(__GNUC__)
#    define __CLAW_API __attribute__((visibility("default")))
#  else
#    define __CLAW_API
#  endif
#endif

#if defined(__cplusplus)
extern "C" {
#endif


__CLAW_API stbi__pngchunk* __claw_stbi__get_chunk_header(stbi__pngchunk* __claw_result_, stbi__context* s) {
// /home/borodust/devel/repo/aw-projects/aw-stb/src/lib/stb/stb_image.h:4535:23
(*__claw_result_) = stbi__get_chunk_header(s);
return __claw_result_;
}

#if defined(__cplusplus)
}
#endif
