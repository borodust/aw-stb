(uiop:define-package :%stb.image (:use))
(uiop:define-package :claw-stb-image-bindings~pristine (:use :cl))
(common-lisp:in-package :claw-stb-image-bindings~pristine)

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
              (%stb.image::retval-from-stbi-load (:pointer :void)))

(declaim (inline %stb.image::info))

(cffi:defcfun ("stbi_info" %stb.image::info)
              :int
              (%stb.image::filename claw-utils:claw-string)
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defcstruct (%stb.image::|C:@SA@STBI-IO-CALLBACKS| :size 24))

(cffi:defctype %stb.image::io-callbacks
               (:struct %stb.image::|C:@SA@STBI-IO-CALLBACKS|))

(declaim (inline %stb.image::info-from-callbacks))

(cffi:defcfun ("stbi_info_from_callbacks"
               %stb.image::info-from-callbacks)
              :int
              (%stb.image::clbk (:pointer %stb.image::io-callbacks))
              (%stb.image::user (:pointer :void))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defcstruct (%stb.image::%io-marker :size 0))

(cffi:defctype %stb.image::%%off-t :long)

(cffi:defctype %stb.image::%io-lock-t :void)

(cffi:defctype %stb.image::%%off64-t :long)

(cffi:defcstruct (%stb.image::%io-codecvt :size 0))

(cffi:defcstruct (%stb.image::%io-wide-data :size 0))

(cffi:defcstruct (%stb.image::%io-file :size 216))

(cffi:defctype %stb.image::size-t :unsigned-long)

(cffi:defcstruct (%stb.image::%io-file :size 216)
                 (%stb.image::%flags :int :offset 0)
                 (%stb.image::%io-read-ptr claw-utils:claw-string
                  :offset 8)
                 (%stb.image::%io-read-end claw-utils:claw-string
                  :offset 16)
                 (%stb.image::%io-read-base claw-utils:claw-string
                  :offset 24)
                 (%stb.image::%io-write-base claw-utils:claw-string
                  :offset 32)
                 (%stb.image::%io-write-ptr claw-utils:claw-string
                  :offset 40)
                 (%stb.image::%io-write-end claw-utils:claw-string
                  :offset 48)
                 (%stb.image::%io-buf-base claw-utils:claw-string
                  :offset 56)
                 (%stb.image::%io-buf-end claw-utils:claw-string
                  :offset 64)
                 (%stb.image::%io-save-base claw-utils:claw-string
                  :offset 72)
                 (%stb.image::%io-backup-base claw-utils:claw-string
                  :offset 80)
                 (%stb.image::%io-save-end claw-utils:claw-string
                  :offset 88)
                 (%stb.image::%markers
                  (:pointer (:struct %stb.image::%io-marker)) :offset
                  96)
                 (%stb.image::%chain
                  (:pointer (:struct %stb.image::%io-file)) :offset
                  104)
                 (%stb.image::%fileno :int :offset 112)
                 (%stb.image::%flags2 :int :offset 116)
                 (%stb.image::%old-offset %stb.image::%%off-t :offset
                  120)
                 (%stb.image::%cur-column :unsigned-short :offset
                  128)
                 (%stb.image::%vtable-offset :char :offset 130)
                 (%stb.image::%shortbuf :char :count 1 :offset 131)
                 (%stb.image::%lock (:pointer %stb.image::%io-lock-t)
                  :offset 136)
                 (%stb.image::%offset %stb.image::%%off64-t :offset
                  144)
                 (%stb.image::%codecvt
                  (:pointer (:struct %stb.image::%io-codecvt))
                  :offset 152)
                 (%stb.image::%wide-data
                  (:pointer (:struct %stb.image::%io-wide-data))
                  :offset 160)
                 (%stb.image::%freeres-list
                  (:pointer (:struct %stb.image::%io-file)) :offset
                  168)
                 (%stb.image::%freeres-buf (:pointer :void) :offset
                  176)
                 (%stb.image::%%pad5 %stb.image::size-t :offset 184)
                 (%stb.image::%mode :int :offset 192)
                 (%stb.image::%unused2 :char :count 20 :offset 196))

(cffi:defctype %stb.image::file (:struct %stb.image::%io-file))

(declaim (inline %stb.image::info-from-file))

(cffi:defcfun ("stbi_info_from_file" %stb.image::info-from-file)
              :int
              (%stb.image::f (:pointer %stb.image::file))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defctype %stb.image::uc :unsigned-char)

(declaim (inline %stb.image::info-from-memory))

(cffi:defcfun ("stbi_info_from_memory" %stb.image::info-from-memory)
              :int
              (%stb.image::buffer (:pointer %stb.image::uc))
              (%stb.image::len :int)
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(declaim (inline %stb.image::is-16-bit))

(cffi:defcfun ("stbi_is_16_bit" %stb.image::is-16-bit)
              :int
              (%stb.image::filename claw-utils:claw-string))

(declaim (inline %stb.image::is-16-bit-from-callbacks))

(cffi:defcfun ("stbi_is_16_bit_from_callbacks"
               %stb.image::is-16-bit-from-callbacks)
              :int
              (%stb.image::clbk (:pointer %stb.image::io-callbacks))
              (%stb.image::user (:pointer :void)))

(declaim (inline %stb.image::is-16-bit-from-file))

(cffi:defcfun ("stbi_is_16_bit_from_file"
               %stb.image::is-16-bit-from-file)
              :int
              (%stb.image::f (:pointer %stb.image::file)))

(declaim (inline %stb.image::is-16-bit-from-memory))

(cffi:defcfun ("stbi_is_16_bit_from_memory"
               %stb.image::is-16-bit-from-memory)
              :int
              (%stb.image::buffer (:pointer %stb.image::uc))
              (%stb.image::len :int))

(declaim (inline %stb.image::is-hdr))

(cffi:defcfun ("stbi_is_hdr" %stb.image::is-hdr)
              :int
              (%stb.image::filename claw-utils:claw-string))

(declaim (inline %stb.image::is-hdr-from-callbacks))

(cffi:defcfun ("stbi_is_hdr_from_callbacks"
               %stb.image::is-hdr-from-callbacks)
              :int
              (%stb.image::clbk (:pointer %stb.image::io-callbacks))
              (%stb.image::user (:pointer :void)))

(declaim (inline %stb.image::is-hdr-from-file))

(cffi:defcfun ("stbi_is_hdr_from_file" %stb.image::is-hdr-from-file)
              :int
              (%stb.image::f (:pointer %stb.image::file)))

(declaim (inline %stb.image::is-hdr-from-memory))

(cffi:defcfun ("stbi_is_hdr_from_memory"
               %stb.image::is-hdr-from-memory)
              :int
              (%stb.image::buffer (:pointer %stb.image::uc))
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
              (:pointer %stb.image::uc)
              (%stb.image::filename claw-utils:claw-string)
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(cffi:defctype %stb.image::us :unsigned-short)

(declaim (inline %stb.image::load-16))

(cffi:defcfun ("stbi_load_16" %stb.image::load-16)
              (:pointer %stb.image::us)
              (%stb.image::filename claw-utils:claw-string)
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::load-16-from-callbacks))

(cffi:defcfun ("stbi_load_16_from_callbacks"
               %stb.image::load-16-from-callbacks)
              (:pointer %stb.image::us)
              (%stb.image::clbk (:pointer %stb.image::io-callbacks))
              (%stb.image::user (:pointer :void))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::load-16-from-memory))

(cffi:defcfun ("stbi_load_16_from_memory"
               %stb.image::load-16-from-memory)
              (:pointer %stb.image::us)
              (%stb.image::buffer (:pointer %stb.image::uc))
              (%stb.image::len :int)
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::load-from-callbacks))

(cffi:defcfun ("stbi_load_from_callbacks"
               %stb.image::load-from-callbacks)
              (:pointer %stb.image::uc)
              (%stb.image::clbk (:pointer %stb.image::io-callbacks))
              (%stb.image::user (:pointer :void))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::load-from-file))

(cffi:defcfun ("stbi_load_from_file" %stb.image::load-from-file)
              (:pointer %stb.image::uc)
              (%stb.image::f (:pointer %stb.image::file))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::load-from-file-16))

(cffi:defcfun ("stbi_load_from_file_16"
               %stb.image::load-from-file-16)
              (:pointer %stb.image::us)
              (%stb.image::f (:pointer %stb.image::file))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::load-from-memory))

(cffi:defcfun ("stbi_load_from_memory" %stb.image::load-from-memory)
              (:pointer %stb.image::uc)
              (%stb.image::buffer (:pointer %stb.image::uc))
              (%stb.image::len :int)
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::load-gif-from-memory))

(cffi:defcfun ("stbi_load_gif_from_memory"
               %stb.image::load-gif-from-memory)
              (:pointer %stb.image::uc)
              (%stb.image::buffer (:pointer %stb.image::uc))
              (%stb.image::len :int)
              (%stb.image::delays (:pointer (:pointer :int)))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::z (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int))

(declaim (inline %stb.image::loadf))

(cffi:defcfun ("stbi_loadf" %stb.image::loadf)
              (:pointer :float)
              (%stb.image::filename claw-utils:claw-string)
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::loadf-from-callbacks))

(cffi:defcfun ("stbi_loadf_from_callbacks"
               %stb.image::loadf-from-callbacks)
              (:pointer :float)
              (%stb.image::clbk (:pointer %stb.image::io-callbacks))
              (%stb.image::user (:pointer :void))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::loadf-from-file))

(cffi:defcfun ("stbi_loadf_from_file" %stb.image::loadf-from-file)
              (:pointer :float)
              (%stb.image::f (:pointer %stb.image::file))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(declaim (inline %stb.image::loadf-from-memory))

(cffi:defcfun ("stbi_loadf_from_memory"
               %stb.image::loadf-from-memory)
              (:pointer :float)
              (%stb.image::buffer (:pointer %stb.image::uc))
              (%stb.image::len :int)
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
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
              (%stb.image::outlen (:pointer :int)))

(declaim (inline %stb.image::zlib-decode-malloc-guesssize))

(cffi:defcfun ("stbi_zlib_decode_malloc_guesssize"
               %stb.image::zlib-decode-malloc-guesssize)
              claw-utils:claw-string
              (%stb.image::buffer claw-utils:claw-string)
              (%stb.image::len :int)
              (%stb.image::initial-size :int)
              (%stb.image::outlen (:pointer :int)))

(declaim (inline %stb.image::zlib-decode-malloc-guesssize-headerflag))

(cffi:defcfun ("stbi_zlib_decode_malloc_guesssize_headerflag"
               %stb.image::zlib-decode-malloc-guesssize-headerflag)
              claw-utils:claw-string
              (%stb.image::buffer claw-utils:claw-string)
              (%stb.image::len :int)
              (%stb.image::initial-size :int)
              (%stb.image::outlen (:pointer :int))
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
              (%stb.image::outlen (:pointer :int)))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--BMP-DATA| :size 36))

(cffi:defctype %stb.image::%bmp-data
               (:struct %stb.image::|C:@SA@STBI--BMP-DATA|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--CONTEXT| :size 224))

(cffi:defctype %stb.image::%context
               (:struct %stb.image::|C:@SA@STBI--CONTEXT|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--GIF| :size 34928))

(cffi:defctype %stb.image::%gif
               (:struct %stb.image::|C:@SA@STBI--GIF|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--GIF-LZW| :size 4))

(cffi:defctype %stb.image::%gif-lzw
               (:struct %stb.image::|C:@SA@STBI--GIF-LZW|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--HUFFMAN| :size 1680))

(cffi:defctype %stb.image::%huffman
               (:struct %stb.image::|C:@SA@STBI--HUFFMAN|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--JPEG| :size 18568))

(cffi:defctype %stb.image::%jpeg
               (:struct %stb.image::|C:@SA@STBI--JPEG|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--PIC-PACKET| :size 3))

(cffi:defctype %stb.image::%pic-packet
               (:struct %stb.image::|C:@SA@STBI--PIC-PACKET|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--PNG| :size 40))

(cffi:defctype %stb.image::%png
               (:struct %stb.image::|C:@SA@STBI--PNG|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--PNGCHUNK| :size 8))

(cffi:defctype %stb.image::%pngchunk
               (:struct %stb.image::|C:@SA@STBI--PNGCHUNK|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--RESAMPLE| :size 48))

(cffi:defctype %stb.image::%resample
               (:struct %stb.image::|C:@SA@STBI--RESAMPLE|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--RESULT-INFO| :size 12))

(cffi:defctype %stb.image::%result-info
               (:struct %stb.image::|C:@SA@STBI--RESULT-INFO|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--ZBUF| :size 4096))

(cffi:defctype %stb.image::%zbuf
               (:struct %stb.image::|C:@SA@STBI--ZBUF|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--ZHUFFMAN| :size 2020))

(cffi:defctype %stb.image::%zhuffman
               (:struct %stb.image::|C:@SA@STBI--ZHUFFMAN|))

(declaim (inline %stb.image::%y-cb-cr-to-rgb-row))

(cffi:defcfun ("stbi__YCbCr_to_RGB_row"
               %stb.image::%y-cb-cr-to-rgb-row)
              :void
              (%stb.image::out (:pointer %stb.image::uc))
              (%stb.image::y (:pointer %stb.image::uc))
              (%stb.image::pcb (:pointer %stb.image::uc))
              (%stb.image::pcr (:pointer %stb.image::uc))
              (%stb.image::count :int)
              (%stb.image::step :int))

(declaim (inline %stb.image::%y-cb-cr-to-rgb-simd))

(cffi:defcfun ("stbi__YCbCr_to_RGB_simd"
               %stb.image::%y-cb-cr-to-rgb-simd)
              :void
              (%stb.image::out (:pointer %stb.image::uc))
              (%stb.image::y (:pointer %stb.image::uc))
              (%stb.image::pcb (:pointer %stb.image::uc))
              (%stb.image::pcr (:pointer %stb.image::uc))
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
              (%stb.image::s (:pointer %stb.image::%context)))

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
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(declaim (inline %stb.image::%bmp-load))

(cffi:defcfun ("stbi__bmp_load" %stb.image::%bmp-load)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info)))

(declaim (inline %stb.image::%bmp-parse-header))

(cffi:defcfun ("stbi__bmp_parse_header"
               %stb.image::%bmp-parse-header)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::info (:pointer %stb.image::%bmp-data)))

(declaim (inline %stb.image::%bmp-test))

(cffi:defcfun ("stbi__bmp_test" %stb.image::%bmp-test)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%bmp-test-raw))

(cffi:defcfun ("stbi__bmp_test_raw" %stb.image::%bmp-test-raw)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defctype %stb.image::%int16 :short)

(declaim (inline %stb.image::%build-fast-ac))

(cffi:defcfun ("stbi__build_fast_ac" %stb.image::%build-fast-ac)
              :void
              (%stb.image::fast-ac (:pointer %stb.image::%int16))
              (%stb.image::h (:pointer %stb.image::%huffman)))

(declaim (inline %stb.image::%build-huffman))

(cffi:defcfun ("stbi__build_huffman" %stb.image::%build-huffman)
              :int
              (%stb.image::h (:pointer %stb.image::%huffman))
              (%stb.image::count (:pointer :int)))

(declaim (inline %stb.image::%check-png-header))

(cffi:defcfun ("stbi__check_png_header"
               %stb.image::%check-png-header)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%clamp))

(cffi:defcfun ("stbi__clamp" %stb.image::%clamp)
              %stb.image::uc
              (%stb.image::x :int))

(declaim (inline %stb.image::%cleanup-jpeg))

(cffi:defcfun ("stbi__cleanup_jpeg" %stb.image::%cleanup-jpeg)
              :void
              (%stb.image::j (:pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%compute-huffman-codes))

(cffi:defcfun ("stbi__compute_huffman_codes"
               %stb.image::%compute-huffman-codes)
              :int
              (%stb.image::a (:pointer %stb.image::%zbuf)))

(declaim (inline %stb.image::%compute-transparency))

(cffi:defcfun ("stbi__compute_transparency"
               %stb.image::%compute-transparency)
              :int
              (%stb.image::z (:pointer %stb.image::%png))
              (%stb.image::tc (:array %stb.image::uc 3))
              (%stb.image::out-n :int))

(cffi:defctype %stb.image::%uint16 :unsigned-short)

(declaim (inline %stb.image::%compute-transparency16))

(cffi:defcfun ("stbi__compute_transparency16"
               %stb.image::%compute-transparency16)
              :int
              (%stb.image::z (:pointer %stb.image::%png))
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
              (:pointer %stb.image::uc)
              (%stb.image::orig (:pointer %stb.image::%uint16))
              (%stb.image::w :int)
              (%stb.image::h :int)
              (%stb.image::channels :int))

(declaim (inline %stb.image::%convert-8-to-16))

(cffi:defcfun ("stbi__convert_8_to_16" %stb.image::%convert-8-to-16)
              (:pointer %stb.image::%uint16)
              (%stb.image::orig (:pointer %stb.image::uc))
              (%stb.image::w :int)
              (%stb.image::h :int)
              (%stb.image::channels :int))

(declaim (inline %stb.image::%convert-format))

(cffi:defcfun ("stbi__convert_format" %stb.image::%convert-format)
              (:pointer :unsigned-char)
              (%stb.image::data (:pointer :unsigned-char))
              (%stb.image::img-n :int)
              (%stb.image::req-comp :int)
              (%stb.image::x :unsigned-int)
              (%stb.image::y :unsigned-int))

(declaim (inline %stb.image::%convert-format16))

(cffi:defcfun ("stbi__convert_format16"
               %stb.image::%convert-format16)
              (:pointer %stb.image::%uint16)
              (%stb.image::data (:pointer %stb.image::%uint16))
              (%stb.image::img-n :int)
              (%stb.image::req-comp :int)
              (%stb.image::x :unsigned-int)
              (%stb.image::y :unsigned-int))

(declaim (inline %stb.image::%copyval))

(cffi:defcfun ("stbi__copyval" %stb.image::%copyval)
              :void
              (%stb.image::channel :int)
              (%stb.image::dest (:pointer %stb.image::uc))
              (%stb.image::src (:pointer %stb.image::uc)))

(cffi:defctype %stb.image::%uint32 :unsigned-int)

(declaim (inline %stb.image::%create-png-image))

(cffi:defcfun ("stbi__create_png_image"
               %stb.image::%create-png-image)
              :int
              (%stb.image::a (:pointer %stb.image::%png))
              (%stb.image::image-data (:pointer %stb.image::uc))
              (%stb.image::image-data-len %stb.image::%uint32)
              (%stb.image::out-n :int)
              (%stb.image::depth :int)
              (%stb.image::color :int)
              (%stb.image::interlaced :int))

(declaim (inline %stb.image::%create-png-image-raw))

(cffi:defcfun ("stbi__create_png_image_raw"
               %stb.image::%create-png-image-raw)
              :int
              (%stb.image::a (:pointer %stb.image::%png))
              (%stb.image::raw (:pointer %stb.image::uc))
              (%stb.image::raw-len %stb.image::%uint32)
              (%stb.image::out-n :int)
              (%stb.image::x %stb.image::%uint32)
              (%stb.image::y %stb.image::%uint32)
              (%stb.image::depth :int)
              (%stb.image::color :int))

(declaim (inline %stb.image::%de-iphone))

(cffi:defcfun ("stbi__de_iphone" %stb.image::%de-iphone)
              :void
              (%stb.image::z (:pointer %stb.image::%png)))

(declaim (inline %stb.image::%decode-jpeg-header))

(cffi:defcfun ("stbi__decode_jpeg_header"
               %stb.image::%decode-jpeg-header)
              :int
              (%stb.image::z (:pointer %stb.image::%jpeg))
              (%stb.image::scan :int))

(declaim (inline %stb.image::%decode-jpeg-image))

(cffi:defcfun ("stbi__decode_jpeg_image"
               %stb.image::%decode-jpeg-image)
              :int
              (%stb.image::j (:pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%do-png))

(cffi:defcfun ("stbi__do_png" %stb.image::%do-png)
              (:pointer :void)
              (%stb.image::p (:pointer %stb.image::%png))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::n (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info)))

(declaim (inline %stb.image::%do-zlib))

(cffi:defcfun ("stbi__do_zlib" %stb.image::%do-zlib)
              :int
              (%stb.image::a (:pointer %stb.image::%zbuf))
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
              (%stb.image::a (:pointer %stb.image::%png))
              (%stb.image::palette (:pointer %stb.image::uc))
              (%stb.image::len :int)
              (%stb.image::pal-img-n :int))

(declaim (inline %stb.image::%extend-receive))

(cffi:defcfun ("stbi__extend_receive" %stb.image::%extend-receive)
              :int
              (%stb.image::j (:pointer %stb.image::%jpeg))
              (%stb.image::n :int))

(declaim (inline %stb.image::%fill-bits))

(cffi:defcfun ("stbi__fill_bits" %stb.image::%fill-bits)
              :void
              (%stb.image::z (:pointer %stb.image::%zbuf)))

(declaim (inline %stb.image::%float-postprocess))

(cffi:defcfun ("stbi__float_postprocess"
               %stb.image::%float-postprocess)
              :void
              (%stb.image::result (:pointer :float))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int))

(declaim (inline %stb.image::%fopen))

(cffi:defcfun ("stbi__fopen" %stb.image::%fopen)
              (:pointer %stb.image::file)
              (%stb.image::filename claw-utils:claw-string)
              (%stb.image::mode claw-utils:claw-string))

(declaim (inline %stb.image::%free-jpeg-components))

(cffi:defcfun ("stbi__free_jpeg_components"
               %stb.image::%free-jpeg-components)
              :int
              (%stb.image::z (:pointer %stb.image::%jpeg))
              (%stb.image::ncomp :int)
              (%stb.image::why :int))

(declaim (inline %stb.image::%get16be))

(cffi:defcfun ("stbi__get16be" %stb.image::%get16be)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%get16le))

(cffi:defcfun ("stbi__get16le" %stb.image::%get16le)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%get32be))

(cffi:defcfun ("stbi__get32be" %stb.image::%get32be)
              %stb.image::%uint32
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%get32le))

(cffi:defcfun ("stbi__get32le" %stb.image::%get32le)
              %stb.image::%uint32
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%get8))

(cffi:defcfun ("stbi__get8" %stb.image::%get8)
              %stb.image::uc
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%get-chunk-header))

(cffi:defcfun ("__claw_stbi__get_chunk_header"
               %stb.image::%get-chunk-header)
              (:pointer %stb.image::%pngchunk)
              (%stb.image::%%claw-result-
               (:pointer %stb.image::%pngchunk))
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%get-marker))

(cffi:defcfun ("stbi__get_marker" %stb.image::%get-marker)
              %stb.image::uc
              (%stb.image::j (:pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%getn))

(cffi:defcfun ("stbi__getn" %stb.image::%getn)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::buffer (:pointer %stb.image::uc))
              (%stb.image::n :int))

(declaim (inline %stb.image::%gif-header))

(cffi:defcfun ("stbi__gif_header" %stb.image::%gif-header)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::g (:pointer %stb.image::%gif))
              (%stb.image::comp (:pointer :int))
              (%stb.image::is-info :int))

(declaim (inline %stb.image::%gif-info))

(cffi:defcfun ("stbi__gif_info" %stb.image::%gif-info)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(declaim (inline %stb.image::%gif-info-raw))

(cffi:defcfun ("stbi__gif_info_raw" %stb.image::%gif-info-raw)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(declaim (inline %stb.image::%gif-load))

(cffi:defcfun ("stbi__gif_load" %stb.image::%gif-load)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info)))

(declaim (inline %stb.image::%gif-load-next))

(cffi:defcfun ("stbi__gif_load_next" %stb.image::%gif-load-next)
              (:pointer %stb.image::uc)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::g (:pointer %stb.image::%gif))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::two-back (:pointer %stb.image::uc)))

(declaim (inline %stb.image::%gif-parse-colortable))

(cffi:defcfun ("stbi__gif_parse_colortable"
               %stb.image::%gif-parse-colortable)
              :void
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::pal
               (:array (:array %stb.image::uc 4) 256))
              (%stb.image::num-entries :int)
              (%stb.image::transp :int))

(declaim (inline %stb.image::%gif-test))

(cffi:defcfun ("stbi__gif_test" %stb.image::%gif-test)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%gif-test-raw))

(cffi:defcfun ("stbi__gif_test_raw" %stb.image::%gif-test-raw)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%grow-buffer-unsafe))

(cffi:defcfun ("stbi__grow_buffer_unsafe"
               %stb.image::%grow-buffer-unsafe)
              :void
              (%stb.image::j (:pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%hdr-convert))

(cffi:defcfun ("stbi__hdr_convert" %stb.image::%hdr-convert)
              :void
              (%stb.image::output (:pointer :float))
              (%stb.image::input (:pointer %stb.image::uc))
              (%stb.image::req-comp :int))

(declaim (inline %stb.image::%hdr-gettoken))

(cffi:defcfun ("stbi__hdr_gettoken" %stb.image::%hdr-gettoken)
              claw-utils:claw-string
              (%stb.image::z (:pointer %stb.image::%context))
              (%stb.image::buffer claw-utils:claw-string))

(declaim (inline %stb.image::%hdr-info))

(cffi:defcfun ("stbi__hdr_info" %stb.image::%hdr-info)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(declaim (inline %stb.image::%hdr-load))

(cffi:defcfun ("stbi__hdr_load" %stb.image::%hdr-load)
              (:pointer :float)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info)))

(declaim (inline %stb.image::%hdr-test))

(cffi:defcfun ("stbi__hdr_test" %stb.image::%hdr-test)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%hdr-test-core))

(cffi:defcfun ("stbi__hdr_test_core" %stb.image::%hdr-test-core)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::signature claw-utils:claw-string))

(declaim (inline %stb.image::%hdr-to-ldr))

(cffi:defcfun ("stbi__hdr_to_ldr" %stb.image::%hdr-to-ldr)
              (:pointer %stb.image::uc)
              (%stb.image::data (:pointer :float))
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
              (%stb.image::out (:pointer %stb.image::uc))
              (%stb.image::out-stride :int)
              (%stb.image::data (:array :short 64)))

(declaim (inline %stb.image::%idct-simd))

(cffi:defcfun ("stbi__idct_simd" %stb.image::%idct-simd)
              :void
              (%stb.image::out (:pointer %stb.image::uc))
              (%stb.image::out-stride :int)
              (%stb.image::data (:array :short 64)))

(declaim (inline %stb.image::%info-main))

(cffi:defcfun ("stbi__info_main" %stb.image::%info-main)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(declaim (inline %stb.image::%is-16-main))

(cffi:defcfun ("stbi__is_16_main" %stb.image::%is-16-main)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%jpeg-decode-block))

(cffi:defcfun ("stbi__jpeg_decode_block"
               %stb.image::%jpeg-decode-block)
              :int
              (%stb.image::j (:pointer %stb.image::%jpeg))
              (%stb.image::data (:array :short 64))
              (%stb.image::hdc (:pointer %stb.image::%huffman))
              (%stb.image::hac (:pointer %stb.image::%huffman))
              (%stb.image::fac (:pointer %stb.image::%int16))
              (%stb.image::b :int)
              (%stb.image::dequant (:pointer %stb.image::%uint16)))

(declaim (inline %stb.image::%jpeg-decode-block-prog-ac))

(cffi:defcfun ("stbi__jpeg_decode_block_prog_ac"
               %stb.image::%jpeg-decode-block-prog-ac)
              :int
              (%stb.image::j (:pointer %stb.image::%jpeg))
              (%stb.image::data (:array :short 64))
              (%stb.image::hac (:pointer %stb.image::%huffman))
              (%stb.image::fac (:pointer %stb.image::%int16)))

(declaim (inline %stb.image::%jpeg-decode-block-prog-dc))

(cffi:defcfun ("stbi__jpeg_decode_block_prog_dc"
               %stb.image::%jpeg-decode-block-prog-dc)
              :int
              (%stb.image::j (:pointer %stb.image::%jpeg))
              (%stb.image::data (:array :short 64))
              (%stb.image::hdc (:pointer %stb.image::%huffman))
              (%stb.image::b :int))

(declaim (inline %stb.image::%jpeg-dequantize))

(cffi:defcfun ("stbi__jpeg_dequantize" %stb.image::%jpeg-dequantize)
              :void
              (%stb.image::data (:pointer :short))
              (%stb.image::dequant (:pointer %stb.image::%uint16)))

(declaim (inline %stb.image::%jpeg-finish))

(cffi:defcfun ("stbi__jpeg_finish" %stb.image::%jpeg-finish)
              :void
              (%stb.image::z (:pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%jpeg-get-bit))

(cffi:defcfun ("stbi__jpeg_get_bit" %stb.image::%jpeg-get-bit)
              :int
              (%stb.image::j (:pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%jpeg-get-bits))

(cffi:defcfun ("stbi__jpeg_get_bits" %stb.image::%jpeg-get-bits)
              :int
              (%stb.image::j (:pointer %stb.image::%jpeg))
              (%stb.image::n :int))

(declaim (inline %stb.image::%jpeg-huff-decode))

(cffi:defcfun ("stbi__jpeg_huff_decode"
               %stb.image::%jpeg-huff-decode)
              :int
              (%stb.image::j (:pointer %stb.image::%jpeg))
              (%stb.image::h (:pointer %stb.image::%huffman)))

(declaim (inline %stb.image::%jpeg-info))

(cffi:defcfun ("stbi__jpeg_info" %stb.image::%jpeg-info)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(declaim (inline %stb.image::%jpeg-info-raw))

(cffi:defcfun ("stbi__jpeg_info_raw" %stb.image::%jpeg-info-raw)
              :int
              (%stb.image::j (:pointer %stb.image::%jpeg))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(declaim (inline %stb.image::%jpeg-load))

(cffi:defcfun ("stbi__jpeg_load" %stb.image::%jpeg-load)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info)))

(declaim (inline %stb.image::%jpeg-reset))

(cffi:defcfun ("stbi__jpeg_reset" %stb.image::%jpeg-reset)
              :void
              (%stb.image::j (:pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%jpeg-test))

(cffi:defcfun ("stbi__jpeg_test" %stb.image::%jpeg-test)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%ldr-to-hdr))

(cffi:defcfun ("stbi__ldr_to_hdr" %stb.image::%ldr-to-hdr)
              (:pointer :float)
              (%stb.image::data (:pointer %stb.image::uc))
              (%stb.image::x :int)
              (%stb.image::y :int)
              (%stb.image::comp :int))

(declaim (inline %stb.image::%load-and-postprocess-16bit))

(cffi:defcfun ("stbi__load_and_postprocess_16bit"
               %stb.image::%load-and-postprocess-16bit)
              (:pointer %stb.image::%uint16)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int))

(declaim (inline %stb.image::%load-and-postprocess-8bit))

(cffi:defcfun ("stbi__load_and_postprocess_8bit"
               %stb.image::%load-and-postprocess-8bit)
              (:pointer :unsigned-char)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int))

(declaim (inline %stb.image::%load-gif-main))

(cffi:defcfun ("stbi__load_gif_main" %stb.image::%load-gif-main)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::delays (:pointer (:pointer :int)))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::z (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int))

(declaim (inline %stb.image::%load-main))

(cffi:defcfun ("stbi__load_main" %stb.image::%load-main)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info))
              (%stb.image::bpc :int))

(declaim (inline %stb.image::%loadf-main))

(cffi:defcfun ("stbi__loadf_main" %stb.image::%loadf-main)
              (:pointer :float)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
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
              (:pointer :void)
              (%stb.image::size %stb.image::size-t))

(declaim (inline %stb.image::%malloc-mad2))

(cffi:defcfun ("stbi__malloc_mad2" %stb.image::%malloc-mad2)
              (:pointer :void)
              (%stb.image::a :int)
              (%stb.image::b :int)
              (%stb.image::add :int))

(declaim (inline %stb.image::%malloc-mad3))

(cffi:defcfun ("stbi__malloc_mad3" %stb.image::%malloc-mad3)
              (:pointer :void)
              (%stb.image::a :int)
              (%stb.image::b :int)
              (%stb.image::c :int)
              (%stb.image::add :int))

(declaim (inline %stb.image::%malloc-mad4))

(cffi:defcfun ("stbi__malloc_mad4" %stb.image::%malloc-mad4)
              (:pointer :void)
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
              (%stb.image::g (:pointer %stb.image::%gif))
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
              (%stb.image::z (:pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%parse-huffman-block))

(cffi:defcfun ("stbi__parse_huffman_block"
               %stb.image::%parse-huffman-block)
              :int
              (%stb.image::a (:pointer %stb.image::%zbuf)))

(declaim (inline %stb.image::%parse-png-file))

(cffi:defcfun ("stbi__parse_png_file" %stb.image::%parse-png-file)
              :int
              (%stb.image::z (:pointer %stb.image::%png))
              (%stb.image::scan :int)
              (%stb.image::req-comp :int))

(declaim (inline %stb.image::%parse-uncompressed-block))

(cffi:defcfun ("stbi__parse_uncompressed_block"
               %stb.image::%parse-uncompressed-block)
              :int
              (%stb.image::a (:pointer %stb.image::%zbuf)))

(declaim (inline %stb.image::%parse-zlib))

(cffi:defcfun ("stbi__parse_zlib" %stb.image::%parse-zlib)
              :int
              (%stb.image::a (:pointer %stb.image::%zbuf))
              (%stb.image::parse-header :int))

(declaim (inline %stb.image::%parse-zlib-header))

(cffi:defcfun ("stbi__parse_zlib_header"
               %stb.image::%parse-zlib-header)
              :int
              (%stb.image::a (:pointer %stb.image::%zbuf)))

(declaim (inline %stb.image::%pic-info))

(cffi:defcfun ("stbi__pic_info" %stb.image::%pic-info)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(declaim (inline %stb.image::%pic-is4))

(cffi:defcfun ("stbi__pic_is4" %stb.image::%pic-is4)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::str claw-utils:claw-string))

(declaim (inline %stb.image::%pic-load))

(cffi:defcfun ("stbi__pic_load" %stb.image::%pic-load)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info)))

(declaim (inline %stb.image::%pic-load-core))

(cffi:defcfun ("stbi__pic_load_core" %stb.image::%pic-load-core)
              (:pointer %stb.image::uc)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::width :int)
              (%stb.image::height :int)
              (%stb.image::comp (:pointer :int))
              (%stb.image::result (:pointer %stb.image::uc)))

(declaim (inline %stb.image::%pic-test))

(cffi:defcfun ("stbi__pic_test" %stb.image::%pic-test)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%pic-test-core))

(cffi:defcfun ("stbi__pic_test_core" %stb.image::%pic-test-core)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%png-info))

(cffi:defcfun ("stbi__png_info" %stb.image::%png-info)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(declaim (inline %stb.image::%png-info-raw))

(cffi:defcfun ("stbi__png_info_raw" %stb.image::%png-info-raw)
              :int
              (%stb.image::p (:pointer %stb.image::%png))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(declaim (inline %stb.image::%png-is16))

(cffi:defcfun ("stbi__png_is16" %stb.image::%png-is16)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%png-load))

(cffi:defcfun ("stbi__png_load" %stb.image::%png-load)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info)))

(declaim (inline %stb.image::%png-test))

(cffi:defcfun ("stbi__png_test" %stb.image::%png-test)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%pnm-getinteger))

(cffi:defcfun ("stbi__pnm_getinteger" %stb.image::%pnm-getinteger)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::c claw-utils:claw-string))

(declaim (inline %stb.image::%pnm-info))

(cffi:defcfun ("stbi__pnm_info" %stb.image::%pnm-info)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

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
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info)))

(declaim (inline %stb.image::%pnm-skip-whitespace))

(cffi:defcfun ("stbi__pnm_skip_whitespace"
               %stb.image::%pnm-skip-whitespace)
              :void
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::c claw-utils:claw-string))

(declaim (inline %stb.image::%pnm-test))

(cffi:defcfun ("stbi__pnm_test" %stb.image::%pnm-test)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%process-frame-header))

(cffi:defcfun ("stbi__process_frame_header"
               %stb.image::%process-frame-header)
              :int
              (%stb.image::z (:pointer %stb.image::%jpeg))
              (%stb.image::scan :int))

(declaim (inline %stb.image::%process-gif-raster))

(cffi:defcfun ("stbi__process_gif_raster"
               %stb.image::%process-gif-raster)
              (:pointer %stb.image::uc)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::g (:pointer %stb.image::%gif)))

(declaim (inline %stb.image::%process-marker))

(cffi:defcfun ("stbi__process_marker" %stb.image::%process-marker)
              :int
              (%stb.image::z (:pointer %stb.image::%jpeg))
              (%stb.image::m :int))

(declaim (inline %stb.image::%process-scan-header))

(cffi:defcfun ("stbi__process_scan_header"
               %stb.image::%process-scan-header)
              :int
              (%stb.image::z (:pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%psd-decode-rle))

(cffi:defcfun ("stbi__psd_decode_rle" %stb.image::%psd-decode-rle)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::p (:pointer %stb.image::uc))
              (%stb.image::pixel-count :int))

(declaim (inline %stb.image::%psd-info))

(cffi:defcfun ("stbi__psd_info" %stb.image::%psd-info)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(declaim (inline %stb.image::%psd-is16))

(cffi:defcfun ("stbi__psd_is16" %stb.image::%psd-is16)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%psd-load))

(cffi:defcfun ("stbi__psd_load" %stb.image::%psd-load)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info))
              (%stb.image::bpc :int))

(declaim (inline %stb.image::%psd-test))

(cffi:defcfun ("stbi__psd_test" %stb.image::%psd-test)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%readval))

(cffi:defcfun ("stbi__readval" %stb.image::%readval)
              (:pointer %stb.image::uc)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::channel :int)
              (%stb.image::dest (:pointer %stb.image::uc)))

(declaim (inline %stb.image::%refill-buffer))

(cffi:defcfun ("stbi__refill_buffer" %stb.image::%refill-buffer)
              :void
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%resample-row-generic))

(cffi:defcfun ("stbi__resample_row_generic"
               %stb.image::%resample-row-generic)
              (:pointer %stb.image::uc)
              (%stb.image::out (:pointer %stb.image::uc))
              (%stb.image::in-near (:pointer %stb.image::uc))
              (%stb.image::in-far (:pointer %stb.image::uc))
              (%stb.image::w :int)
              (%stb.image::hs :int))

(declaim (inline %stb.image::%resample-row-h-2))

(cffi:defcfun ("stbi__resample_row_h_2"
               %stb.image::%resample-row-h-2)
              (:pointer %stb.image::uc)
              (%stb.image::out (:pointer %stb.image::uc))
              (%stb.image::in-near (:pointer %stb.image::uc))
              (%stb.image::in-far (:pointer %stb.image::uc))
              (%stb.image::w :int)
              (%stb.image::hs :int))

(declaim (inline %stb.image::%resample-row-hv-2))

(cffi:defcfun ("stbi__resample_row_hv_2"
               %stb.image::%resample-row-hv-2)
              (:pointer %stb.image::uc)
              (%stb.image::out (:pointer %stb.image::uc))
              (%stb.image::in-near (:pointer %stb.image::uc))
              (%stb.image::in-far (:pointer %stb.image::uc))
              (%stb.image::w :int)
              (%stb.image::hs :int))

(declaim (inline %stb.image::%resample-row-hv-2-simd))

(cffi:defcfun ("stbi__resample_row_hv_2_simd"
               %stb.image::%resample-row-hv-2-simd)
              (:pointer %stb.image::uc)
              (%stb.image::out (:pointer %stb.image::uc))
              (%stb.image::in-near (:pointer %stb.image::uc))
              (%stb.image::in-far (:pointer %stb.image::uc))
              (%stb.image::w :int)
              (%stb.image::hs :int))

(declaim (inline %stb.image::%resample-row-v-2))

(cffi:defcfun ("stbi__resample_row_v_2"
               %stb.image::%resample-row-v-2)
              (:pointer %stb.image::uc)
              (%stb.image::out (:pointer %stb.image::uc))
              (%stb.image::in-near (:pointer %stb.image::uc))
              (%stb.image::in-far (:pointer %stb.image::uc))
              (%stb.image::w :int)
              (%stb.image::hs :int))

(declaim (inline %stb.image::%rewind))

(cffi:defcfun ("stbi__rewind" %stb.image::%rewind)
              :void
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%setup-jpeg))

(cffi:defcfun ("stbi__setup_jpeg" %stb.image::%setup-jpeg)
              :void
              (%stb.image::j (:pointer %stb.image::%jpeg)))

(declaim (inline %stb.image::%shiftsigned))

(cffi:defcfun ("stbi__shiftsigned" %stb.image::%shiftsigned)
              :int
              (%stb.image::v :unsigned-int)
              (%stb.image::shift :int)
              (%stb.image::bits :int))

(declaim (inline %stb.image::%skip))

(cffi:defcfun ("stbi__skip" %stb.image::%skip)
              :void
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::n :int))

(declaim (inline %stb.image::%sse2-available))

(cffi:defcfun ("stbi__sse2_available" %stb.image::%sse2-available)
              :int)

(declaim (inline %stb.image::%start-callbacks))

(cffi:defcfun ("stbi__start_callbacks" %stb.image::%start-callbacks)
              :void
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::c (:pointer %stb.image::io-callbacks))
              (%stb.image::user (:pointer :void)))

(declaim (inline %stb.image::%start-file))

(cffi:defcfun ("stbi__start_file" %stb.image::%start-file)
              :void
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::f (:pointer %stb.image::file)))

(declaim (inline %stb.image::%start-mem))

(cffi:defcfun ("stbi__start_mem" %stb.image::%start-mem)
              :void
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::buffer (:pointer %stb.image::uc))
              (%stb.image::len :int))

(declaim (inline %stb.image::%stdio-eof))

(cffi:defcfun ("stbi__stdio_eof" %stb.image::%stdio-eof)
              :int
              (%stb.image::user (:pointer :void)))

(declaim (inline %stb.image::%stdio-read))

(cffi:defcfun ("stbi__stdio_read" %stb.image::%stdio-read)
              :int
              (%stb.image::user (:pointer :void))
              (%stb.image::data claw-utils:claw-string)
              (%stb.image::size :int))

(declaim (inline %stb.image::%stdio-skip))

(cffi:defcfun ("stbi__stdio_skip" %stb.image::%stdio-skip)
              :void
              (%stb.image::user (:pointer :void))
              (%stb.image::n :int))

(declaim (inline %stb.image::%tga-get-comp))

(cffi:defcfun ("stbi__tga_get_comp" %stb.image::%tga-get-comp)
              :int
              (%stb.image::bits-per-pixel :int)
              (%stb.image::is-grey :int)
              (%stb.image::is-rgb16 (:pointer :int)))

(declaim (inline %stb.image::%tga-info))

(cffi:defcfun ("stbi__tga_info" %stb.image::%tga-info)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(declaim (inline %stb.image::%tga-load))

(cffi:defcfun ("stbi__tga_load" %stb.image::%tga-load)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info)))

(declaim (inline %stb.image::%tga-read-rgb16))

(cffi:defcfun ("stbi__tga_read_rgb16" %stb.image::%tga-read-rgb16)
              :void
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::out (:pointer %stb.image::uc)))

(declaim (inline %stb.image::%tga-test))

(cffi:defcfun ("stbi__tga_test" %stb.image::%tga-test)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(declaim (inline %stb.image::%vertical-flip))

(cffi:defcfun ("stbi__vertical_flip" %stb.image::%vertical-flip)
              :void
              (%stb.image::image (:pointer :void))
              (%stb.image::w :int)
              (%stb.image::h :int)
              (%stb.image::bytes-per-pixel :int))

(declaim (inline %stb.image::%vertical-flip-slices))

(cffi:defcfun ("stbi__vertical_flip_slices"
               %stb.image::%vertical-flip-slices)
              :void
              (%stb.image::image (:pointer :void))
              (%stb.image::w :int)
              (%stb.image::h :int)
              (%stb.image::z :int)
              (%stb.image::bytes-per-pixel :int))

(declaim (inline %stb.image::%zbuild-huffman))

(cffi:defcfun ("stbi__zbuild_huffman" %stb.image::%zbuild-huffman)
              :int
              (%stb.image::z (:pointer %stb.image::%zhuffman))
              (%stb.image::sizelist (:pointer %stb.image::uc))
              (%stb.image::num :int))

(declaim (inline %stb.image::%zeof))

(cffi:defcfun ("stbi__zeof" %stb.image::%zeof)
              :int
              (%stb.image::z (:pointer %stb.image::%zbuf)))

(declaim (inline %stb.image::%zexpand))

(cffi:defcfun ("stbi__zexpand" %stb.image::%zexpand)
              :int
              (%stb.image::z (:pointer %stb.image::%zbuf))
              (%stb.image::zout claw-utils:claw-string)
              (%stb.image::n :int))

(declaim (inline %stb.image::%zget8))

(cffi:defcfun ("stbi__zget8" %stb.image::%zget8)
              %stb.image::uc
              (%stb.image::z (:pointer %stb.image::%zbuf)))

(declaim (inline %stb.image::%zhuffman-decode))

(cffi:defcfun ("stbi__zhuffman_decode" %stb.image::%zhuffman-decode)
              :int
              (%stb.image::a (:pointer %stb.image::%zbuf))
              (%stb.image::z (:pointer %stb.image::%zhuffman)))

(declaim (inline %stb.image::%zhuffman-decode-slowpath))

(cffi:defcfun ("stbi__zhuffman_decode_slowpath"
               %stb.image::%zhuffman-decode-slowpath)
              :int
              (%stb.image::a (:pointer %stb.image::%zbuf))
              (%stb.image::z (:pointer %stb.image::%zhuffman)))

(declaim (inline %stb.image::%zreceive))

(cffi:defcfun ("stbi__zreceive" %stb.image::%zreceive)
              :unsigned-int
              (%stb.image::z (:pointer %stb.image::%zbuf))
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
  (export '%stb.image::%load-main "%STB.IMAGE")
  (export '%stb.image::%zhuffman "%STB.IMAGE")
  (export '%stb.image::%zbuild-huffman "%STB.IMAGE")
  (export '%stb.image::%codecvt "%STB.IMAGE")
  (export '%stb.image::%get-chunk-header "%STB.IMAGE")
  (export '%stb.image::%wide-data "%STB.IMAGE")
  (export '%stb.image::%zexpand "%STB.IMAGE")
  (export '%stb.image::%zhuffman-decode-slowpath "%STB.IMAGE")
  (export '%stb.image::%rewind "%STB.IMAGE")
  (export '%stb.image::%start-mem "%STB.IMAGE")
  (export '%stb.image::%free-jpeg-components "%STB.IMAGE")
  (export '%stb.image::%gif-lzw "%STB.IMAGE")
  (export '%stb.image::%io-read-end "%STB.IMAGE")
  (export '%stb.image::+%zfast-bits+ "%STB.IMAGE")
  (export '%stb.image::%fopen "%STB.IMAGE")
  (export '%stb.image::%addsizes-valid "%STB.IMAGE")
  (export '%stb.image::%jpeg-get-bit "%STB.IMAGE")
  (export '%stb.image::%gif-load-next "%STB.IMAGE")
  (export '%stb.image::%jpeg-dequantize "%STB.IMAGE")
  (export '%stb.image::%gif "%STB.IMAGE")
  (export '%stb.image::%tga-info "%STB.IMAGE")
  (export '%stb.image::load-16-from-callbacks "%STB.IMAGE")
  (export '%stb.image::%do-png "%STB.IMAGE")
  (export '%stb.image::%compute-transparency "%STB.IMAGE")
  (export '%stb.image::%jpeg-huff-decode "%STB.IMAGE")
  (export '%stb.image::loadf-from-memory "%STB.IMAGE")
  (export '%stb.image::%malloc-mad4 "%STB.IMAGE")
  (export '%stb.image::load "%STB.IMAGE")
  (export '%stb.image::%result-info "%STB.IMAGE")
  (export '%stb.image::load-16 "%STB.IMAGE")
  (export '%stb.image::%bit-reverse "%STB.IMAGE")
  (export '%stb.image::%tga-read-rgb16 "%STB.IMAGE")
  (export '%stb.image::%lock "%STB.IMAGE")
  (export '%stb.image::is-hdr-from-memory "%STB.IMAGE")
  (export '%stb.image::%idct-block "%STB.IMAGE")
  (export '%stb.image::%load-and-postprocess-16bit "%STB.IMAGE")
  (export '%stb.image::%compute-huffman-codes "%STB.IMAGE")
  (export '%stb.image::%create-png-image-raw "%STB.IMAGE")
  (export '%stb.image::ldr-to-hdr-gamma "%STB.IMAGE")
  (export '%stb.image::%check-png-header "%STB.IMAGE")
  (export '%stb.image::%getn "%STB.IMAGE")
  (export '%stb.image::%old-offset "%STB.IMAGE")
  (export '%stb.image::%chain "%STB.IMAGE")
  (export '%stb.image::%parse-uncompressed-block "%STB.IMAGE")
  (export '%stb.image::%png-load "%STB.IMAGE")
  (export '%stb.image::*%zdefault-length* "%STB.IMAGE")
  (export '%stb.image::%io-codecvt "%STB.IMAGE")
  (export '%stb.image::loadf "%STB.IMAGE")
  (export '%stb.image::load-from-file-16 "%STB.IMAGE")
  (export '%stb.image::%pnm-skip-whitespace "%STB.IMAGE")
  (export '%stb.image::%y-cb-cr-to-rgb-simd "%STB.IMAGE")
  (export '%stb.image::loadf-from-callbacks "%STB.IMAGE")
  (export '%stb.image::*%jpeg-dezigzag* "%STB.IMAGE")
  (export '%stb.image::%parse-huffman-block "%STB.IMAGE")
  (export '%stb.image::%get16le "%STB.IMAGE")
  (export '%stb.image::%%pad5 "%STB.IMAGE")
  (export '%stb.image::*%zlength-extra* "%STB.IMAGE")
  (export '%stb.image::%tga-get-comp "%STB.IMAGE")
  (export '%stb.image::%load-and-postprocess-8bit "%STB.IMAGE")
  (export '%stb.image::set-flip-vertically-on-load "%STB.IMAGE")
  (export '%stb.image::%skip "%STB.IMAGE")
  (export '%stb.image::%is-16-main "%STB.IMAGE")
  (export '%stb.image::zlib-decode-noheader-malloc "%STB.IMAGE")
  (export '%stb.image::%mad2sizes-valid "%STB.IMAGE")
  (export '%stb.image::%uint16 "%STB.IMAGE")
  (export '%stb.image::zlib-decode-malloc-guesssize-headerflag
          "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--GIF-LZW| "%STB.IMAGE")
  (export '%stb.image::%clamp "%STB.IMAGE")
  (export '%stb.image::%int16 "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--JPEG| "%STB.IMAGE")
  (export '%stb.image::%float-postprocess "%STB.IMAGE")
  (export '%stb.image::%jpeg-load "%STB.IMAGE")
  (export '%stb.image::%get32le "%STB.IMAGE")
  (export '%stb.image::+%marker-none+ "%STB.IMAGE")
  (export '%stb.image::%stdio-eof "%STB.IMAGE")
  (export '%stb.image::%io-save-base "%STB.IMAGE")
  (export '%stb.image::%bmp-parse-header "%STB.IMAGE")
  (export '%stb.image::set-flip-vertically-on-load-thread
          "%STB.IMAGE")
  (export '%stb.image::%pic-info "%STB.IMAGE")
  (export '%stb.image::+%x64-target+ "%STB.IMAGE")
  (export '%stb.image::%freeres-buf "%STB.IMAGE")
  (export '%stb.image::%jpeg-decode-block-prog-dc "%STB.IMAGE")
  (export '%stb.image::%bitreverse16 "%STB.IMAGE")
  (export '%stb.image::is-16-bit-from-file "%STB.IMAGE")
  (export '%stb.image::%uint32 "%STB.IMAGE")
  (export '%stb.image::%malloc-mad3 "%STB.IMAGE")
  (export '%stb.image::*%l2h-scale* "%STB.IMAGE")
  (export '%stb.image::%jpeg-info-raw "%STB.IMAGE")
  (export '%stb.image::%zbuf "%STB.IMAGE")
  (export '%stb.image::failure-reason "%STB.IMAGE")
  (export '%stb.image::%load-gif-main "%STB.IMAGE")
  (export '%stb.image::%bmp-test-raw "%STB.IMAGE")
  (export '%stb.image::%jpeg-finish "%STB.IMAGE")
  (export '%stb.image::%get32be "%STB.IMAGE")
  (export '%stb.image::%convert-format "%STB.IMAGE")
  (export '%stb.image::%context "%STB.IMAGE")
  (export '%stb.image::%pngchunk "%STB.IMAGE")
  (export '%stb.image::%io-read-ptr "%STB.IMAGE")
  (export '%stb.image::is-hdr "%STB.IMAGE")
  (export '%stb.image::%io-write-end "%STB.IMAGE")
  (export '%stb.image::info "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--PIC-PACKET| "%STB.IMAGE")
  (export '%stb.image::*%h2l-scale-i* "%STB.IMAGE")
  (export '%stb.image::%build-huffman "%STB.IMAGE")
  (export '%stb.image::hdr-to-ldr-gamma "%STB.IMAGE")
  (export '%stb.image::+sse2+ "%STB.IMAGE")
  (export '%stb.image::%high-bit "%STB.IMAGE")
  (export '%stb.image::%grow-buffer-unsafe "%STB.IMAGE")
  (export '%stb.image::%expand-png-palette "%STB.IMAGE")
  (export '%stb.image::load-from-callbacks "%STB.IMAGE")
  (export '%stb.image::%parse-zlib "%STB.IMAGE")
  (export '%stb.image::%io-buf-base "%STB.IMAGE")
  (export '%stb.image::%de-iphone "%STB.IMAGE")
  (export '%stb.image::%jpeg-decode-block-prog-ac "%STB.IMAGE")
  (export '%stb.image::%jpeg-info "%STB.IMAGE")
  (export '%stb.image::%cleanup-jpeg "%STB.IMAGE")
  (export '%stb.image::%get16be "%STB.IMAGE")
  (export '%stb.image::%pnm-test "%STB.IMAGE")
  (export '%stb.image::%psd-is16 "%STB.IMAGE")
  (export '%stb.image::%io-buf-end "%STB.IMAGE")
  (export '%stb.image::%pnm-isdigit "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--PNGCHUNK| "%STB.IMAGE")
  (export '%stb.image::%loadf-main "%STB.IMAGE")
  (export '%stb.image::*%bmask* "%STB.IMAGE")
  (export '%stb.image::%process-frame-header "%STB.IMAGE")
  (export '%stb.image::%int32 "%STB.IMAGE")
  (export '%stb.image::%psd-decode-rle "%STB.IMAGE")
  (export '%stb.image::+thread-local+ "%STB.IMAGE")
  (export '%stb.image::%flags "%STB.IMAGE")
  (export '%stb.image::%process-marker "%STB.IMAGE")
  (export '%stb.image::%pic-load "%STB.IMAGE")
  (export '%stb.image::%psd-test "%STB.IMAGE")
  (export '%stb.image::%decode-jpeg-image "%STB.IMAGE")
  (export '%stb.image::%pic-is4 "%STB.IMAGE")
  (export '%stb.image::info-from-file "%STB.IMAGE")
  (export '%stb.image::%start-file "%STB.IMAGE")
  (export '%stb.image::%io-marker "%STB.IMAGE")
  (export '%stb.image::+%vertically-flip-on-load+ "%STB.IMAGE")
  (export '%stb.image::%stdio-read "%STB.IMAGE")
  (export '%stb.image::is-hdr-from-callbacks "%STB.IMAGE")
  (export '%stb.image::%vertical-flip-slices "%STB.IMAGE")
  (export '%stb.image::%bitcount "%STB.IMAGE")
  (export '%stb.image::+%hdr-buflen+ "%STB.IMAGE")
  (export '%stb.image::%png-is16 "%STB.IMAGE")
  (export '%stb.image::%pnm-info "%STB.IMAGE")
  (export '%stb.image::%shortbuf "%STB.IMAGE")
  (export '%stb.image::%convert-16-to-8 "%STB.IMAGE")
  (export '%stb.image::+extern+ "%STB.IMAGE")
  (export '%stb.image::%get-marker "%STB.IMAGE")
  (export '%stb.image::%flags2 "%STB.IMAGE")
  (export '%stb.image::%png-info-raw "%STB.IMAGE")
  (export '%stb.image::*%de-iphone-flag* "%STB.IMAGE")
  (export '%stb.image::%tga-load "%STB.IMAGE")
  (export '%stb.image::%gif-info-raw "%STB.IMAGE")
  (export '%stb.image::%extend-receive "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--RESAMPLE| "%STB.IMAGE")
  (export '%stb.image::%pnm-isspace "%STB.IMAGE")
  (export '%stb.image::%do-zlib "%STB.IMAGE")
  (export '%stb.image::%bmp-info "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--PNG| "%STB.IMAGE")
  (export '%stb.image::%pic-packet "%STB.IMAGE")
  (export '%stb.image::%hdr-test-core "%STB.IMAGE")
  (export '%stb.image::info-from-callbacks "%STB.IMAGE")
  (export '%stb.image::%png-test "%STB.IMAGE")
  (export '%stb.image::is-hdr-from-file "%STB.IMAGE")
  (export '%stb.image::*%vertically-flip-on-load-set* "%STB.IMAGE")
  (export '%stb.image::is-16-bit "%STB.IMAGE")
  (export '%stb.image::%pnm-getinteger "%STB.IMAGE")
  (export '%stb.image::%zget8 "%STB.IMAGE")
  (export '%stb.image::size-t "%STB.IMAGE")
  (export '%stb.image::%create-png-image "%STB.IMAGE")
  (export '%stb.image::%io-read-base "%STB.IMAGE")
  (export '%stb.image::convert-iphone-png-to-rgb "%STB.IMAGE")
  (export '%stb.image::+version+ "%STB.IMAGE")
  (export '%stb.image::%stdio-skip "%STB.IMAGE")
  (export '%stb.image::%err "%STB.IMAGE")
  (export '%stb.image::+%zfast-mask+ "%STB.IMAGE")
  (export '%stb.image::%io-write-ptr "%STB.IMAGE")
  (export '%stb.image::load-from-memory "%STB.IMAGE")
  (export '%stb.image::%sse2-available "%STB.IMAGE")
  (export '%stb.image::%compute-y "%STB.IMAGE")
  (export '%stb.image::%gif-test "%STB.IMAGE")
  (export '%stb.image::%get8 "%STB.IMAGE")
  (export '%stb.image::%huffman "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--HUFFMAN| "%STB.IMAGE")
  (export '%stb.image::%freeres-list "%STB.IMAGE")
  (export '%stb.image::%pic-load-core "%STB.IMAGE")
  (export '%stb.image::%io-wide-data "%STB.IMAGE")
  (export '%stb.image::%gif-parse-colortable "%STB.IMAGE")
  (export '%stb.image::%out-gif-code "%STB.IMAGE")
  (export '%stb.image::*%stdio-callbacks* "%STB.IMAGE")
  (export '%stb.image::%y-cb-cr-to-rgb-row "%STB.IMAGE")
  (export '%stb.image::%%off-t "%STB.IMAGE")
  (export '%stb.image::file "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--ZHUFFMAN| "%STB.IMAGE")
  (export '%stb.image::+%case+ "%STB.IMAGE")
  (export '%stb.image::%copyval "%STB.IMAGE")
  (export '%stb.image::is-16-bit-from-callbacks "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--RESULT-INFO| "%STB.IMAGE")
  (export '%stb.image::%io-backup-base "%STB.IMAGE")
  (export '%stb.image::%%off64-t "%STB.IMAGE")
  (export '%stb.image::%pic-test-core "%STB.IMAGE")
  (export '%stb.image::%pic-test "%STB.IMAGE")
  (export '%stb.image::%mad3sizes-valid "%STB.IMAGE")
  (export '%stb.image::%fileno "%STB.IMAGE")
  (export '%stb.image::*%zdist-base* "%STB.IMAGE")
  (export '%stb.image::*%h2l-gamma-i* "%STB.IMAGE")
  (export '%stb.image::%idct-simd "%STB.IMAGE")
  (export '%stb.image::%psd-info "%STB.IMAGE")
  (export '%stb.image::loadf-from-file "%STB.IMAGE")
  (export '%stb.image::zlib-decode-malloc-guesssize "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--GIF| "%STB.IMAGE")
  (export '%stb.image::%bmp-test "%STB.IMAGE")
  (export '%stb.image::is-16-bit-from-memory "%STB.IMAGE")
  (export '%stb.image::image-free "%STB.IMAGE")
  (export '%stb.image::%resample-row-generic "%STB.IMAGE")
  (export '%stb.image::%offset "%STB.IMAGE")
  (export '%stb.image::*%zlength-base* "%STB.IMAGE")
  (export '%stb.image::+include-stb-image-h+ "%STB.IMAGE")
  (export '%stb.image::*%l2h-gamma* "%STB.IMAGE")
  (export '%stb.image::%gif-header "%STB.IMAGE")
  (export '%stb.image::%compute-transparency16 "%STB.IMAGE")
  (export '%stb.image::%mad4sizes-valid "%STB.IMAGE")
  (export '%stb.image::%shiftsigned "%STB.IMAGE")
  (export '%stb.image::%malloc "%STB.IMAGE")
  (export '%stb.image::+inline+ "%STB.IMAGE")
  (export '%stb.image::%parse-entropy-coded-data "%STB.IMAGE")
  (export '%stb.image::%at-eof "%STB.IMAGE")
  (export '%stb.image::%info-main "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--BMP-DATA| "%STB.IMAGE")
  (export '%stb.image::%io-file "%STB.IMAGE")
  (export '%stb.image::%refill-buffer "%STB.IMAGE")
  (export '%stb.image::%zeof "%STB.IMAGE")
  (export '%stb.image::%resample-row-hv-2-simd "%STB.IMAGE")
  (export '%stb.image::uc "%STB.IMAGE")
  (export '%stb.image::load-from-file "%STB.IMAGE")
  (export '%stb.image::load-16-from-memory "%STB.IMAGE")
  (export '%stb.image::%process-scan-header "%STB.IMAGE")
  (export '%stb.image::%convert-format16 "%STB.IMAGE")
  (export '%stb.image::%hdr-info "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--CONTEXT| "%STB.IMAGE")
  (export '%stb.image::%readval "%STB.IMAGE")
  (export '%stb.image::%paeth "%STB.IMAGE")
  (export '%stb.image::%bmp-data "%STB.IMAGE")
  (export '%stb.image::%hdr-gettoken "%STB.IMAGE")
  (export '%stb.image::%io-save-end "%STB.IMAGE")
  (export '%stb.image::%start-callbacks "%STB.IMAGE")
  (export '%stb.image::%tga-test "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--ZBUF| "%STB.IMAGE")
  (export '%stb.image::%io-write-base "%STB.IMAGE")
  (export '%stb.image::%compute-y-16 "%STB.IMAGE")
  (export '%stb.image::%jpeg-decode-block "%STB.IMAGE")
  (export '%stb.image::%resample "%STB.IMAGE")
  (export '%stb.image::load-gif-from-memory "%STB.IMAGE")
  (export '%stb.image::%resample-row-hv-2 "%STB.IMAGE")
  (export '%stb.image::%ldr-to-hdr "%STB.IMAGE")
  (export '%stb.image::%convert-8-to-16 "%STB.IMAGE")
  (export '%stb.image::info-from-memory "%STB.IMAGE")
  (export '%stb.image::%gif-load "%STB.IMAGE")
  (export '%stb.image::%decode-jpeg-header "%STB.IMAGE")
  (export '%stb.image::+max-dimensions+ "%STB.IMAGE")
  (export '%stb.image::%png "%STB.IMAGE")
  (export '%stb.image::%fill-bits "%STB.IMAGE")
  (export '%stb.image::*%zdefault-distance* "%STB.IMAGE")
  (export '%stb.image::%vtable-offset "%STB.IMAGE")
  (export '%stb.image::%zhuffman-decode "%STB.IMAGE")
  (export '%stb.image::%bmp-load "%STB.IMAGE")
  (export '%stb.image::ldr-to-hdr-scale "%STB.IMAGE")
  (export '%stb.image::zlib-decode-malloc "%STB.IMAGE")
  (export '%stb.image::*%vertically-flip-on-load-global*
          "%STB.IMAGE")
  (export '%stb.image::%zreceive "%STB.IMAGE")
  (export '%stb.image::*%zdist-extra* "%STB.IMAGE")
  (export '%stb.image::*%jbias* "%STB.IMAGE")
  (export '%stb.image::*%vertically-flip-on-load-local* "%STB.IMAGE")
  (export '%stb.image::set-unpremultiply-on-load "%STB.IMAGE")
  (export '%stb.image::%png-info "%STB.IMAGE")
  (export '%stb.image::%hdr-load "%STB.IMAGE")
  (export '%stb.image::io-callbacks "%STB.IMAGE")
  (export '%stb.image::%hdr-test "%STB.IMAGE")
  (export '%stb.image::zlib-decode-buffer "%STB.IMAGE")
  (export '%stb.image::%pnm-load "%STB.IMAGE")
  (export '%stb.image::%resample-row-h-2 "%STB.IMAGE")
  (export '%stb.image::*%depth-scale-table* "%STB.IMAGE")
  (export '%stb.image::%hdr-to-ldr "%STB.IMAGE")
  (export '%stb.image::%jpeg-test "%STB.IMAGE")
  (export '%stb.image::%cur-column "%STB.IMAGE")
  (export '%stb.image::%parse-zlib-header "%STB.IMAGE")
  (export '%stb.image::%markers "%STB.IMAGE")
  (export '%stb.image::%build-fast-ac "%STB.IMAGE")
  (export '%stb.image::%psd-load "%STB.IMAGE")
  (export '%stb.image::hdr-to-ldr-scale "%STB.IMAGE")
  (export '%stb.image::%process-gif-raster "%STB.IMAGE")
  (export '%stb.image::%setup-jpeg "%STB.IMAGE")
  (export '%stb.image::%hdr-convert "%STB.IMAGE")
  (export '%stb.image::%jpeg-get-bits "%STB.IMAGE")
  (export '%stb.image::%io-lock-t "%STB.IMAGE")
  (export '%stb.image::%jpeg-reset "%STB.IMAGE")
  (export '%stb.image::%jpeg "%STB.IMAGE")
  (export '%stb.image::*%unpremultiply-on-load* "%STB.IMAGE")
  (export '%stb.image::us "%STB.IMAGE")
  (export '%stb.image::%unused2 "%STB.IMAGE")
  (export '%stb.image::%blinn-8x8 "%STB.IMAGE")
  (export '%stb.image::%parse-png-file "%STB.IMAGE")
  (export '%stb.image::%mode "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI-IO-CALLBACKS| "%STB.IMAGE")
  (export '%stb.image::*%g-failure-reason* "%STB.IMAGE")
  (export '%stb.image::zlib-decode-noheader-buffer "%STB.IMAGE")
  (export '%stb.image::%gif-test-raw "%STB.IMAGE")
  (export '%stb.image::%vertical-flip "%STB.IMAGE")
  (export '%stb.image::%mul2sizes-valid "%STB.IMAGE")
  (export '%stb.image::%resample-row-v-2 "%STB.IMAGE")
  (export '%stb.image::%gif-info "%STB.IMAGE")
  (export '%stb.image::%malloc-mad2 "%STB.IMAGE"))

