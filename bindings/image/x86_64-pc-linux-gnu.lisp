(uiop:define-package :%stb.image (:use))
(uiop:define-package :aw-stb-image-bindings~pristine (:use :cl))
(common-lisp:in-package :aw-stb-image-bindings~pristine)

(defparameter %stb.image::+extern+ nil)

(defparameter %stb.image::+include-stb-image-h+ nil)

(defparameter %stb.image::+max-dimensions+ 16777216)

(defparameter %stb.image::+sse2+ nil)

(defparameter %stb.image::+thread-local+ nil)

(defparameter %stb.image::+version+ 1)

(defparameter %stb.image::+%case+ nil)

(defparameter %stb.image::+%hdr-buflen+ 1024)

(defparameter %stb.image::+%marker-none+ 255)

(defparameter %stb.image::+%x64-target+ nil)

(defparameter %stb.image::+%zfast-bits+ 9)

(defparameter %stb.image::+%zfast-mask+ 511)

(defparameter %stb.image::+%vertically-flip-on-load+ nil)

(defparameter %stb.image::+inline+ nil)

(declaim (inline %stb.image::convert-iphone-png-to-rgb))

(cffi:defcfun ("stbi_convert_iphone_png_to_rgb"
               %stb.image::convert-iphone-png-to-rgb)
              :void
              (%stb.image::flag-true-if-should-convert :int))

(declaim (inline %stb.image::failure-reason))

(cffi:defcfun ("stbi_failure_reason" %stb.image::failure-reason)
              claw-utils:claw-string)

(declaim (inline %stb.image::hdr-to-ldr-gamma))

(cffi:defcfun ("stbi_hdr_to_ldr_gamma" %stb.image::hdr-to-ldr-gamma)
              :void
              (%stb.image::gamma :float))

(declaim (inline %stb.image::hdr-to-ldr-scale))

(cffi:defcfun ("stbi_hdr_to_ldr_scale" %stb.image::hdr-to-ldr-scale)
              :void
              (%stb.image::scale :float))

(declaim (inline %stb.image::image-free))

(cffi:defcfun ("stbi_image_free" %stb.image::image-free)
              :void
              (%stb.image::retval-from-stbi-load
               (claw-utils:claw-pointer :void)))

(declaim (inline %stb.image::info))

(cffi:defcfun ("stbi_info" %stb.image::info)
              :int
              (%stb.image::filename claw-utils:claw-string)
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int)))

(cffi:defcstruct (%stb.image::|C:@SA@STBI-IO-CALLBACKS| :size 24))

(cffi:defctype %stb.image::io-callbacks
               (:struct %stb.image::|C:@SA@STBI-IO-CALLBACKS|))

(declaim (inline %stb.image::info-from-callbacks))

(cffi:defcfun ("stbi_info_from_callbacks"
               %stb.image::info-from-callbacks)
              :int
              (%stb.image::clbk
               (claw-utils:claw-pointer %stb.image::io-callbacks))
              (%stb.image::user (claw-utils:claw-pointer :void))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int)))

(cffi:defcstruct (%stb.image::%io-file :size 216))

(cffi:defctype %stb.image::file (:struct %stb.image::%io-file))

(declaim (inline %stb.image::info-from-file))

(cffi:defcfun ("stbi_info_from_file" %stb.image::info-from-file)
              :int
              (%stb.image::f
               (claw-utils:claw-pointer %stb.image::file))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int)))

(cffi:defctype %stb.image::uc :unsigned-char)

(declaim (inline %stb.image::info-from-memory))

(cffi:defcfun ("stbi_info_from_memory" %stb.image::info-from-memory)
              :int
              (%stb.image::buffer
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::len :int)
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int)))

(declaim (inline %stb.image::is-16-bit))

(cffi:defcfun ("stbi_is_16_bit" %stb.image::is-16-bit)
              :int
              (%stb.image::filename claw-utils:claw-string))

(declaim (inline %stb.image::is-16-bit-from-callbacks))

(cffi:defcfun ("stbi_is_16_bit_from_callbacks"
               %stb.image::is-16-bit-from-callbacks)
              :int
              (%stb.image::clbk
               (claw-utils:claw-pointer %stb.image::io-callbacks))
              (%stb.image::user (claw-utils:claw-pointer :void)))

(declaim (inline %stb.image::is-16-bit-from-file))

(cffi:defcfun ("stbi_is_16_bit_from_file"
               %stb.image::is-16-bit-from-file)
              :int
              (%stb.image::f
               (claw-utils:claw-pointer %stb.image::file)))

(declaim (inline %stb.image::is-16-bit-from-memory))

(cffi:defcfun ("stbi_is_16_bit_from_memory"
               %stb.image::is-16-bit-from-memory)
              :int
              (%stb.image::buffer
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::len :int))

(declaim (inline %stb.image::is-hdr))

(cffi:defcfun ("stbi_is_hdr" %stb.image::is-hdr)
              :int
              (%stb.image::filename claw-utils:claw-string))

(declaim (inline %stb.image::is-hdr-from-callbacks))

(cffi:defcfun ("stbi_is_hdr_from_callbacks"
               %stb.image::is-hdr-from-callbacks)
              :int
              (%stb.image::clbk
               (claw-utils:claw-pointer %stb.image::io-callbacks))
              (%stb.image::user (claw-utils:claw-pointer :void)))

(declaim (inline %stb.image::is-hdr-from-file))

(cffi:defcfun ("stbi_is_hdr_from_file" %stb.image::is-hdr-from-file)
              :int
              (%stb.image::f
               (claw-utils:claw-pointer %stb.image::file)))

(declaim (inline %stb.image::is-hdr-from-memory))

(cffi:defcfun ("stbi_is_hdr_from_memory"
               %stb.image::is-hdr-from-memory)
              :int
              (%stb.image::buffer
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::len :int))

(declaim (inline %stb.image::ldr-to-hdr-gamma))

(cffi:defcfun ("stbi_ldr_to_hdr_gamma" %stb.image::ldr-to-hdr-gamma)
              :void
              (%stb.image::gamma :float))

(declaim (inline %stb.image::ldr-to-hdr-scale))

(cffi:defcfun ("stbi_ldr_to_hdr_scale" %stb.image::ldr-to-hdr-scale)
              :void
              (%stb.image::scale :float))

(declaim (inline %stb.image::load))

(cffi:defcfun ("stbi_load" %stb.image::load)
              (claw-utils:claw-pointer %stb.image::uc)
              (%stb.image::filename claw-utils:claw-string)
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::channels-in-file
               (claw-utils:claw-pointer :int))
              (%stb.image::desired-channels :int))

(cffi:defctype %stb.image::us :unsigned-short)

(declaim (inline %stb.image::load-16))

(cffi:defcfun ("stbi_load_16" %stb.image::load-16)
              (claw-utils:claw-pointer %stb.image::us)
              (%stb.image::filename claw-utils:claw-string)
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::channels-in-file
               (claw-utils:claw-pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::load-16-from-callbacks))

(cffi:defcfun ("stbi_load_16_from_callbacks"
               %stb.image::load-16-from-callbacks)
              (claw-utils:claw-pointer %stb.image::us)
              (%stb.image::clbk
               (claw-utils:claw-pointer %stb.image::io-callbacks))
              (%stb.image::user (claw-utils:claw-pointer :void))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::channels-in-file
               (claw-utils:claw-pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::load-16-from-memory))

(cffi:defcfun ("stbi_load_16_from_memory"
               %stb.image::load-16-from-memory)
              (claw-utils:claw-pointer %stb.image::us)
              (%stb.image::buffer
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::len :int)
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::channels-in-file
               (claw-utils:claw-pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::load-from-callbacks))

(cffi:defcfun ("stbi_load_from_callbacks"
               %stb.image::load-from-callbacks)
              (claw-utils:claw-pointer %stb.image::uc)
              (%stb.image::clbk
               (claw-utils:claw-pointer %stb.image::io-callbacks))
              (%stb.image::user (claw-utils:claw-pointer :void))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::channels-in-file
               (claw-utils:claw-pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::load-from-file))

(cffi:defcfun ("stbi_load_from_file" %stb.image::load-from-file)
              (claw-utils:claw-pointer %stb.image::uc)
              (%stb.image::f
               (claw-utils:claw-pointer %stb.image::file))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::channels-in-file
               (claw-utils:claw-pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::load-from-file-16))

(cffi:defcfun ("stbi_load_from_file_16"
               %stb.image::load-from-file-16)
              (claw-utils:claw-pointer %stb.image::us)
              (%stb.image::f
               (claw-utils:claw-pointer %stb.image::file))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::channels-in-file
               (claw-utils:claw-pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::load-from-memory))

(cffi:defcfun ("stbi_load_from_memory" %stb.image::load-from-memory)
              (claw-utils:claw-pointer %stb.image::uc)
              (%stb.image::buffer
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::len :int)
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::channels-in-file
               (claw-utils:claw-pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::load-gif-from-memory))

(cffi:defcfun ("stbi_load_gif_from_memory"
               %stb.image::load-gif-from-memory)
              (claw-utils:claw-pointer %stb.image::uc)
              (%stb.image::buffer
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::len :int)
              (%stb.image::delays
               (claw-utils:claw-pointer
                (claw-utils:claw-pointer :int)))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::z (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::req-comp :int))

(declaim (inline %stb.image::loadf))

(cffi:defcfun ("stbi_loadf" %stb.image::loadf)
              (claw-utils:claw-pointer :float)
              (%stb.image::filename claw-utils:claw-string)
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::channels-in-file
               (claw-utils:claw-pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::loadf-from-callbacks))

(cffi:defcfun ("stbi_loadf_from_callbacks"
               %stb.image::loadf-from-callbacks)
              (claw-utils:claw-pointer :float)
              (%stb.image::clbk
               (claw-utils:claw-pointer %stb.image::io-callbacks))
              (%stb.image::user (claw-utils:claw-pointer :void))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::channels-in-file
               (claw-utils:claw-pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::loadf-from-file))

(cffi:defcfun ("stbi_loadf_from_file" %stb.image::loadf-from-file)
              (claw-utils:claw-pointer :float)
              (%stb.image::f
               (claw-utils:claw-pointer %stb.image::file))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::channels-in-file
               (claw-utils:claw-pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::loadf-from-memory))

(cffi:defcfun ("stbi_loadf_from_memory"
               %stb.image::loadf-from-memory)
              (claw-utils:claw-pointer :float)
              (%stb.image::buffer
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::len :int)
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::channels-in-file
               (claw-utils:claw-pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::set-flip-vertically-on-load))

(cffi:defcfun ("stbi_set_flip_vertically_on_load"
               %stb.image::set-flip-vertically-on-load)
              :void
              (%stb.image::flag-true-if-should-flip :int))

(declaim (inline %stb.image::set-flip-vertically-on-load-thread))

(cffi:defcfun ("stbi_set_flip_vertically_on_load_thread"
               %stb.image::set-flip-vertically-on-load-thread)
              :void
              (%stb.image::flag-true-if-should-flip :int))

(declaim (inline %stb.image::set-unpremultiply-on-load))

(cffi:defcfun ("stbi_set_unpremultiply_on_load"
               %stb.image::set-unpremultiply-on-load)
              :void
              (%stb.image::flag-true-if-should-unpremultiply :int))

(declaim (inline %stb.image::zlib-decode-buffer))

(cffi:defcfun ("stbi_zlib_decode_buffer"
               %stb.image::zlib-decode-buffer)
              :int
              (%stb.image::obuffer claw-utils:claw-string)
              (%stb.image::olen :int)
              (%stb.image::ibuffer claw-utils:claw-string)
              (%stb.image::ilen :int))

(declaim (inline %stb.image::zlib-decode-malloc))

(cffi:defcfun ("stbi_zlib_decode_malloc"
               %stb.image::zlib-decode-malloc)
              claw-utils:claw-string
              (%stb.image::buffer claw-utils:claw-string)
              (%stb.image::len :int)
              (%stb.image::outlen (claw-utils:claw-pointer :int)))

(declaim (inline %stb.image::zlib-decode-malloc-guesssize))

(cffi:defcfun ("stbi_zlib_decode_malloc_guesssize"
               %stb.image::zlib-decode-malloc-guesssize)
              claw-utils:claw-string
              (%stb.image::buffer claw-utils:claw-string)
              (%stb.image::len :int)
              (%stb.image::initial-size :int)
              (%stb.image::outlen (claw-utils:claw-pointer :int)))

(declaim (inline %stb.image::zlib-decode-malloc-guesssize-headerflag))

(cffi:defcfun ("stbi_zlib_decode_malloc_guesssize_headerflag"
               %stb.image::zlib-decode-malloc-guesssize-headerflag)
              claw-utils:claw-string
              (%stb.image::buffer claw-utils:claw-string)
              (%stb.image::len :int)
              (%stb.image::initial-size :int)
              (%stb.image::outlen (claw-utils:claw-pointer :int))
              (%stb.image::parse-header :int))

(declaim (inline %stb.image::zlib-decode-noheader-buffer))

(cffi:defcfun ("stbi_zlib_decode_noheader_buffer"
               %stb.image::zlib-decode-noheader-buffer)
              :int
              (%stb.image::obuffer claw-utils:claw-string)
              (%stb.image::olen :int)
              (%stb.image::ibuffer claw-utils:claw-string)
              (%stb.image::ilen :int))

(declaim (inline %stb.image::zlib-decode-noheader-malloc))

(cffi:defcfun ("stbi_zlib_decode_noheader_malloc"
               %stb.image::zlib-decode-noheader-malloc)
              claw-utils:claw-string
              (%stb.image::buffer claw-utils:claw-string)
              (%stb.image::len :int)
              (%stb.image::outlen (claw-utils:claw-pointer :int)))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--BMP-DATA| :size 36))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--CONTEXT| :size 224))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--GIF| :size 34928))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--GIF-LZW| :size 4))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--HUFFMAN| :size 1680))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--JPEG| :size 18568))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--PIC-PACKET| :size 3))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--PNG| :size 40))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--PNGCHUNK| :size 8))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--RESAMPLE| :size 48))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--RESULT-INFO| :size 12))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--ZBUF| :size 4096))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--ZHUFFMAN| :size 2020))

(cffi:defctype %stb.image::size-t :unsigned-long)

(cffi:defctype %stb.image::%bmp-data
               (:struct %stb.image::|C:@SA@STBI--BMP-DATA|))

(cffi:defctype %stb.image::%context
               (:struct %stb.image::|C:@SA@STBI--CONTEXT|))

(cffi:defctype %stb.image::%gif
               (:struct %stb.image::|C:@SA@STBI--GIF|))

(cffi:defctype %stb.image::%gif-lzw
               (:struct %stb.image::|C:@SA@STBI--GIF-LZW|))

(cffi:defctype %stb.image::%huffman
               (:struct %stb.image::|C:@SA@STBI--HUFFMAN|))

(cffi:defctype %stb.image::%jpeg
               (:struct %stb.image::|C:@SA@STBI--JPEG|))

(cffi:defctype %stb.image::%pic-packet
               (:struct %stb.image::|C:@SA@STBI--PIC-PACKET|))

(cffi:defctype %stb.image::%png
               (:struct %stb.image::|C:@SA@STBI--PNG|))

(cffi:defctype %stb.image::%pngchunk
               (:struct %stb.image::|C:@SA@STBI--PNGCHUNK|))

(cffi:defctype %stb.image::%resample
               (:struct %stb.image::|C:@SA@STBI--RESAMPLE|))

(cffi:defctype %stb.image::%result-info
               (:struct %stb.image::|C:@SA@STBI--RESULT-INFO|))

(cffi:defctype %stb.image::%zbuf
               (:struct %stb.image::|C:@SA@STBI--ZBUF|))

(cffi:defctype %stb.image::%zhuffman
               (:struct %stb.image::|C:@SA@STBI--ZHUFFMAN|))

(declaim (inline %stb.image::%y-cb-cr-to-rgb-row))

(cffi:defcfun ("stbi__YCbCr_to_RGB_row"
               %stb.image::%y-cb-cr-to-rgb-row)
              :void
              (%stb.image::out
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::y
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::pcb
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::pcr
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::count :int)
              (%stb.image::step :int))

(declaim (inline %stb.image::%y-cb-cr-to-rgb-simd))

(cffi:defcfun ("stbi__YCbCr_to_RGB_simd"
               %stb.image::%y-cb-cr-to-rgb-simd)
              :void
              (%stb.image::out
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::y
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::pcb
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::pcr
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::count :int)
              (%stb.image::step :int))

(declaim (inline %stb.image::%addsizes-valid))

(cffi:defcfun ("stbi__addsizes_valid" %stb.image::%addsizes-valid)
              :int
              (%stb.image::a :int)
              (%stb.image::b :int))

(declaim (inline %stb.image::%at-eof))

(cffi:defcfun ("stbi__at_eof" %stb.image::%at-eof)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%bit-reverse))

(cffi:defcfun ("stbi__bit_reverse" %stb.image::%bit-reverse)
              :int
              (%stb.image::v :int)
              (%stb.image::bits :int))

(declaim (inline %stb.image::%bitcount))

(cffi:defcfun ("stbi__bitcount" %stb.image::%bitcount)
              :int
              (%stb.image::a :unsigned-int))

(declaim (inline %stb.image::%bitreverse16))

(cffi:defcfun ("stbi__bitreverse16" %stb.image::%bitreverse16)
              :int
              (%stb.image::n :int))

(declaim (inline %stb.image::%blinn-8x8))

(cffi:defcfun ("stbi__blinn_8x8" %stb.image::%blinn-8x8)
              %stb.image::uc
              (%stb.image::x %stb.image::uc)
              (%stb.image::y %stb.image::uc))

(declaim (inline %stb.image::%bmp-info))

(cffi:defcfun ("stbi__bmp_info" %stb.image::%bmp-info)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int)))

(declaim (inline %stb.image::%bmp-load))

(cffi:defcfun ("stbi__bmp_load" %stb.image::%bmp-load)
              (claw-utils:claw-pointer :void)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri
               (claw-utils:claw-pointer %stb.image::%result-info)))

(declaim (inline %stb.image::%bmp-parse-header))

(cffi:defcfun ("stbi__bmp_parse_header"
               %stb.image::%bmp-parse-header)
              (claw-utils:claw-pointer :void)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::info
               (claw-utils:claw-pointer %stb.image::%bmp-data)))

(declaim (inline %stb.image::%bmp-test))

(cffi:defcfun ("stbi__bmp_test" %stb.image::%bmp-test)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%bmp-test-raw))

(cffi:defcfun ("stbi__bmp_test_raw" %stb.image::%bmp-test-raw)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(cffi:defctype %stb.image::%int16 :short)

(declaim (inline %stb.image::%build-fast-ac))

(cffi:defcfun ("stbi__build_fast_ac" %stb.image::%build-fast-ac)
              :void
              (%stb.image::fast-ac
               (claw-utils:claw-pointer %stb.image::%int16))
              (%stb.image::h
               (claw-utils:claw-pointer %stb.image::%huffman)))

(declaim (inline %stb.image::%build-huffman))

(cffi:defcfun ("stbi__build_huffman" %stb.image::%build-huffman)
              :int
              (%stb.image::h
               (claw-utils:claw-pointer %stb.image::%huffman))
              (%stb.image::count (claw-utils:claw-pointer :int)))

(declaim (inline %stb.image::%check-png-header))

(cffi:defcfun ("stbi__check_png_header"
               %stb.image::%check-png-header)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%clamp))

(cffi:defcfun ("stbi__clamp" %stb.image::%clamp)
              %stb.image::uc
              (%stb.image::x :int))

(declaim (inline %stb.image::%cleanup-jpeg))

(cffi:defcfun ("stbi__cleanup_jpeg" %stb.image::%cleanup-jpeg)
              :void
              (%stb.image::j
               (claw-utils:claw-pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%compute-huffman-codes))

(cffi:defcfun ("stbi__compute_huffman_codes"
               %stb.image::%compute-huffman-codes)
              :int
              (%stb.image::a
               (claw-utils:claw-pointer %stb.image::%zbuf)))

(declaim (inline %stb.image::%compute-transparency))

(cffi:defcfun ("stbi__compute_transparency"
               %stb.image::%compute-transparency)
              :int
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%png))
              (%stb.image::tc (:array %stb.image::uc 3))
              (%stb.image::out-n :int))

(cffi:defctype %stb.image::%uint16 :unsigned-short)

(declaim (inline %stb.image::%compute-transparency16))

(cffi:defcfun ("stbi__compute_transparency16"
               %stb.image::%compute-transparency16)
              :int
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%png))
              (%stb.image::tc (:array %stb.image::%uint16 3))
              (%stb.image::out-n :int))

(declaim (inline %stb.image::%compute-y))

(cffi:defcfun ("stbi__compute_y" %stb.image::%compute-y)
              %stb.image::uc
              (%stb.image::r :int)
              (%stb.image::g :int)
              (%stb.image::b :int))

(declaim (inline %stb.image::%compute-y-16))

(cffi:defcfun ("stbi__compute_y_16" %stb.image::%compute-y-16)
              %stb.image::%uint16
              (%stb.image::r :int)
              (%stb.image::g :int)
              (%stb.image::b :int))

(declaim (inline %stb.image::%convert-16-to-8))

(cffi:defcfun ("stbi__convert_16_to_8" %stb.image::%convert-16-to-8)
              (claw-utils:claw-pointer %stb.image::uc)
              (%stb.image::orig
               (claw-utils:claw-pointer %stb.image::%uint16))
              (%stb.image::w :int)
              (%stb.image::h :int)
              (%stb.image::channels :int))

(declaim (inline %stb.image::%convert-8-to-16))

(cffi:defcfun ("stbi__convert_8_to_16" %stb.image::%convert-8-to-16)
              (claw-utils:claw-pointer %stb.image::%uint16)
              (%stb.image::orig
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::w :int)
              (%stb.image::h :int)
              (%stb.image::channels :int))

(declaim (inline %stb.image::%convert-format))

(cffi:defcfun ("stbi__convert_format" %stb.image::%convert-format)
              (claw-utils:claw-pointer :unsigned-char)
              (%stb.image::data
               (claw-utils:claw-pointer :unsigned-char))
              (%stb.image::img-n :int)
              (%stb.image::req-comp :int)
              (%stb.image::x :unsigned-int)
              (%stb.image::y :unsigned-int))

(declaim (inline %stb.image::%convert-format16))

(cffi:defcfun ("stbi__convert_format16"
               %stb.image::%convert-format16)
              (claw-utils:claw-pointer %stb.image::%uint16)
              (%stb.image::data
               (claw-utils:claw-pointer %stb.image::%uint16))
              (%stb.image::img-n :int)
              (%stb.image::req-comp :int)
              (%stb.image::x :unsigned-int)
              (%stb.image::y :unsigned-int))

(declaim (inline %stb.image::%copyval))

(cffi:defcfun ("stbi__copyval" %stb.image::%copyval)
              :void
              (%stb.image::channel :int)
              (%stb.image::dest
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::src
               (claw-utils:claw-pointer %stb.image::uc)))

(cffi:defctype %stb.image::%uint32 :unsigned-int)

(declaim (inline %stb.image::%create-png-image))

(cffi:defcfun ("stbi__create_png_image"
               %stb.image::%create-png-image)
              :int
              (%stb.image::a
               (claw-utils:claw-pointer %stb.image::%png))
              (%stb.image::image-data
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::image-data-len %stb.image::%uint32)
              (%stb.image::out-n :int)
              (%stb.image::depth :int)
              (%stb.image::color :int)
              (%stb.image::interlaced :int))

(declaim (inline %stb.image::%create-png-image-raw))

(cffi:defcfun ("stbi__create_png_image_raw"
               %stb.image::%create-png-image-raw)
              :int
              (%stb.image::a
               (claw-utils:claw-pointer %stb.image::%png))
              (%stb.image::raw
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::raw-len %stb.image::%uint32)
              (%stb.image::out-n :int)
              (%stb.image::x %stb.image::%uint32)
              (%stb.image::y %stb.image::%uint32)
              (%stb.image::depth :int)
              (%stb.image::color :int))

(declaim (inline %stb.image::%de-iphone))

(cffi:defcfun ("stbi__de_iphone" %stb.image::%de-iphone)
              :void
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%png)))

(declaim (inline %stb.image::%decode-jpeg-header))

(cffi:defcfun ("stbi__decode_jpeg_header"
               %stb.image::%decode-jpeg-header)
              :int
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%jpeg))
              (%stb.image::scan :int))

(declaim (inline %stb.image::%decode-jpeg-image))

(cffi:defcfun ("stbi__decode_jpeg_image"
               %stb.image::%decode-jpeg-image)
              :int
              (%stb.image::j
               (claw-utils:claw-pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%do-png))

(cffi:defcfun ("stbi__do_png" %stb.image::%do-png)
              (claw-utils:claw-pointer :void)
              (%stb.image::p
               (claw-utils:claw-pointer %stb.image::%png))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::n (claw-utils:claw-pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri
               (claw-utils:claw-pointer %stb.image::%result-info)))

(declaim (inline %stb.image::%do-zlib))

(cffi:defcfun ("stbi__do_zlib" %stb.image::%do-zlib)
              :int
              (%stb.image::a
               (claw-utils:claw-pointer %stb.image::%zbuf))
              (%stb.image::obuf claw-utils:claw-string)
              (%stb.image::olen :int)
              (%stb.image::exp :int)
              (%stb.image::parse-header :int))

(declaim (inline %stb.image::%err))

(cffi:defcfun ("stbi__err" %stb.image::%err)
              :int
              (%stb.image::str claw-utils:claw-string))

(declaim (inline %stb.image::%expand-png-palette))

(cffi:defcfun ("stbi__expand_png_palette"
               %stb.image::%expand-png-palette)
              :int
              (%stb.image::a
               (claw-utils:claw-pointer %stb.image::%png))
              (%stb.image::palette
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::len :int)
              (%stb.image::pal-img-n :int))

(declaim (inline %stb.image::%extend-receive))

(cffi:defcfun ("stbi__extend_receive" %stb.image::%extend-receive)
              :int
              (%stb.image::j
               (claw-utils:claw-pointer %stb.image::%jpeg))
              (%stb.image::n :int))

(declaim (inline %stb.image::%fill-bits))

(cffi:defcfun ("stbi__fill_bits" %stb.image::%fill-bits)
              :void
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%zbuf)))

(declaim (inline %stb.image::%float-postprocess))

(cffi:defcfun ("stbi__float_postprocess"
               %stb.image::%float-postprocess)
              :void
              (%stb.image::result (claw-utils:claw-pointer :float))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::req-comp :int))

(declaim (inline %stb.image::%fopen))

(cffi:defcfun ("stbi__fopen" %stb.image::%fopen)
              (claw-utils:claw-pointer %stb.image::file)
              (%stb.image::filename claw-utils:claw-string)
              (%stb.image::mode claw-utils:claw-string))

(declaim (inline %stb.image::%free-jpeg-components))

(cffi:defcfun ("stbi__free_jpeg_components"
               %stb.image::%free-jpeg-components)
              :int
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%jpeg))
              (%stb.image::ncomp :int)
              (%stb.image::why :int))

(declaim (inline %stb.image::%get16be))

(cffi:defcfun ("stbi__get16be" %stb.image::%get16be)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%get16le))

(cffi:defcfun ("stbi__get16le" %stb.image::%get16le)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%get32be))

(cffi:defcfun ("stbi__get32be" %stb.image::%get32be)
              %stb.image::%uint32
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%get32le))

(cffi:defcfun ("stbi__get32le" %stb.image::%get32le)
              %stb.image::%uint32
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%get8))

(cffi:defcfun ("stbi__get8" %stb.image::%get8)
              %stb.image::uc
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%get-chunk-header))

(cffi:defcfun ("__claw_stbi__get_chunk_header"
               %stb.image::%get-chunk-header)
              (claw-utils:claw-pointer %stb.image::%pngchunk)
              (%stb.image::%%claw-result-
               (claw-utils:claw-pointer %stb.image::%pngchunk))
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%get-marker))

(cffi:defcfun ("stbi__get_marker" %stb.image::%get-marker)
              %stb.image::uc
              (%stb.image::j
               (claw-utils:claw-pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%getn))

(cffi:defcfun ("stbi__getn" %stb.image::%getn)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::buffer
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::n :int))

(declaim (inline %stb.image::%gif-header))

(cffi:defcfun ("stbi__gif_header" %stb.image::%gif-header)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::g
               (claw-utils:claw-pointer %stb.image::%gif))
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::is-info :int))

(declaim (inline %stb.image::%gif-info))

(cffi:defcfun ("stbi__gif_info" %stb.image::%gif-info)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int)))

(declaim (inline %stb.image::%gif-info-raw))

(cffi:defcfun ("stbi__gif_info_raw" %stb.image::%gif-info-raw)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int)))

(declaim (inline %stb.image::%gif-load))

(cffi:defcfun ("stbi__gif_load" %stb.image::%gif-load)
              (claw-utils:claw-pointer :void)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri
               (claw-utils:claw-pointer %stb.image::%result-info)))

(declaim (inline %stb.image::%gif-load-next))

(cffi:defcfun ("stbi__gif_load_next" %stb.image::%gif-load-next)
              (claw-utils:claw-pointer %stb.image::uc)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::g
               (claw-utils:claw-pointer %stb.image::%gif))
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::two-back
               (claw-utils:claw-pointer %stb.image::uc)))

(declaim (inline %stb.image::%gif-parse-colortable))

(cffi:defcfun ("stbi__gif_parse_colortable"
               %stb.image::%gif-parse-colortable)
              :void
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::pal
               (:array (:array %stb.image::uc 4) 256))
              (%stb.image::num-entries :int)
              (%stb.image::transp :int))

(declaim (inline %stb.image::%gif-test))

(cffi:defcfun ("stbi__gif_test" %stb.image::%gif-test)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%gif-test-raw))

(cffi:defcfun ("stbi__gif_test_raw" %stb.image::%gif-test-raw)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%grow-buffer-unsafe))

(cffi:defcfun ("stbi__grow_buffer_unsafe"
               %stb.image::%grow-buffer-unsafe)
              :void
              (%stb.image::j
               (claw-utils:claw-pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%hdr-convert))

(cffi:defcfun ("stbi__hdr_convert" %stb.image::%hdr-convert)
              :void
              (%stb.image::output (claw-utils:claw-pointer :float))
              (%stb.image::input
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::req-comp :int))

(declaim (inline %stb.image::%hdr-gettoken))

(cffi:defcfun ("stbi__hdr_gettoken" %stb.image::%hdr-gettoken)
              claw-utils:claw-string
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::buffer claw-utils:claw-string))

(declaim (inline %stb.image::%hdr-info))

(cffi:defcfun ("stbi__hdr_info" %stb.image::%hdr-info)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int)))

(declaim (inline %stb.image::%hdr-load))

(cffi:defcfun ("stbi__hdr_load" %stb.image::%hdr-load)
              (claw-utils:claw-pointer :float)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri
               (claw-utils:claw-pointer %stb.image::%result-info)))

(declaim (inline %stb.image::%hdr-test))

(cffi:defcfun ("stbi__hdr_test" %stb.image::%hdr-test)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%hdr-test-core))

(cffi:defcfun ("stbi__hdr_test_core" %stb.image::%hdr-test-core)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::signature claw-utils:claw-string))

(declaim (inline %stb.image::%hdr-to-ldr))

(cffi:defcfun ("stbi__hdr_to_ldr" %stb.image::%hdr-to-ldr)
              (claw-utils:claw-pointer %stb.image::uc)
              (%stb.image::data (claw-utils:claw-pointer :float))
              (%stb.image::x :int)
              (%stb.image::y :int)
              (%stb.image::comp :int))

(declaim (inline %stb.image::%high-bit))

(cffi:defcfun ("stbi__high_bit" %stb.image::%high-bit)
              :int
              (%stb.image::z :unsigned-int))

(declaim (inline %stb.image::%idct-block))

(cffi:defcfun ("stbi__idct_block" %stb.image::%idct-block)
              :void
              (%stb.image::out
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::out-stride :int)
              (%stb.image::data (:array :short 64)))

(declaim (inline %stb.image::%idct-simd))

(cffi:defcfun ("stbi__idct_simd" %stb.image::%idct-simd)
              :void
              (%stb.image::out
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::out-stride :int)
              (%stb.image::data (:array :short 64)))

(declaim (inline %stb.image::%info-main))

(cffi:defcfun ("stbi__info_main" %stb.image::%info-main)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int)))

(declaim (inline %stb.image::%is-16-main))

(cffi:defcfun ("stbi__is_16_main" %stb.image::%is-16-main)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%jpeg-decode-block))

(cffi:defcfun ("stbi__jpeg_decode_block"
               %stb.image::%jpeg-decode-block)
              :int
              (%stb.image::j
               (claw-utils:claw-pointer %stb.image::%jpeg))
              (%stb.image::data (:array :short 64))
              (%stb.image::hdc
               (claw-utils:claw-pointer %stb.image::%huffman))
              (%stb.image::hac
               (claw-utils:claw-pointer %stb.image::%huffman))
              (%stb.image::fac
               (claw-utils:claw-pointer %stb.image::%int16))
              (%stb.image::b :int)
              (%stb.image::dequant
               (claw-utils:claw-pointer %stb.image::%uint16)))

(declaim (inline %stb.image::%jpeg-decode-block-prog-ac))

(cffi:defcfun ("stbi__jpeg_decode_block_prog_ac"
               %stb.image::%jpeg-decode-block-prog-ac)
              :int
              (%stb.image::j
               (claw-utils:claw-pointer %stb.image::%jpeg))
              (%stb.image::data (:array :short 64))
              (%stb.image::hac
               (claw-utils:claw-pointer %stb.image::%huffman))
              (%stb.image::fac
               (claw-utils:claw-pointer %stb.image::%int16)))

(declaim (inline %stb.image::%jpeg-decode-block-prog-dc))

(cffi:defcfun ("stbi__jpeg_decode_block_prog_dc"
               %stb.image::%jpeg-decode-block-prog-dc)
              :int
              (%stb.image::j
               (claw-utils:claw-pointer %stb.image::%jpeg))
              (%stb.image::data (:array :short 64))
              (%stb.image::hdc
               (claw-utils:claw-pointer %stb.image::%huffman))
              (%stb.image::b :int))

(declaim (inline %stb.image::%jpeg-dequantize))

(cffi:defcfun ("stbi__jpeg_dequantize" %stb.image::%jpeg-dequantize)
              :void
              (%stb.image::data (claw-utils:claw-pointer :short))
              (%stb.image::dequant
               (claw-utils:claw-pointer %stb.image::%uint16)))

(declaim (inline %stb.image::%jpeg-finish))

(cffi:defcfun ("stbi__jpeg_finish" %stb.image::%jpeg-finish)
              :void
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%jpeg-get-bit))

(cffi:defcfun ("stbi__jpeg_get_bit" %stb.image::%jpeg-get-bit)
              :int
              (%stb.image::j
               (claw-utils:claw-pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%jpeg-get-bits))

(cffi:defcfun ("stbi__jpeg_get_bits" %stb.image::%jpeg-get-bits)
              :int
              (%stb.image::j
               (claw-utils:claw-pointer %stb.image::%jpeg))
              (%stb.image::n :int))

(declaim (inline %stb.image::%jpeg-huff-decode))

(cffi:defcfun ("stbi__jpeg_huff_decode"
               %stb.image::%jpeg-huff-decode)
              :int
              (%stb.image::j
               (claw-utils:claw-pointer %stb.image::%jpeg))
              (%stb.image::h
               (claw-utils:claw-pointer %stb.image::%huffman)))

(declaim (inline %stb.image::%jpeg-info))

(cffi:defcfun ("stbi__jpeg_info" %stb.image::%jpeg-info)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int)))

(declaim (inline %stb.image::%jpeg-info-raw))

(cffi:defcfun ("stbi__jpeg_info_raw" %stb.image::%jpeg-info-raw)
              :int
              (%stb.image::j
               (claw-utils:claw-pointer %stb.image::%jpeg))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int)))

(declaim (inline %stb.image::%jpeg-load))

(cffi:defcfun ("stbi__jpeg_load" %stb.image::%jpeg-load)
              (claw-utils:claw-pointer :void)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri
               (claw-utils:claw-pointer %stb.image::%result-info)))

(declaim (inline %stb.image::%jpeg-reset))

(cffi:defcfun ("stbi__jpeg_reset" %stb.image::%jpeg-reset)
              :void
              (%stb.image::j
               (claw-utils:claw-pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%jpeg-test))

(cffi:defcfun ("stbi__jpeg_test" %stb.image::%jpeg-test)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%ldr-to-hdr))

(cffi:defcfun ("stbi__ldr_to_hdr" %stb.image::%ldr-to-hdr)
              (claw-utils:claw-pointer :float)
              (%stb.image::data
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::x :int)
              (%stb.image::y :int)
              (%stb.image::comp :int))

(declaim (inline %stb.image::%load-and-postprocess-16bit))

(cffi:defcfun ("stbi__load_and_postprocess_16bit"
               %stb.image::%load-and-postprocess-16bit)
              (claw-utils:claw-pointer %stb.image::%uint16)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::req-comp :int))

(declaim (inline %stb.image::%load-and-postprocess-8bit))

(cffi:defcfun ("stbi__load_and_postprocess_8bit"
               %stb.image::%load-and-postprocess-8bit)
              (claw-utils:claw-pointer :unsigned-char)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::req-comp :int))

(declaim (inline %stb.image::%load-gif-main))

(cffi:defcfun ("stbi__load_gif_main" %stb.image::%load-gif-main)
              (claw-utils:claw-pointer :void)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::delays
               (claw-utils:claw-pointer
                (claw-utils:claw-pointer :int)))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::z (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::req-comp :int))

(declaim (inline %stb.image::%load-main))

(cffi:defcfun ("stbi__load_main" %stb.image::%load-main)
              (claw-utils:claw-pointer :void)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri
               (claw-utils:claw-pointer %stb.image::%result-info))
              (%stb.image::bpc :int))

(declaim (inline %stb.image::%loadf-main))

(cffi:defcfun ("stbi__loadf_main" %stb.image::%loadf-main)
              (claw-utils:claw-pointer :float)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::req-comp :int))

(declaim (inline %stb.image::%mad2sizes-valid))

(cffi:defcfun ("stbi__mad2sizes_valid" %stb.image::%mad2sizes-valid)
              :int
              (%stb.image::a :int)
              (%stb.image::b :int)
              (%stb.image::add :int))

(declaim (inline %stb.image::%mad3sizes-valid))

(cffi:defcfun ("stbi__mad3sizes_valid" %stb.image::%mad3sizes-valid)
              :int
              (%stb.image::a :int)
              (%stb.image::b :int)
              (%stb.image::c :int)
              (%stb.image::add :int))

(declaim (inline %stb.image::%mad4sizes-valid))

(cffi:defcfun ("stbi__mad4sizes_valid" %stb.image::%mad4sizes-valid)
              :int
              (%stb.image::a :int)
              (%stb.image::b :int)
              (%stb.image::c :int)
              (%stb.image::d :int)
              (%stb.image::add :int))

(declaim (inline %stb.image::%malloc))

(cffi:defcfun ("stbi__malloc" %stb.image::%malloc)
              (claw-utils:claw-pointer :void)
              (%stb.image::size %stb.image::size-t))

(declaim (inline %stb.image::%malloc-mad2))

(cffi:defcfun ("stbi__malloc_mad2" %stb.image::%malloc-mad2)
              (claw-utils:claw-pointer :void)
              (%stb.image::a :int)
              (%stb.image::b :int)
              (%stb.image::add :int))

(declaim (inline %stb.image::%malloc-mad3))

(cffi:defcfun ("stbi__malloc_mad3" %stb.image::%malloc-mad3)
              (claw-utils:claw-pointer :void)
              (%stb.image::a :int)
              (%stb.image::b :int)
              (%stb.image::c :int)
              (%stb.image::add :int))

(declaim (inline %stb.image::%malloc-mad4))

(cffi:defcfun ("stbi__malloc_mad4" %stb.image::%malloc-mad4)
              (claw-utils:claw-pointer :void)
              (%stb.image::a :int)
              (%stb.image::b :int)
              (%stb.image::c :int)
              (%stb.image::d :int)
              (%stb.image::add :int))

(declaim (inline %stb.image::%mul2sizes-valid))

(cffi:defcfun ("stbi__mul2sizes_valid" %stb.image::%mul2sizes-valid)
              :int
              (%stb.image::a :int)
              (%stb.image::b :int))

(declaim (inline %stb.image::%out-gif-code))

(cffi:defcfun ("stbi__out_gif_code" %stb.image::%out-gif-code)
              :void
              (%stb.image::g
               (claw-utils:claw-pointer %stb.image::%gif))
              (%stb.image::code %stb.image::%uint16))

(declaim (inline %stb.image::%paeth))

(cffi:defcfun ("stbi__paeth" %stb.image::%paeth)
              :int
              (%stb.image::a :int)
              (%stb.image::b :int)
              (%stb.image::c :int))

(declaim (inline %stb.image::%parse-entropy-coded-data))

(cffi:defcfun ("stbi__parse_entropy_coded_data"
               %stb.image::%parse-entropy-coded-data)
              :int
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%parse-huffman-block))

(cffi:defcfun ("stbi__parse_huffman_block"
               %stb.image::%parse-huffman-block)
              :int
              (%stb.image::a
               (claw-utils:claw-pointer %stb.image::%zbuf)))

(declaim (inline %stb.image::%parse-png-file))

(cffi:defcfun ("stbi__parse_png_file" %stb.image::%parse-png-file)
              :int
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%png))
              (%stb.image::scan :int)
              (%stb.image::req-comp :int))

(declaim (inline %stb.image::%parse-uncompressed-block))

(cffi:defcfun ("stbi__parse_uncompressed_block"
               %stb.image::%parse-uncompressed-block)
              :int
              (%stb.image::a
               (claw-utils:claw-pointer %stb.image::%zbuf)))

(declaim (inline %stb.image::%parse-zlib))

(cffi:defcfun ("stbi__parse_zlib" %stb.image::%parse-zlib)
              :int
              (%stb.image::a
               (claw-utils:claw-pointer %stb.image::%zbuf))
              (%stb.image::parse-header :int))

(declaim (inline %stb.image::%parse-zlib-header))

(cffi:defcfun ("stbi__parse_zlib_header"
               %stb.image::%parse-zlib-header)
              :int
              (%stb.image::a
               (claw-utils:claw-pointer %stb.image::%zbuf)))

(declaim (inline %stb.image::%pic-info))

(cffi:defcfun ("stbi__pic_info" %stb.image::%pic-info)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int)))

(declaim (inline %stb.image::%pic-is4))

(cffi:defcfun ("stbi__pic_is4" %stb.image::%pic-is4)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::str claw-utils:claw-string))

(declaim (inline %stb.image::%pic-load))

(cffi:defcfun ("stbi__pic_load" %stb.image::%pic-load)
              (claw-utils:claw-pointer :void)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri
               (claw-utils:claw-pointer %stb.image::%result-info)))

(declaim (inline %stb.image::%pic-load-core))

(cffi:defcfun ("stbi__pic_load_core" %stb.image::%pic-load-core)
              (claw-utils:claw-pointer %stb.image::uc)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::width :int)
              (%stb.image::height :int)
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::result
               (claw-utils:claw-pointer %stb.image::uc)))

(declaim (inline %stb.image::%pic-test))

(cffi:defcfun ("stbi__pic_test" %stb.image::%pic-test)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%pic-test-core))

(cffi:defcfun ("stbi__pic_test_core" %stb.image::%pic-test-core)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%png-info))

(cffi:defcfun ("stbi__png_info" %stb.image::%png-info)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int)))

(declaim (inline %stb.image::%png-info-raw))

(cffi:defcfun ("stbi__png_info_raw" %stb.image::%png-info-raw)
              :int
              (%stb.image::p
               (claw-utils:claw-pointer %stb.image::%png))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int)))

(declaim (inline %stb.image::%png-is16))

(cffi:defcfun ("stbi__png_is16" %stb.image::%png-is16)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%png-load))

(cffi:defcfun ("stbi__png_load" %stb.image::%png-load)
              (claw-utils:claw-pointer :void)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri
               (claw-utils:claw-pointer %stb.image::%result-info)))

(declaim (inline %stb.image::%png-test))

(cffi:defcfun ("stbi__png_test" %stb.image::%png-test)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%pnm-getinteger))

(cffi:defcfun ("stbi__pnm_getinteger" %stb.image::%pnm-getinteger)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::c claw-utils:claw-string))

(declaim (inline %stb.image::%pnm-info))

(cffi:defcfun ("stbi__pnm_info" %stb.image::%pnm-info)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int)))

(declaim (inline %stb.image::%pnm-isdigit))

(cffi:defcfun ("stbi__pnm_isdigit" %stb.image::%pnm-isdigit)
              :int
              (%stb.image::c :char))

(declaim (inline %stb.image::%pnm-isspace))

(cffi:defcfun ("stbi__pnm_isspace" %stb.image::%pnm-isspace)
              :int
              (%stb.image::c :char))

(declaim (inline %stb.image::%pnm-load))

(cffi:defcfun ("stbi__pnm_load" %stb.image::%pnm-load)
              (claw-utils:claw-pointer :void)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri
               (claw-utils:claw-pointer %stb.image::%result-info)))

(declaim (inline %stb.image::%pnm-skip-whitespace))

(cffi:defcfun ("stbi__pnm_skip_whitespace"
               %stb.image::%pnm-skip-whitespace)
              :void
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::c claw-utils:claw-string))

(declaim (inline %stb.image::%pnm-test))

(cffi:defcfun ("stbi__pnm_test" %stb.image::%pnm-test)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%process-frame-header))

(cffi:defcfun ("stbi__process_frame_header"
               %stb.image::%process-frame-header)
              :int
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%jpeg))
              (%stb.image::scan :int))

(declaim (inline %stb.image::%process-gif-raster))

(cffi:defcfun ("stbi__process_gif_raster"
               %stb.image::%process-gif-raster)
              (claw-utils:claw-pointer %stb.image::uc)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::g
               (claw-utils:claw-pointer %stb.image::%gif)))

(declaim (inline %stb.image::%process-marker))

(cffi:defcfun ("stbi__process_marker" %stb.image::%process-marker)
              :int
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%jpeg))
              (%stb.image::m :int))

(declaim (inline %stb.image::%process-scan-header))

(cffi:defcfun ("stbi__process_scan_header"
               %stb.image::%process-scan-header)
              :int
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%psd-decode-rle))

(cffi:defcfun ("stbi__psd_decode_rle" %stb.image::%psd-decode-rle)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::p
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::pixel-count :int))

(declaim (inline %stb.image::%psd-info))

(cffi:defcfun ("stbi__psd_info" %stb.image::%psd-info)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int)))

(declaim (inline %stb.image::%psd-is16))

(cffi:defcfun ("stbi__psd_is16" %stb.image::%psd-is16)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%psd-load))

(cffi:defcfun ("stbi__psd_load" %stb.image::%psd-load)
              (claw-utils:claw-pointer :void)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri
               (claw-utils:claw-pointer %stb.image::%result-info))
              (%stb.image::bpc :int))

(declaim (inline %stb.image::%psd-test))

(cffi:defcfun ("stbi__psd_test" %stb.image::%psd-test)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%readval))

(cffi:defcfun ("stbi__readval" %stb.image::%readval)
              (claw-utils:claw-pointer %stb.image::uc)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::channel :int)
              (%stb.image::dest
               (claw-utils:claw-pointer %stb.image::uc)))

(declaim (inline %stb.image::%refill-buffer))

(cffi:defcfun ("stbi__refill_buffer" %stb.image::%refill-buffer)
              :void
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%resample-row-generic))

(cffi:defcfun ("stbi__resample_row_generic"
               %stb.image::%resample-row-generic)
              (claw-utils:claw-pointer %stb.image::uc)
              (%stb.image::out
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::in-near
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::in-far
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::w :int)
              (%stb.image::hs :int))

(declaim (inline %stb.image::%resample-row-h-2))

(cffi:defcfun ("stbi__resample_row_h_2"
               %stb.image::%resample-row-h-2)
              (claw-utils:claw-pointer %stb.image::uc)
              (%stb.image::out
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::in-near
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::in-far
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::w :int)
              (%stb.image::hs :int))

(declaim (inline %stb.image::%resample-row-hv-2))

(cffi:defcfun ("stbi__resample_row_hv_2"
               %stb.image::%resample-row-hv-2)
              (claw-utils:claw-pointer %stb.image::uc)
              (%stb.image::out
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::in-near
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::in-far
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::w :int)
              (%stb.image::hs :int))

(declaim (inline %stb.image::%resample-row-hv-2-simd))

(cffi:defcfun ("stbi__resample_row_hv_2_simd"
               %stb.image::%resample-row-hv-2-simd)
              (claw-utils:claw-pointer %stb.image::uc)
              (%stb.image::out
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::in-near
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::in-far
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::w :int)
              (%stb.image::hs :int))

(declaim (inline %stb.image::%resample-row-v-2))

(cffi:defcfun ("stbi__resample_row_v_2"
               %stb.image::%resample-row-v-2)
              (claw-utils:claw-pointer %stb.image::uc)
              (%stb.image::out
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::in-near
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::in-far
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::w :int)
              (%stb.image::hs :int))

(declaim (inline %stb.image::%rewind))

(cffi:defcfun ("stbi__rewind" %stb.image::%rewind)
              :void
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%setup-jpeg))

(cffi:defcfun ("stbi__setup_jpeg" %stb.image::%setup-jpeg)
              :void
              (%stb.image::j
               (claw-utils:claw-pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%shiftsigned))

(cffi:defcfun ("stbi__shiftsigned" %stb.image::%shiftsigned)
              :int
              (%stb.image::v :unsigned-int)
              (%stb.image::shift :int)
              (%stb.image::bits :int))

(declaim (inline %stb.image::%skip))

(cffi:defcfun ("stbi__skip" %stb.image::%skip)
              :void
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::n :int))

(declaim (inline %stb.image::%sse2-available))

(cffi:defcfun ("stbi__sse2_available" %stb.image::%sse2-available)
              :int)

(declaim (inline %stb.image::%start-callbacks))

(cffi:defcfun ("stbi__start_callbacks" %stb.image::%start-callbacks)
              :void
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::c
               (claw-utils:claw-pointer %stb.image::io-callbacks))
              (%stb.image::user (claw-utils:claw-pointer :void)))

(declaim (inline %stb.image::%start-file))

(cffi:defcfun ("stbi__start_file" %stb.image::%start-file)
              :void
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::f
               (claw-utils:claw-pointer %stb.image::file)))

(declaim (inline %stb.image::%start-mem))

(cffi:defcfun ("stbi__start_mem" %stb.image::%start-mem)
              :void
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::buffer
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::len :int))

(declaim (inline %stb.image::%stdio-eof))

(cffi:defcfun ("stbi__stdio_eof" %stb.image::%stdio-eof)
              :int
              (%stb.image::user (claw-utils:claw-pointer :void)))

(declaim (inline %stb.image::%stdio-read))

(cffi:defcfun ("stbi__stdio_read" %stb.image::%stdio-read)
              :int
              (%stb.image::user (claw-utils:claw-pointer :void))
              (%stb.image::data claw-utils:claw-string)
              (%stb.image::size :int))

(declaim (inline %stb.image::%stdio-skip))

(cffi:defcfun ("stbi__stdio_skip" %stb.image::%stdio-skip)
              :void
              (%stb.image::user (claw-utils:claw-pointer :void))
              (%stb.image::n :int))

(declaim (inline %stb.image::%tga-get-comp))

(cffi:defcfun ("stbi__tga_get_comp" %stb.image::%tga-get-comp)
              :int
              (%stb.image::bits-per-pixel :int)
              (%stb.image::is-grey :int)
              (%stb.image::is-rgb16 (claw-utils:claw-pointer :int)))

(declaim (inline %stb.image::%tga-info))

(cffi:defcfun ("stbi__tga_info" %stb.image::%tga-info)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int)))

(declaim (inline %stb.image::%tga-load))

(cffi:defcfun ("stbi__tga_load" %stb.image::%tga-load)
              (claw-utils:claw-pointer :void)
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::x (claw-utils:claw-pointer :int))
              (%stb.image::y (claw-utils:claw-pointer :int))
              (%stb.image::comp (claw-utils:claw-pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri
               (claw-utils:claw-pointer %stb.image::%result-info)))

(declaim (inline %stb.image::%tga-read-rgb16))

(cffi:defcfun ("stbi__tga_read_rgb16" %stb.image::%tga-read-rgb16)
              :void
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context))
              (%stb.image::out
               (claw-utils:claw-pointer %stb.image::uc)))

(declaim (inline %stb.image::%tga-test))

(cffi:defcfun ("stbi__tga_test" %stb.image::%tga-test)
              :int
              (%stb.image::s
               (claw-utils:claw-pointer %stb.image::%context)))

(declaim (inline %stb.image::%vertical-flip))

(cffi:defcfun ("stbi__vertical_flip" %stb.image::%vertical-flip)
              :void
              (%stb.image::image (claw-utils:claw-pointer :void))
              (%stb.image::w :int)
              (%stb.image::h :int)
              (%stb.image::bytes-per-pixel :int))

(declaim (inline %stb.image::%vertical-flip-slices))

(cffi:defcfun ("stbi__vertical_flip_slices"
               %stb.image::%vertical-flip-slices)
              :void
              (%stb.image::image (claw-utils:claw-pointer :void))
              (%stb.image::w :int)
              (%stb.image::h :int)
              (%stb.image::z :int)
              (%stb.image::bytes-per-pixel :int))

(declaim (inline %stb.image::%zbuild-huffman))

(cffi:defcfun ("stbi__zbuild_huffman" %stb.image::%zbuild-huffman)
              :int
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%zhuffman))
              (%stb.image::sizelist
               (claw-utils:claw-pointer %stb.image::uc))
              (%stb.image::num :int))

(declaim (inline %stb.image::%zeof))

(cffi:defcfun ("stbi__zeof" %stb.image::%zeof)
              :int
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%zbuf)))

(declaim (inline %stb.image::%zexpand))

(cffi:defcfun ("stbi__zexpand" %stb.image::%zexpand)
              :int
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%zbuf))
              (%stb.image::zout claw-utils:claw-string)
              (%stb.image::n :int))

(declaim (inline %stb.image::%zget8))

(cffi:defcfun ("stbi__zget8" %stb.image::%zget8)
              %stb.image::uc
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%zbuf)))

(declaim (inline %stb.image::%zhuffman-decode))

(cffi:defcfun ("stbi__zhuffman_decode" %stb.image::%zhuffman-decode)
              :int
              (%stb.image::a
               (claw-utils:claw-pointer %stb.image::%zbuf))
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%zhuffman)))

(declaim (inline %stb.image::%zhuffman-decode-slowpath))

(cffi:defcfun ("stbi__zhuffman_decode_slowpath"
               %stb.image::%zhuffman-decode-slowpath)
              :int
              (%stb.image::a
               (claw-utils:claw-pointer %stb.image::%zbuf))
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%zhuffman)))

(declaim (inline %stb.image::%zreceive))

(cffi:defcfun ("stbi__zreceive" %stb.image::%zreceive)
              :unsigned-int
              (%stb.image::z
               (claw-utils:claw-pointer %stb.image::%zbuf))
              (%stb.image::n :int))

(cffi:defctype %stb.image::%int32 :int)

(defparameter %stb.image::*%bmask* nil)

(defparameter %stb.image::*%de-iphone-flag* 0)

(defparameter %stb.image::*%depth-scale-table* nil)

(defparameter %stb.image::*%g-failure-reason* nil)

(defparameter %stb.image::*%h2l-gamma-i* 0.45454543828964233D0)

(defparameter %stb.image::*%h2l-scale-i* 1.0D0)

(defparameter %stb.image::*%jbias* nil)

(defparameter %stb.image::*%jpeg-dezigzag* nil)

(defparameter %stb.image::*%l2h-gamma* 2.200000047683716D0)

(defparameter %stb.image::*%l2h-scale* 1.0D0)

(defparameter %stb.image::*%stdio-callbacks* nil)

(defparameter %stb.image::*%unpremultiply-on-load* 0)

(defparameter %stb.image::*%vertically-flip-on-load-global* 0)

(defparameter %stb.image::*%vertically-flip-on-load-local* nil)

(defparameter %stb.image::*%vertically-flip-on-load-set* nil)

(defparameter %stb.image::*%zdefault-distance* nil)

(defparameter %stb.image::*%zdefault-length* nil)

(defparameter %stb.image::*%zdist-base* nil)

(defparameter %stb.image::*%zdist-extra* nil)

(defparameter %stb.image::*%zlength-base* nil)

(defparameter %stb.image::*%zlength-extra* nil)

(eval-when (:load-toplevel :compile-toplevel :execute)
  (export '%stb.image::%hdr-convert :%stb.image)
  (export '%stb.image::load-16 :%stb.image)
  (export '%stb.image::%y-cb-cr-to-rgb-row :%stb.image)
  (export '%stb.image::set-flip-vertically-on-load-thread
          :%stb.image)
  (export '%stb.image::%hdr-load :%stb.image)
  (export '%stb.image::%gif-test-raw :%stb.image)
  (export '%stb.image::%int16 :%stb.image)
  (export '%stb.image::%gif-lzw :%stb.image)
  (export '%stb.image::%refill-buffer :%stb.image)
  (export '%stb.image::hdr-to-ldr-scale :%stb.image)
  (export '%stb.image::%process-scan-header :%stb.image)
  (export '%stb.image::|C:@SA@STBI-IO-CALLBACKS| :%stb.image)
  (export '%stb.image::%png-load :%stb.image)
  (export '%stb.image::%is-16-main :%stb.image)
  (export '%stb.image::info-from-memory :%stb.image)
  (export '%stb.image::*%jpeg-dezigzag* :%stb.image)
  (export '%stb.image::%gif-load-next :%stb.image)
  (export '%stb.image::%vertical-flip :%stb.image)
  (export '%stb.image::*%unpremultiply-on-load* :%stb.image)
  (export '%stb.image::%compute-y :%stb.image)
  (export '%stb.image::%zbuf :%stb.image)
  (export '%stb.image::%psd-is16 :%stb.image)
  (export '%stb.image::%result-info :%stb.image)
  (export '%stb.image::%get-marker :%stb.image)
  (export '%stb.image::%zreceive :%stb.image)
  (export '%stb.image::%copyval :%stb.image)
  (export '%stb.image::%malloc-mad2 :%stb.image)
  (export '%stb.image::%vertical-flip-slices :%stb.image)
  (export '%stb.image::%readval :%stb.image)
  (export '%stb.image::loadf-from-file :%stb.image)
  (export '%stb.image::+version+ :%stb.image)
  (export '%stb.image::%ldr-to-hdr :%stb.image)
  (export '%stb.image::%zbuild-huffman :%stb.image)
  (export '%stb.image::%compute-y-16 :%stb.image)
  (export '%stb.image::us :%stb.image)
  (export '%stb.image::%process-frame-header :%stb.image)
  (export '%stb.image::%idct-block :%stb.image)
  (export '%stb.image::%loadf-main :%stb.image)
  (export '%stb.image::%grow-buffer-unsafe :%stb.image)
  (export '%stb.image::|C:@SA@STBI--BMP-DATA| :%stb.image)
  (export '%stb.image::|C:@SA@STBI--ZHUFFMAN| :%stb.image)
  (export '%stb.image::loadf-from-callbacks :%stb.image)
  (export '%stb.image::+%vertically-flip-on-load+ :%stb.image)
  (export '%stb.image::%parse-zlib :%stb.image)
  (export '%stb.image::%check-png-header :%stb.image)
  (export '%stb.image::%jpeg-test :%stb.image)
  (export '%stb.image::%tga-get-comp :%stb.image)
  (export '%stb.image::uc :%stb.image)
  (export '%stb.image::%tga-test :%stb.image)
  (export '%stb.image::%jpeg-dequantize :%stb.image)
  (export '%stb.image::%jpeg-decode-block :%stb.image)
  (export '%stb.image::%parse-entropy-coded-data :%stb.image)
  (export '%stb.image::%get16be :%stb.image)
  (export '%stb.image::zlib-decode-malloc-guesssize :%stb.image)
  (export '%stb.image::ldr-to-hdr-gamma :%stb.image)
  (export '%stb.image::load :%stb.image)
  (export '%stb.image::%pnm-isdigit :%stb.image)
  (export '%stb.image::io-callbacks :%stb.image)
  (export '%stb.image::*%vertically-flip-on-load-set* :%stb.image)
  (export '%stb.image::%tga-info :%stb.image)
  (export '%stb.image::%gif-load :%stb.image)
  (export '%stb.image::%malloc :%stb.image)
  (export '%stb.image::%pic-load-core :%stb.image)
  (export '%stb.image::+inline+ :%stb.image)
  (export '%stb.image::%load-and-postprocess-8bit :%stb.image)
  (export '%stb.image::%int32 :%stb.image)
  (export '%stb.image::%setup-jpeg :%stb.image)
  (export '%stb.image::*%depth-scale-table* :%stb.image)
  (export '%stb.image::%out-gif-code :%stb.image)
  (export '%stb.image::%convert-16-to-8 :%stb.image)
  (export '%stb.image::%fill-bits :%stb.image)
  (export '%stb.image::%start-mem :%stb.image)
  (export '%stb.image::%start-callbacks :%stb.image)
  (export '%stb.image::%zeof :%stb.image)
  (export '%stb.image::%get16le :%stb.image)
  (export '%stb.image::%create-png-image :%stb.image)
  (export '%stb.image::load-from-memory :%stb.image)
  (export '%stb.image::*%stdio-callbacks* :%stb.image)
  (export '%stb.image::%png-info :%stb.image)
  (export '%stb.image::%bmp-test-raw :%stb.image)
  (export '%stb.image::*%zlength-extra* :%stb.image)
  (export '%stb.image::+thread-local+ :%stb.image)
  (export '%stb.image::*%l2h-gamma* :%stb.image)
  (export '%stb.image::%paeth :%stb.image)
  (export '%stb.image::%resample-row-generic :%stb.image)
  (export '%stb.image::%bmp-test :%stb.image)
  (export '%stb.image::*%h2l-scale-i* :%stb.image)
  (export '%stb.image::is-hdr-from-callbacks :%stb.image)
  (export '%stb.image::%tga-load :%stb.image)
  (export '%stb.image::%gif-header :%stb.image)
  (export '%stb.image::%compute-huffman-codes :%stb.image)
  (export '%stb.image::%cleanup-jpeg :%stb.image)
  (export '%stb.image::is-hdr-from-file :%stb.image)
  (export '%stb.image::%png-info-raw :%stb.image)
  (export '%stb.image::%hdr-test-core :%stb.image)
  (export '%stb.image::info-from-callbacks :%stb.image)
  (export '%stb.image::*%zdefault-length* :%stb.image)
  (export '%stb.image::|C:@SA@STBI--GIF-LZW| :%stb.image)
  (export '%stb.image::|C:@SA@STBI--CONTEXT| :%stb.image)
  (export '%stb.image::%pnm-load :%stb.image)
  (export '%stb.image::zlib-decode-buffer :%stb.image)
  (export '%stb.image::%jpeg-info :%stb.image)
  (export '%stb.image::%uint16 :%stb.image)
  (export '%stb.image::*%jbias* :%stb.image)
  (export '%stb.image::is-16-bit-from-callbacks :%stb.image)
  (export '%stb.image::%stdio-read :%stb.image)
  (export '%stb.image::%process-marker :%stb.image)
  (export '%stb.image::%jpeg-get-bit :%stb.image)
  (export '%stb.image::%parse-huffman-block :%stb.image)
  (export '%stb.image::%parse-png-file :%stb.image)
  (export '%stb.image::|C:@SA@STBI--RESAMPLE| :%stb.image)
  (export '%stb.image::%mad3sizes-valid :%stb.image)
  (export '%stb.image::*%vertically-flip-on-load-global* :%stb.image)
  (export '%stb.image::%bitreverse16 :%stb.image)
  (export '%stb.image::|C:@SA@STBI--HUFFMAN| :%stb.image)
  (export '%stb.image::%pnm-isspace :%stb.image)
  (export '%stb.image::%zhuffman :%stb.image)
  (export '%stb.image::*%h2l-gamma-i* :%stb.image)
  (export '%stb.image::zlib-decode-malloc :%stb.image)
  (export '%stb.image::+%zfast-bits+ :%stb.image)
  (export '%stb.image::loadf :%stb.image)
  (export '%stb.image::%stdio-eof :%stb.image)
  (export '%stb.image::%convert-format :%stb.image)
  (export '%stb.image::%compute-transparency :%stb.image)
  (export '%stb.image::%huffman :%stb.image)
  (export '%stb.image::%psd-test :%stb.image)
  (export '%stb.image::%clamp :%stb.image)
  (export '%stb.image::%mul2sizes-valid :%stb.image)
  (export '%stb.image::ldr-to-hdr-scale :%stb.image)
  (export '%stb.image::*%vertically-flip-on-load-local* :%stb.image)
  (export '%stb.image::%gif-parse-colortable :%stb.image)
  (export '%stb.image::hdr-to-ldr-gamma :%stb.image)
  (export '%stb.image::%jpeg-load :%stb.image)
  (export '%stb.image::%pnm-getinteger :%stb.image)
  (export '%stb.image::%gif :%stb.image)
  (export '%stb.image::%convert-format16 :%stb.image)
  (export '%stb.image::%addsizes-valid :%stb.image)
  (export '%stb.image::set-flip-vertically-on-load :%stb.image)
  (export '%stb.image::%get32le :%stb.image)
  (export '%stb.image::%high-bit :%stb.image)
  (export '%stb.image::%do-zlib :%stb.image)
  (export '%stb.image::*%zdist-base* :%stb.image)
  (export '%stb.image::%getn :%stb.image)
  (export '%stb.image::%pic-packet :%stb.image)
  (export '%stb.image::%psd-decode-rle :%stb.image)
  (export '%stb.image::%load-and-postprocess-16bit :%stb.image)
  (export '%stb.image::%uint32 :%stb.image)
  (export '%stb.image::|C:@SA@STBI--PNG| :%stb.image)
  (export '%stb.image::%zhuffman-decode-slowpath :%stb.image)
  (export '%stb.image::info-from-file :%stb.image)
  (export '%stb.image::%zhuffman-decode :%stb.image)
  (export '%stb.image::%png :%stb.image)
  (export '%stb.image::+%hdr-buflen+ :%stb.image)
  (export '%stb.image::+max-dimensions+ :%stb.image)
  (export '%stb.image::%stdio-skip :%stb.image)
  (export '%stb.image::|C:@SA@STBI--PIC-PACKET| :%stb.image)
  (export '%stb.image::%bmp-load :%stb.image)
  (export '%stb.image::%gif-info-raw :%stb.image)
  (export '%stb.image::%extend-receive :%stb.image)
  (export '%stb.image::%build-huffman :%stb.image)
  (export '%stb.image::*%g-failure-reason* :%stb.image)
  (export '%stb.image::%load-main :%stb.image)
  (export '%stb.image::%pngchunk :%stb.image)
  (export '%stb.image::%info-main :%stb.image)
  (export '%stb.image::%jpeg-get-bits :%stb.image)
  (export '%stb.image::+%zfast-mask+ :%stb.image)
  (export '%stb.image::%bmp-data :%stb.image)
  (export '%stb.image::%psd-load :%stb.image)
  (export '%stb.image::zlib-decode-noheader-malloc :%stb.image)
  (export '%stb.image::load-from-file :%stb.image)
  (export '%stb.image::%malloc-mad4 :%stb.image)
  (export '%stb.image::%psd-info :%stb.image)
  (export '%stb.image::is-hdr :%stb.image)
  (export '%stb.image::load-16-from-callbacks :%stb.image)
  (export '%stb.image::image-free :%stb.image)
  (export '%stb.image::%gif-info :%stb.image)
  (export '%stb.image::%mad4sizes-valid :%stb.image)
  (export '%stb.image::load-from-file-16 :%stb.image)
  (export '%stb.image::%decode-jpeg-header :%stb.image)
  (export '%stb.image::%pnm-info :%stb.image)
  (export '%stb.image::%skip :%stb.image)
  (export '%stb.image::%jpeg-reset :%stb.image)
  (export '%stb.image::|C:@SA@STBI--JPEG| :%stb.image)
  (export '%stb.image::%fopen :%stb.image)
  (export '%stb.image::is-16-bit :%stb.image)
  (export '%stb.image::%png-is16 :%stb.image)
  (export '%stb.image::%get32be :%stb.image)
  (export '%stb.image::%pic-test-core :%stb.image)
  (export '%stb.image::%resample-row-hv-2 :%stb.image)
  (export '%stb.image::%mad2sizes-valid :%stb.image)
  (export '%stb.image::%parse-zlib-header :%stb.image)
  (export '%stb.image::%expand-png-palette :%stb.image)
  (export '%stb.image::info :%stb.image)
  (export '%stb.image::+%x64-target+ :%stb.image)
  (export '%stb.image::%resample-row-hv-2-simd :%stb.image)
  (export '%stb.image::%load-gif-main :%stb.image)
  (export '%stb.image::%io-file :%stb.image)
  (export '%stb.image::%hdr-to-ldr :%stb.image)
  (export '%stb.image::%float-postprocess :%stb.image)
  (export '%stb.image::+include-stb-image-h+ :%stb.image)
  (export '%stb.image::convert-iphone-png-to-rgb :%stb.image)
  (export '%stb.image::%hdr-info :%stb.image)
  (export '%stb.image::%process-gif-raster :%stb.image)
  (export '%stb.image::%bmp-parse-header :%stb.image)
  (export '%stb.image::%resample :%stb.image)
  (export '%stb.image::is-16-bit-from-memory :%stb.image)
  (export '%stb.image::+%case+ :%stb.image)
  (export '%stb.image::set-unpremultiply-on-load :%stb.image)
  (export '%stb.image::file :%stb.image)
  (export '%stb.image::failure-reason :%stb.image)
  (export '%stb.image::size-t :%stb.image)
  (export '%stb.image::%get8 :%stb.image)
  (export '%stb.image::load-gif-from-memory :%stb.image)
  (export '%stb.image::%malloc-mad3 :%stb.image)
  (export '%stb.image::is-hdr-from-memory :%stb.image)
  (export '%stb.image::%bit-reverse :%stb.image)
  (export '%stb.image::%gif-test :%stb.image)
  (export '%stb.image::%y-cb-cr-to-rgb-simd :%stb.image)
  (export '%stb.image::%pic-is4 :%stb.image)
  (export '%stb.image::%bmp-info :%stb.image)
  (export '%stb.image::%jpeg :%stb.image)
  (export '%stb.image::*%zdist-extra* :%stb.image)
  (export '%stb.image::%build-fast-ac :%stb.image)
  (export '%stb.image::%parse-uncompressed-block :%stb.image)
  (export '%stb.image::%idct-simd :%stb.image)
  (export '%stb.image::%hdr-gettoken :%stb.image)
  (export '%stb.image::|C:@SA@STBI--ZBUF| :%stb.image)
  (export '%stb.image::%get-chunk-header :%stb.image)
  (export '%stb.image::%pnm-test :%stb.image)
  (export '%stb.image::%hdr-test :%stb.image)
  (export '%stb.image::%jpeg-decode-block-prog-dc :%stb.image)
  (export '%stb.image::%start-file :%stb.image)
  (export '%stb.image::%pic-load :%stb.image)
  (export '%stb.image::%png-test :%stb.image)
  (export '%stb.image::zlib-decode-noheader-buffer :%stb.image)
  (export '%stb.image::|C:@SA@STBI--RESULT-INFO| :%stb.image)
  (export '%stb.image::%tga-read-rgb16 :%stb.image)
  (export '%stb.image::%sse2-available :%stb.image)
  (export '%stb.image::*%bmask* :%stb.image)
  (export '%stb.image::+extern+ :%stb.image)
  (export '%stb.image::%pic-info :%stb.image)
  (export '%stb.image::%jpeg-decode-block-prog-ac :%stb.image)
  (export '%stb.image::zlib-decode-malloc-guesssize-headerflag
          :%stb.image)
  (export '%stb.image::%err :%stb.image)
  (export '%stb.image::+sse2+ :%stb.image)
  (export '%stb.image::|C:@SA@STBI--PNGCHUNK| :%stb.image)
  (export '%stb.image::%zget8 :%stb.image)
  (export '%stb.image::%jpeg-huff-decode :%stb.image)
  (export '%stb.image::%pic-test :%stb.image)
  (export '%stb.image::load-from-callbacks :%stb.image)
  (export '%stb.image::%do-png :%stb.image)
  (export '%stb.image::*%l2h-scale* :%stb.image)
  (export '%stb.image::*%zlength-base* :%stb.image)
  (export '%stb.image::%bitcount :%stb.image)
  (export '%stb.image::%free-jpeg-components :%stb.image)
  (export '%stb.image::%compute-transparency16 :%stb.image)
  (export '%stb.image::%jpeg-finish :%stb.image)
  (export '%stb.image::%convert-8-to-16 :%stb.image)
  (export '%stb.image::%jpeg-info-raw :%stb.image)
  (export '%stb.image::%shiftsigned :%stb.image)
  (export '%stb.image::%create-png-image-raw :%stb.image)
  (export '%stb.image::%decode-jpeg-image :%stb.image)
  (export '%stb.image::%blinn-8x8 :%stb.image)
  (export '%stb.image::|C:@SA@STBI--GIF| :%stb.image)
  (export '%stb.image::%context :%stb.image)
  (export '%stb.image::loadf-from-memory :%stb.image)
  (export '%stb.image::%rewind :%stb.image)
  (export '%stb.image::%at-eof :%stb.image)
  (export '%stb.image::%de-iphone :%stb.image)
  (export '%stb.image::+%marker-none+ :%stb.image)
  (export '%stb.image::load-16-from-memory :%stb.image)
  (export '%stb.image::is-16-bit-from-file :%stb.image)
  (export '%stb.image::%resample-row-v-2 :%stb.image)
  (export '%stb.image::*%zdefault-distance* :%stb.image)
  (export '%stb.image::%pnm-skip-whitespace :%stb.image)
  (export '%stb.image::%zexpand :%stb.image)
  (export '%stb.image::%resample-row-h-2 :%stb.image)
  (export '%stb.image::*%de-iphone-flag* :%stb.image))

