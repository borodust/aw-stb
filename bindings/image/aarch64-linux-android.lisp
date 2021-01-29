(uiop:define-package :%stb.image (:use))
(uiop:define-package :claw-stb-image-bindings~pristine (:use :cl))
(common-lisp:in-package :claw-stb-image-bindings~pristine)

(defparameter %stb.image::+extern+ nil)

(defparameter %stb.image::+include-stb-image-h+ nil)

(defparameter %stb.image::+max-dimensions+ 16777216)

(defparameter %stb.image::+thread-local+ nil)

(defparameter %stb.image::+%case+ nil)

(defparameter %stb.image::+%hdr-buflen+ 1024)

(defparameter %stb.image::+%marker-none+ 255)

(defparameter %stb.image::+%zfast-bits+ 9)

(defparameter %stb.image::+%zfast-mask+ 511)

(defparameter %stb.image::+%vertically-flip-on-load+ nil)

(defparameter %stb.image::+inline+ nil)

(cffi:defcfun ("stbi_convert_iphone_png_to_rgb"
               %stb.image::convert-iphone-png-to-rgb)
              :void
              (%stb.image::flag-true-if-should-convert :int))

(cffi:defcfun ("stbi_failure_reason" %stb.image::failure-reason)
              claw-utils:claw-string)

(cffi:defcfun ("stbi_hdr_to_ldr_gamma" %stb.image::hdr-to-ldr-gamma)
              :void
              (%stb.image::gamma :float))

(cffi:defcfun ("stbi_hdr_to_ldr_scale" %stb.image::hdr-to-ldr-scale)
              :void
              (%stb.image::scale :float))

(cffi:defcfun ("stbi_image_free" %stb.image::image-free)
              :void
              (%stb.image::retval-from-stbi-load (:pointer :void)))

(cffi:defcfun ("stbi_info" %stb.image::info)
              :int
              (%stb.image::filename claw-utils:claw-string)
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defcstruct (%stb.image::|C:@SA@STBI-IO-CALLBACKS| :size 24)
                 (%stb.image::read (:pointer :pointer) :offset 0)
                 (%stb.image::skip (:pointer :pointer) :offset 8)
                 (%stb.image::eof (:pointer :pointer) :offset 16))

(cffi:defctype %stb.image::io-callbacks
               (:struct %stb.image::|C:@SA@STBI-IO-CALLBACKS|))

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

(cffi:defctype %stb.image::%%off64-t :long-long)

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

(cffi:defcfun ("stbi_info_from_file" %stb.image::info-from-file)
              :int
              (%stb.image::f (:pointer %stb.image::file))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defctype %stb.image::uc :unsigned-char)

(cffi:defcfun ("stbi_info_from_memory" %stb.image::info-from-memory)
              :int
              (%stb.image::buffer (:pointer %stb.image::uc))
              (%stb.image::len :int)
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defcfun ("stbi_is_16_bit" %stb.image::is-16-bit)
              :int
              (%stb.image::filename claw-utils:claw-string))

(cffi:defcfun ("stbi_is_16_bit_from_callbacks"
               %stb.image::is-16-bit-from-callbacks)
              :int
              (%stb.image::clbk (:pointer %stb.image::io-callbacks))
              (%stb.image::user (:pointer :void)))

(cffi:defcfun ("stbi_is_16_bit_from_file"
               %stb.image::is-16-bit-from-file)
              :int
              (%stb.image::f (:pointer %stb.image::file)))

(cffi:defcfun ("stbi_is_16_bit_from_memory"
               %stb.image::is-16-bit-from-memory)
              :int
              (%stb.image::buffer (:pointer %stb.image::uc))
              (%stb.image::len :int))

(cffi:defcfun ("stbi_is_hdr" %stb.image::is-hdr)
              :int
              (%stb.image::filename claw-utils:claw-string))

(cffi:defcfun ("stbi_is_hdr_from_callbacks"
               %stb.image::is-hdr-from-callbacks)
              :int
              (%stb.image::clbk (:pointer %stb.image::io-callbacks))
              (%stb.image::user (:pointer :void)))

(cffi:defcfun ("stbi_is_hdr_from_file" %stb.image::is-hdr-from-file)
              :int
              (%stb.image::f (:pointer %stb.image::file)))

(cffi:defcfun ("stbi_is_hdr_from_memory"
               %stb.image::is-hdr-from-memory)
              :int
              (%stb.image::buffer (:pointer %stb.image::uc))
              (%stb.image::len :int))

(cffi:defcfun ("stbi_ldr_to_hdr_gamma" %stb.image::ldr-to-hdr-gamma)
              :void
              (%stb.image::gamma :float))

(cffi:defcfun ("stbi_ldr_to_hdr_scale" %stb.image::ldr-to-hdr-scale)
              :void
              (%stb.image::scale :float))

(cffi:defcfun ("stbi_load" %stb.image::load)
              (:pointer %stb.image::uc)
              (%stb.image::filename claw-utils:claw-string)
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(cffi:defctype %stb.image::us :unsigned-short)

(cffi:defcfun ("stbi_load_16" %stb.image::load-16)
              (:pointer %stb.image::us)
              (%stb.image::filename claw-utils:claw-string)
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(cffi:defcfun ("stbi_load_16_from_callbacks"
               %stb.image::load-16-from-callbacks)
              (:pointer %stb.image::us)
              (%stb.image::clbk (:pointer %stb.image::io-callbacks))
              (%stb.image::user (:pointer :void))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(cffi:defcfun ("stbi_load_16_from_memory"
               %stb.image::load-16-from-memory)
              (:pointer %stb.image::us)
              (%stb.image::buffer (:pointer %stb.image::uc))
              (%stb.image::len :int)
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(cffi:defcfun ("stbi_load_from_callbacks"
               %stb.image::load-from-callbacks)
              (:pointer %stb.image::uc)
              (%stb.image::clbk (:pointer %stb.image::io-callbacks))
              (%stb.image::user (:pointer :void))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(cffi:defcfun ("stbi_load_from_file" %stb.image::load-from-file)
              (:pointer %stb.image::uc)
              (%stb.image::f (:pointer %stb.image::file))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(cffi:defcfun ("stbi_load_from_file_16"
               %stb.image::load-from-file-16)
              (:pointer %stb.image::us)
              (%stb.image::f (:pointer %stb.image::file))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(cffi:defcfun ("stbi_load_from_memory" %stb.image::load-from-memory)
              (:pointer %stb.image::uc)
              (%stb.image::buffer (:pointer %stb.image::uc))
              (%stb.image::len :int)
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

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

(cffi:defcfun ("stbi_loadf" %stb.image::loadf)
              (:pointer :float)
              (%stb.image::filename claw-utils:claw-string)
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(cffi:defcfun ("stbi_loadf_from_callbacks"
               %stb.image::loadf-from-callbacks)
              (:pointer :float)
              (%stb.image::clbk (:pointer %stb.image::io-callbacks))
              (%stb.image::user (:pointer :void))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(cffi:defcfun ("stbi_loadf_from_file" %stb.image::loadf-from-file)
              (:pointer :float)
              (%stb.image::f (:pointer %stb.image::file))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(cffi:defcfun ("stbi_loadf_from_memory"
               %stb.image::loadf-from-memory)
              (:pointer :float)
              (%stb.image::buffer (:pointer %stb.image::uc))
              (%stb.image::len :int)
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::channels-in-file (:pointer :int))
              (%stb.image::desired-channels :int))

(cffi:defcfun ("stbi_set_flip_vertically_on_load"
               %stb.image::set-flip-vertically-on-load)
              :void
              (%stb.image::flag-true-if-should-flip :int))

(cffi:defcfun ("stbi_set_flip_vertically_on_load_thread"
               %stb.image::set-flip-vertically-on-load-thread)
              :void
              (%stb.image::flag-true-if-should-flip :int))

(cffi:defcfun ("stbi_set_unpremultiply_on_load"
               %stb.image::set-unpremultiply-on-load)
              :void
              (%stb.image::flag-true-if-should-unpremultiply :int))

(cffi:defcfun ("stbi_zlib_decode_buffer"
               %stb.image::zlib-decode-buffer)
              :int
              (%stb.image::obuffer claw-utils:claw-string)
              (%stb.image::olen :int)
              (%stb.image::ibuffer claw-utils:claw-string)
              (%stb.image::ilen :int))

(cffi:defcfun ("stbi_zlib_decode_malloc"
               %stb.image::zlib-decode-malloc)
              claw-utils:claw-string
              (%stb.image::buffer claw-utils:claw-string)
              (%stb.image::len :int)
              (%stb.image::outlen (:pointer :int)))

(cffi:defcfun ("stbi_zlib_decode_malloc_guesssize"
               %stb.image::zlib-decode-malloc-guesssize)
              claw-utils:claw-string
              (%stb.image::buffer claw-utils:claw-string)
              (%stb.image::len :int)
              (%stb.image::initial-size :int)
              (%stb.image::outlen (:pointer :int)))

(cffi:defcfun ("stbi_zlib_decode_malloc_guesssize_headerflag"
               %stb.image::zlib-decode-malloc-guesssize-headerflag)
              claw-utils:claw-string
              (%stb.image::buffer claw-utils:claw-string)
              (%stb.image::len :int)
              (%stb.image::initial-size :int)
              (%stb.image::outlen (:pointer :int))
              (%stb.image::parse-header :int))

(cffi:defcfun ("stbi_zlib_decode_noheader_buffer"
               %stb.image::zlib-decode-noheader-buffer)
              :int
              (%stb.image::obuffer claw-utils:claw-string)
              (%stb.image::olen :int)
              (%stb.image::ibuffer claw-utils:claw-string)
              (%stb.image::ilen :int))

(cffi:defcfun ("stbi_zlib_decode_noheader_malloc"
               %stb.image::zlib-decode-noheader-malloc)
              claw-utils:claw-string
              (%stb.image::buffer claw-utils:claw-string)
              (%stb.image::len :int)
              (%stb.image::outlen (:pointer :int)))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--BMP-DATA| :size 36)
                 (%stb.image::bpp :int :offset 0)
                 (%stb.image::offset :int :offset 4)
                 (%stb.image::hsz :int :offset 8)
                 (%stb.image::mr :unsigned-int :offset 12)
                 (%stb.image::mg :unsigned-int :offset 16)
                 (%stb.image::mb :unsigned-int :offset 20)
                 (%stb.image::ma :unsigned-int :offset 24)
                 (%stb.image::all-a :unsigned-int :offset 28)
                 (%stb.image::extra-read :int :offset 32))

(cffi:defctype %stb.image::%bmp-data
               (:struct %stb.image::|C:@SA@STBI--BMP-DATA|))

(cffi:defctype %stb.image::%uint32 :unsigned-int)

(cffi:defcstruct (%stb.image::|C:@SA@STBI--CONTEXT| :size 224)
                 (%stb.image::img-x %stb.image::%uint32 :offset 0)
                 (%stb.image::img-y %stb.image::%uint32 :offset 4)
                 (%stb.image::img-n :int :offset 8)
                 (%stb.image::img-out-n :int :offset 12)
                 (%stb.image::io %stb.image::io-callbacks :offset 16)
                 (%stb.image::io-user-data (:pointer :void) :offset
                  40)
                 (%stb.image::read-from-callbacks :int :offset 48)
                 (%stb.image::buflen :int :offset 52)
                 (%stb.image::buffer-start %stb.image::uc :count 128
                  :offset 56)
                 (%stb.image::callback-already-read :int :offset 184)
                 (%stb.image::img-buffer (:pointer %stb.image::uc)
                  :offset 192)
                 (%stb.image::img-buffer-end
                  (:pointer %stb.image::uc) :offset 200)
                 (%stb.image::img-buffer-original
                  (:pointer %stb.image::uc) :offset 208)
                 (%stb.image::img-buffer-original-end
                  (:pointer %stb.image::uc) :offset 216))

(cffi:defctype %stb.image::%context
               (:struct %stb.image::|C:@SA@STBI--CONTEXT|))

(cffi:defctype %stb.image::%int16 :short)

(cffi:defcstruct (%stb.image::|C:@SA@STBI--GIF-LZW| :size 4)
                 (%stb.image::prefix %stb.image::%int16 :offset 0)
                 (%stb.image::first %stb.image::uc :offset 2)
                 (%stb.image::suffix %stb.image::uc :offset 3))

(cffi:defctype %stb.image::%gif-lzw
               (:struct %stb.image::|C:@SA@STBI--GIF-LZW|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--GIF| :size 34928)
                 (%stb.image::w :int :offset 0)
                 (%stb.image::h :int :offset 4)
                 (%stb.image::out (:pointer %stb.image::uc) :offset
                  8)
                 (%stb.image::background (:pointer %stb.image::uc)
                  :offset 16)
                 (%stb.image::history (:pointer %stb.image::uc)
                  :offset 24)
                 (%stb.image::flags :int :offset 32)
                 (%stb.image::bgindex :int :offset 36)
                 (%stb.image::ratio :int :offset 40)
                 (%stb.image::transparent :int :offset 44)
                 (%stb.image::eflags :int :offset 48)
                 (%stb.image::pal (:array %stb.image::uc 4) :count
                  256 :offset 52)
                 (%stb.image::lpal (:array %stb.image::uc 4) :count
                  256 :offset 1076)
                 (%stb.image::codes %stb.image::%gif-lzw :count 8192
                  :offset 2100)
                 (%stb.image::color-table (:pointer %stb.image::uc)
                  :offset 34872)
                 (%stb.image::parse :int :offset 34880)
                 (%stb.image::step :int :offset 34884)
                 (%stb.image::lflags :int :offset 34888)
                 (%stb.image::start-x :int :offset 34892)
                 (%stb.image::start-y :int :offset 34896)
                 (%stb.image::max-x :int :offset 34900)
                 (%stb.image::max-y :int :offset 34904)
                 (%stb.image::cur-x :int :offset 34908)
                 (%stb.image::cur-y :int :offset 34912)
                 (%stb.image::line-size :int :offset 34916)
                 (%stb.image::delay :int :offset 34920))

(cffi:defctype %stb.image::%gif
               (:struct %stb.image::|C:@SA@STBI--GIF|))

(cffi:defctype %stb.image::%uint16 :unsigned-short)

(cffi:defcstruct (%stb.image::|C:@SA@STBI--HUFFMAN| :size 1680)
                 (%stb.image::fast %stb.image::uc :count 512 :offset
                  0)
                 (%stb.image::code %stb.image::%uint16 :count 256
                  :offset 512)
                 (%stb.image::values %stb.image::uc :count 256
                  :offset 1024)
                 (%stb.image::size %stb.image::uc :count 257 :offset
                  1280)
                 (%stb.image::maxcode :unsigned-int :count 18 :offset
                  1540)
                 (%stb.image::delta :int :count 17 :offset 1612))

(cffi:defctype %stb.image::%huffman
               (:struct %stb.image::|C:@SA@STBI--HUFFMAN|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--JPEG@S@STB-IMAGE.H@66207|
                  :size 96)
                 (%stb.image::id :int :offset 0)
                 (%stb.image::h :int :offset 4)
                 (%stb.image::v :int :offset 8)
                 (%stb.image::tq :int :offset 12)
                 (%stb.image::hd :int :offset 16)
                 (%stb.image::ha :int :offset 20)
                 (%stb.image::dc-pred :int :offset 24)
                 (%stb.image::x :int :offset 28)
                 (%stb.image::y :int :offset 32)
                 (%stb.image::w2 :int :offset 36)
                 (%stb.image::h2 :int :offset 40)
                 (%stb.image::data (:pointer %stb.image::uc) :offset
                  48)
                 (%stb.image::raw-data (:pointer :void) :offset 56)
                 (%stb.image::raw-coeff (:pointer :void) :offset 64)
                 (%stb.image::linebuf (:pointer %stb.image::uc)
                  :offset 72)
                 (%stb.image::coeff (:pointer :short) :offset 80)
                 (%stb.image::coeff-w :int :offset 88)
                 (%stb.image::coeff-h :int :offset 92))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--JPEG| :size 18568)
                 (%stb.image::s (:pointer %stb.image::%context)
                  :offset 0)
                 (%stb.image::huff-dc %stb.image::%huffman :count 4
                  :offset 8)
                 (%stb.image::huff-ac %stb.image::%huffman :count 4
                  :offset 6728)
                 (%stb.image::dequant (:array %stb.image::%uint16 64)
                  :count 4 :offset 13448)
                 (%stb.image::fast-ac (:array %stb.image::%int16 512)
                  :count 4 :offset 13960)
                 (%stb.image::img-h-max :int :offset 18056)
                 (%stb.image::img-v-max :int :offset 18060)
                 (%stb.image::img-mcu-x :int :offset 18064)
                 (%stb.image::img-mcu-y :int :offset 18068)
                 (%stb.image::img-mcu-w :int :offset 18072)
                 (%stb.image::img-mcu-h :int :offset 18076)
                 (%stb.image::img-comp
                  (:struct
                   %stb.image::|C:@SA@STBI--JPEG@S@STB-IMAGE.H@66207|)
                  :count 4 :offset 18080)
                 (%stb.image::code-buffer %stb.image::%uint32 :offset
                  18464)
                 (%stb.image::code-bits :int :offset 18468)
                 (%stb.image::marker :unsigned-char :offset 18472)
                 (%stb.image::nomore :int :offset 18476)
                 (%stb.image::progressive :int :offset 18480)
                 (%stb.image::spec-start :int :offset 18484)
                 (%stb.image::spec-end :int :offset 18488)
                 (%stb.image::succ-high :int :offset 18492)
                 (%stb.image::succ-low :int :offset 18496)
                 (%stb.image::eob-run :int :offset 18500)
                 (%stb.image::jfif :int :offset 18504)
                 (%stb.image::app14-color-transform :int :offset
                  18508)
                 (%stb.image::rgb :int :offset 18512)
                 (%stb.image::scan-n :int :offset 18516)
                 (%stb.image::order :int :count 4 :offset 18520)
                 (%stb.image::restart-interval :int :offset 18536)
                 (%stb.image::todo :int :offset 18540)
                 (%stb.image::idct-block-kernel (:pointer :pointer)
                  :offset 18544)
                 (%stb.image::y-cb-cr-to-rgb-kernel
                  (:pointer :pointer) :offset 18552)
                 (%stb.image::resample-row-hv-2-kernel
                  (:pointer :pointer) :offset 18560))

(cffi:defctype %stb.image::%jpeg
               (:struct %stb.image::|C:@SA@STBI--JPEG|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--PIC-PACKET| :size 3)
                 (%stb.image::size %stb.image::uc :offset 0)
                 (%stb.image::type %stb.image::uc :offset 1)
                 (%stb.image::channel %stb.image::uc :offset 2))

(cffi:defctype %stb.image::%pic-packet
               (:struct %stb.image::|C:@SA@STBI--PIC-PACKET|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--PNG| :size 40)
                 (%stb.image::s (:pointer %stb.image::%context)
                  :offset 0)
                 (%stb.image::idata (:pointer %stb.image::uc) :offset
                  8)
                 (%stb.image::expanded (:pointer %stb.image::uc)
                  :offset 16)
                 (%stb.image::out (:pointer %stb.image::uc) :offset
                  24)
                 (%stb.image::depth :int :offset 32))

(cffi:defctype %stb.image::%png
               (:struct %stb.image::|C:@SA@STBI--PNG|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--PNGCHUNK| :size 8)
                 (%stb.image::length %stb.image::%uint32 :offset 0)
                 (%stb.image::type %stb.image::%uint32 :offset 4))

(cffi:defctype %stb.image::%pngchunk
               (:struct %stb.image::|C:@SA@STBI--PNGCHUNK|))

(cffi:defctype %stb.image::resample-row-func (:pointer :pointer))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--RESAMPLE| :size 48)
                 (%stb.image::resample %stb.image::resample-row-func
                  :offset 0)
                 (%stb.image::line0 (:pointer %stb.image::uc) :offset
                  8)
                 (%stb.image::line1 (:pointer %stb.image::uc) :offset
                  16)
                 (%stb.image::hs :int :offset 24)
                 (%stb.image::vs :int :offset 28)
                 (%stb.image::w-lores :int :offset 32)
                 (%stb.image::ystep :int :offset 36)
                 (%stb.image::ypos :int :offset 40))

(cffi:defctype %stb.image::%resample
               (:struct %stb.image::|C:@SA@STBI--RESAMPLE|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--RESULT-INFO| :size 12)
                 (%stb.image::bits-per-channel :int :offset 0)
                 (%stb.image::num-channels :int :offset 4)
                 (%stb.image::channel-order :int :offset 8))

(cffi:defctype %stb.image::%result-info
               (:struct %stb.image::|C:@SA@STBI--RESULT-INFO|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--ZHUFFMAN| :size 2020)
                 (%stb.image::fast %stb.image::%uint16 :count 512
                  :offset 0)
                 (%stb.image::firstcode %stb.image::%uint16 :count 16
                  :offset 1024)
                 (%stb.image::maxcode :int :count 17 :offset 1056)
                 (%stb.image::firstsymbol %stb.image::%uint16 :count
                  16 :offset 1124)
                 (%stb.image::size %stb.image::uc :count 288 :offset
                  1156)
                 (%stb.image::value %stb.image::%uint16 :count 288
                  :offset 1444))

(cffi:defctype %stb.image::%zhuffman
               (:struct %stb.image::|C:@SA@STBI--ZHUFFMAN|))

(cffi:defcstruct (%stb.image::|C:@SA@STBI--ZBUF| :size 4096)
                 (%stb.image::zbuffer (:pointer %stb.image::uc)
                  :offset 0)
                 (%stb.image::zbuffer-end (:pointer %stb.image::uc)
                  :offset 8)
                 (%stb.image::num-bits :int :offset 16)
                 (%stb.image::code-buffer %stb.image::%uint32 :offset
                  20)
                 (%stb.image::zout claw-utils:claw-string :offset 24)
                 (%stb.image::zout-start claw-utils:claw-string
                  :offset 32)
                 (%stb.image::zout-end claw-utils:claw-string :offset
                  40)
                 (%stb.image::z-expandable :int :offset 48)
                 (%stb.image::z-length %stb.image::%zhuffman :offset
                  52)
                 (%stb.image::z-distance %stb.image::%zhuffman
                  :offset 2072))

(cffi:defctype %stb.image::%zbuf
               (:struct %stb.image::|C:@SA@STBI--ZBUF|))

(cffi:defcfun ("stbi__YCbCr_to_RGB_row"
               %stb.image::%y-cb-cr-to-rgb-row)
              :void
              (%stb.image::out (:pointer %stb.image::uc))
              (%stb.image::y (:pointer %stb.image::uc))
              (%stb.image::pcb (:pointer %stb.image::uc))
              (%stb.image::pcr (:pointer %stb.image::uc))
              (%stb.image::count :int)
              (%stb.image::step :int))

(cffi:defcfun ("stbi__addsizes_valid" %stb.image::%addsizes-valid)
              :int
              (%stb.image::a :int)
              (%stb.image::b :int))

(cffi:defcfun ("stbi__at_eof" %stb.image::%at-eof)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__bit_reverse" %stb.image::%bit-reverse)
              :int
              (%stb.image::v :int)
              (%stb.image::bits :int))

(cffi:defcfun ("stbi__bitcount" %stb.image::%bitcount)
              :int
              (%stb.image::a :unsigned-int))

(cffi:defcfun ("stbi__bitreverse16" %stb.image::%bitreverse16)
              :int
              (%stb.image::n :int))

(cffi:defcfun ("stbi__blinn_8x8" %stb.image::%blinn-8x8)
              %stb.image::uc
              (%stb.image::x %stb.image::uc)
              (%stb.image::y %stb.image::uc))

(cffi:defcfun ("stbi__bmp_info" %stb.image::%bmp-info)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defcfun ("stbi__bmp_load" %stb.image::%bmp-load)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info)))

(cffi:defcfun ("stbi__bmp_parse_header"
               %stb.image::%bmp-parse-header)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::info (:pointer %stb.image::%bmp-data)))

(cffi:defcfun ("stbi__bmp_test" %stb.image::%bmp-test)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__bmp_test_raw" %stb.image::%bmp-test-raw)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__build_fast_ac" %stb.image::%build-fast-ac)
              :void
              (%stb.image::fast-ac (:pointer %stb.image::%int16))
              (%stb.image::h (:pointer %stb.image::%huffman)))

(cffi:defcfun ("stbi__build_huffman" %stb.image::%build-huffman)
              :int
              (%stb.image::h (:pointer %stb.image::%huffman))
              (%stb.image::count (:pointer :int)))

(cffi:defcfun ("stbi__check_png_header"
               %stb.image::%check-png-header)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__clamp" %stb.image::%clamp)
              %stb.image::uc
              (%stb.image::x :int))

(cffi:defcfun ("stbi__cleanup_jpeg" %stb.image::%cleanup-jpeg)
              :void
              (%stb.image::j (:pointer %stb.image::%jpeg)))

(cffi:defcfun ("stbi__compute_huffman_codes"
               %stb.image::%compute-huffman-codes)
              :int
              (%stb.image::a (:pointer %stb.image::%zbuf)))

(cffi:defcfun ("stbi__compute_transparency"
               %stb.image::%compute-transparency)
              :int
              (%stb.image::z (:pointer %stb.image::%png))
              (%stb.image::tc (:array %stb.image::uc 3))
              (%stb.image::out-n :int))

(cffi:defcfun ("stbi__compute_transparency16"
               %stb.image::%compute-transparency16)
              :int
              (%stb.image::z (:pointer %stb.image::%png))
              (%stb.image::tc (:array %stb.image::%uint16 3))
              (%stb.image::out-n :int))

(cffi:defcfun ("stbi__compute_y" %stb.image::%compute-y)
              %stb.image::uc
              (%stb.image::r :int)
              (%stb.image::g :int)
              (%stb.image::b :int))

(cffi:defcfun ("stbi__compute_y_16" %stb.image::%compute-y-16)
              %stb.image::%uint16
              (%stb.image::r :int)
              (%stb.image::g :int)
              (%stb.image::b :int))

(cffi:defcfun ("stbi__convert_16_to_8" %stb.image::%convert-16-to-8)
              (:pointer %stb.image::uc)
              (%stb.image::orig (:pointer %stb.image::%uint16))
              (%stb.image::w :int)
              (%stb.image::h :int)
              (%stb.image::channels :int))

(cffi:defcfun ("stbi__convert_8_to_16" %stb.image::%convert-8-to-16)
              (:pointer %stb.image::%uint16)
              (%stb.image::orig (:pointer %stb.image::uc))
              (%stb.image::w :int)
              (%stb.image::h :int)
              (%stb.image::channels :int))

(cffi:defcfun ("stbi__convert_format" %stb.image::%convert-format)
              (:pointer :unsigned-char)
              (%stb.image::data (:pointer :unsigned-char))
              (%stb.image::img-n :int)
              (%stb.image::req-comp :int)
              (%stb.image::x :unsigned-int)
              (%stb.image::y :unsigned-int))

(cffi:defcfun ("stbi__convert_format16"
               %stb.image::%convert-format16)
              (:pointer %stb.image::%uint16)
              (%stb.image::data (:pointer %stb.image::%uint16))
              (%stb.image::img-n :int)
              (%stb.image::req-comp :int)
              (%stb.image::x :unsigned-int)
              (%stb.image::y :unsigned-int))

(cffi:defcfun ("stbi__copyval" %stb.image::%copyval)
              :void
              (%stb.image::channel :int)
              (%stb.image::dest (:pointer %stb.image::uc))
              (%stb.image::src (:pointer %stb.image::uc)))

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

(cffi:defcfun ("stbi__de_iphone" %stb.image::%de-iphone)
              :void
              (%stb.image::z (:pointer %stb.image::%png)))

(cffi:defcfun ("stbi__decode_jpeg_header"
               %stb.image::%decode-jpeg-header)
              :int
              (%stb.image::z (:pointer %stb.image::%jpeg))
              (%stb.image::scan :int))

(cffi:defcfun ("stbi__decode_jpeg_image"
               %stb.image::%decode-jpeg-image)
              :int
              (%stb.image::j (:pointer %stb.image::%jpeg)))

(cffi:defcfun ("stbi__do_png" %stb.image::%do-png)
              (:pointer :void)
              (%stb.image::p (:pointer %stb.image::%png))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::n (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info)))

(cffi:defcfun ("stbi__do_zlib" %stb.image::%do-zlib)
              :int
              (%stb.image::a (:pointer %stb.image::%zbuf))
              (%stb.image::obuf claw-utils:claw-string)
              (%stb.image::olen :int)
              (%stb.image::exp :int)
              (%stb.image::parse-header :int))

(cffi:defcfun ("stbi__err" %stb.image::%err)
              :int
              (%stb.image::str claw-utils:claw-string))

(cffi:defcfun ("stbi__expand_png_palette"
               %stb.image::%expand-png-palette)
              :int
              (%stb.image::a (:pointer %stb.image::%png))
              (%stb.image::palette (:pointer %stb.image::uc))
              (%stb.image::len :int)
              (%stb.image::pal-img-n :int))

(cffi:defcfun ("stbi__extend_receive" %stb.image::%extend-receive)
              :int
              (%stb.image::j (:pointer %stb.image::%jpeg))
              (%stb.image::n :int))

(cffi:defcfun ("stbi__fill_bits" %stb.image::%fill-bits)
              :void
              (%stb.image::z (:pointer %stb.image::%zbuf)))

(cffi:defcfun ("stbi__float_postprocess"
               %stb.image::%float-postprocess)
              :void
              (%stb.image::result (:pointer :float))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int))

(cffi:defcfun ("stbi__fopen" %stb.image::%fopen)
              (:pointer %stb.image::file)
              (%stb.image::filename claw-utils:claw-string)
              (%stb.image::mode claw-utils:claw-string))

(cffi:defcfun ("stbi__free_jpeg_components"
               %stb.image::%free-jpeg-components)
              :int
              (%stb.image::z (:pointer %stb.image::%jpeg))
              (%stb.image::ncomp :int)
              (%stb.image::why :int))

(cffi:defcfun ("stbi__get16be" %stb.image::%get16be)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__get16le" %stb.image::%get16le)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__get32be" %stb.image::%get32be)
              %stb.image::%uint32
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__get32le" %stb.image::%get32le)
              %stb.image::%uint32
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__get8" %stb.image::%get8)
              %stb.image::uc
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("__claw_stbi__get_chunk_header"
               %stb.image::%get-chunk-header)
              (:pointer %stb.image::%pngchunk)
              (%stb.image::%%claw-result-
               (:pointer %stb.image::%pngchunk))
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__get_marker" %stb.image::%get-marker)
              %stb.image::uc
              (%stb.image::j (:pointer %stb.image::%jpeg)))

(cffi:defcfun ("stbi__getn" %stb.image::%getn)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::buffer (:pointer %stb.image::uc))
              (%stb.image::n :int))

(cffi:defcfun ("stbi__gif_header" %stb.image::%gif-header)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::g (:pointer %stb.image::%gif))
              (%stb.image::comp (:pointer :int))
              (%stb.image::is-info :int))

(cffi:defcfun ("stbi__gif_info" %stb.image::%gif-info)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defcfun ("stbi__gif_info_raw" %stb.image::%gif-info-raw)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defcfun ("stbi__gif_load" %stb.image::%gif-load)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info)))

(cffi:defcfun ("stbi__gif_load_next" %stb.image::%gif-load-next)
              (:pointer %stb.image::uc)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::g (:pointer %stb.image::%gif))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::two-back (:pointer %stb.image::uc)))

(cffi:defcfun ("stbi__gif_parse_colortable"
               %stb.image::%gif-parse-colortable)
              :void
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::pal
               (:array (:array %stb.image::uc 4) 256))
              (%stb.image::num-entries :int)
              (%stb.image::transp :int))

(cffi:defcfun ("stbi__gif_test" %stb.image::%gif-test)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__gif_test_raw" %stb.image::%gif-test-raw)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__grow_buffer_unsafe"
               %stb.image::%grow-buffer-unsafe)
              :void
              (%stb.image::j (:pointer %stb.image::%jpeg)))

(cffi:defcfun ("stbi__hdr_convert" %stb.image::%hdr-convert)
              :void
              (%stb.image::output (:pointer :float))
              (%stb.image::input (:pointer %stb.image::uc))
              (%stb.image::req-comp :int))

(cffi:defcfun ("stbi__hdr_gettoken" %stb.image::%hdr-gettoken)
              claw-utils:claw-string
              (%stb.image::z (:pointer %stb.image::%context))
              (%stb.image::buffer claw-utils:claw-string))

(cffi:defcfun ("stbi__hdr_info" %stb.image::%hdr-info)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defcfun ("stbi__hdr_load" %stb.image::%hdr-load)
              (:pointer :float)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info)))

(cffi:defcfun ("stbi__hdr_test" %stb.image::%hdr-test)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__hdr_test_core" %stb.image::%hdr-test-core)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::signature claw-utils:claw-string))

(cffi:defcfun ("stbi__hdr_to_ldr" %stb.image::%hdr-to-ldr)
              (:pointer %stb.image::uc)
              (%stb.image::data (:pointer :float))
              (%stb.image::x :int)
              (%stb.image::y :int)
              (%stb.image::comp :int))

(cffi:defcfun ("stbi__high_bit" %stb.image::%high-bit)
              :int
              (%stb.image::z :unsigned-int))

(cffi:defcfun ("stbi__idct_block" %stb.image::%idct-block)
              :void
              (%stb.image::out (:pointer %stb.image::uc))
              (%stb.image::out-stride :int)
              (%stb.image::data (:array :short 64)))

(cffi:defcfun ("stbi__info_main" %stb.image::%info-main)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defcfun ("stbi__is_16_main" %stb.image::%is-16-main)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

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

(cffi:defcfun ("stbi__jpeg_decode_block_prog_ac"
               %stb.image::%jpeg-decode-block-prog-ac)
              :int
              (%stb.image::j (:pointer %stb.image::%jpeg))
              (%stb.image::data (:array :short 64))
              (%stb.image::hac (:pointer %stb.image::%huffman))
              (%stb.image::fac (:pointer %stb.image::%int16)))

(cffi:defcfun ("stbi__jpeg_decode_block_prog_dc"
               %stb.image::%jpeg-decode-block-prog-dc)
              :int
              (%stb.image::j (:pointer %stb.image::%jpeg))
              (%stb.image::data (:array :short 64))
              (%stb.image::hdc (:pointer %stb.image::%huffman))
              (%stb.image::b :int))

(cffi:defcfun ("stbi__jpeg_dequantize" %stb.image::%jpeg-dequantize)
              :void
              (%stb.image::data (:pointer :short))
              (%stb.image::dequant (:pointer %stb.image::%uint16)))

(cffi:defcfun ("stbi__jpeg_finish" %stb.image::%jpeg-finish)
              :void
              (%stb.image::z (:pointer %stb.image::%jpeg)))

(cffi:defcfun ("stbi__jpeg_get_bit" %stb.image::%jpeg-get-bit)
              :int
              (%stb.image::j (:pointer %stb.image::%jpeg)))

(cffi:defcfun ("stbi__jpeg_get_bits" %stb.image::%jpeg-get-bits)
              :int
              (%stb.image::j (:pointer %stb.image::%jpeg))
              (%stb.image::n :int))

(cffi:defcfun ("stbi__jpeg_huff_decode"
               %stb.image::%jpeg-huff-decode)
              :int
              (%stb.image::j (:pointer %stb.image::%jpeg))
              (%stb.image::h (:pointer %stb.image::%huffman)))

(cffi:defcfun ("stbi__jpeg_info" %stb.image::%jpeg-info)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defcfun ("stbi__jpeg_info_raw" %stb.image::%jpeg-info-raw)
              :int
              (%stb.image::j (:pointer %stb.image::%jpeg))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defcfun ("stbi__jpeg_load" %stb.image::%jpeg-load)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info)))

(cffi:defcfun ("stbi__jpeg_reset" %stb.image::%jpeg-reset)
              :void
              (%stb.image::j (:pointer %stb.image::%jpeg)))

(cffi:defcfun ("stbi__jpeg_test" %stb.image::%jpeg-test)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__ldr_to_hdr" %stb.image::%ldr-to-hdr)
              (:pointer :float)
              (%stb.image::data (:pointer %stb.image::uc))
              (%stb.image::x :int)
              (%stb.image::y :int)
              (%stb.image::comp :int))

(cffi:defcfun ("stbi__load_and_postprocess_16bit"
               %stb.image::%load-and-postprocess-16bit)
              (:pointer %stb.image::%uint16)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int))

(cffi:defcfun ("stbi__load_and_postprocess_8bit"
               %stb.image::%load-and-postprocess-8bit)
              (:pointer :unsigned-char)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int))

(cffi:defcfun ("stbi__load_gif_main" %stb.image::%load-gif-main)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::delays (:pointer (:pointer :int)))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::z (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int))

(cffi:defcfun ("stbi__load_main" %stb.image::%load-main)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info))
              (%stb.image::bpc :int))

(cffi:defcfun ("stbi__loadf_main" %stb.image::%loadf-main)
              (:pointer :float)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int))

(cffi:defcfun ("stbi__mad2sizes_valid" %stb.image::%mad2sizes-valid)
              :int
              (%stb.image::a :int)
              (%stb.image::b :int)
              (%stb.image::add :int))

(cffi:defcfun ("stbi__mad3sizes_valid" %stb.image::%mad3sizes-valid)
              :int
              (%stb.image::a :int)
              (%stb.image::b :int)
              (%stb.image::c :int)
              (%stb.image::add :int))

(cffi:defcfun ("stbi__mad4sizes_valid" %stb.image::%mad4sizes-valid)
              :int
              (%stb.image::a :int)
              (%stb.image::b :int)
              (%stb.image::c :int)
              (%stb.image::d :int)
              (%stb.image::add :int))

(cffi:defcfun ("stbi__malloc" %stb.image::%malloc)
              (:pointer :void)
              (%stb.image::size %stb.image::size-t))

(cffi:defcfun ("stbi__malloc_mad2" %stb.image::%malloc-mad2)
              (:pointer :void)
              (%stb.image::a :int)
              (%stb.image::b :int)
              (%stb.image::add :int))

(cffi:defcfun ("stbi__malloc_mad3" %stb.image::%malloc-mad3)
              (:pointer :void)
              (%stb.image::a :int)
              (%stb.image::b :int)
              (%stb.image::c :int)
              (%stb.image::add :int))

(cffi:defcfun ("stbi__malloc_mad4" %stb.image::%malloc-mad4)
              (:pointer :void)
              (%stb.image::a :int)
              (%stb.image::b :int)
              (%stb.image::c :int)
              (%stb.image::d :int)
              (%stb.image::add :int))

(cffi:defcfun ("stbi__mul2sizes_valid" %stb.image::%mul2sizes-valid)
              :int
              (%stb.image::a :int)
              (%stb.image::b :int))

(cffi:defcfun ("stbi__out_gif_code" %stb.image::%out-gif-code)
              :void
              (%stb.image::g (:pointer %stb.image::%gif))
              (%stb.image::code %stb.image::%uint16))

(cffi:defcfun ("stbi__paeth" %stb.image::%paeth)
              :int
              (%stb.image::a :int)
              (%stb.image::b :int)
              (%stb.image::c :int))

(cffi:defcfun ("stbi__parse_entropy_coded_data"
               %stb.image::%parse-entropy-coded-data)
              :int
              (%stb.image::z (:pointer %stb.image::%jpeg)))

(cffi:defcfun ("stbi__parse_huffman_block"
               %stb.image::%parse-huffman-block)
              :int
              (%stb.image::a (:pointer %stb.image::%zbuf)))

(cffi:defcfun ("stbi__parse_png_file" %stb.image::%parse-png-file)
              :int
              (%stb.image::z (:pointer %stb.image::%png))
              (%stb.image::scan :int)
              (%stb.image::req-comp :int))

(cffi:defcfun ("stbi__parse_uncompressed_block"
               %stb.image::%parse-uncompressed-block)
              :int
              (%stb.image::a (:pointer %stb.image::%zbuf)))

(cffi:defcfun ("stbi__parse_zlib" %stb.image::%parse-zlib)
              :int
              (%stb.image::a (:pointer %stb.image::%zbuf))
              (%stb.image::parse-header :int))

(cffi:defcfun ("stbi__parse_zlib_header"
               %stb.image::%parse-zlib-header)
              :int
              (%stb.image::a (:pointer %stb.image::%zbuf)))

(cffi:defcfun ("stbi__pic_info" %stb.image::%pic-info)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defcfun ("stbi__pic_is4" %stb.image::%pic-is4)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::str claw-utils:claw-string))

(cffi:defcfun ("stbi__pic_load" %stb.image::%pic-load)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info)))

(cffi:defcfun ("stbi__pic_load_core" %stb.image::%pic-load-core)
              (:pointer %stb.image::uc)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::width :int)
              (%stb.image::height :int)
              (%stb.image::comp (:pointer :int))
              (%stb.image::result (:pointer %stb.image::uc)))

(cffi:defcfun ("stbi__pic_test" %stb.image::%pic-test)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__pic_test_core" %stb.image::%pic-test-core)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__png_info" %stb.image::%png-info)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defcfun ("stbi__png_info_raw" %stb.image::%png-info-raw)
              :int
              (%stb.image::p (:pointer %stb.image::%png))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defcfun ("stbi__png_is16" %stb.image::%png-is16)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__png_load" %stb.image::%png-load)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info)))

(cffi:defcfun ("stbi__png_test" %stb.image::%png-test)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__pnm_getinteger" %stb.image::%pnm-getinteger)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::c claw-utils:claw-string))

(cffi:defcfun ("stbi__pnm_info" %stb.image::%pnm-info)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defcfun ("stbi__pnm_isdigit" %stb.image::%pnm-isdigit)
              :int
              (%stb.image::c :char))

(cffi:defcfun ("stbi__pnm_isspace" %stb.image::%pnm-isspace)
              :int
              (%stb.image::c :char))

(cffi:defcfun ("stbi__pnm_load" %stb.image::%pnm-load)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info)))

(cffi:defcfun ("stbi__pnm_skip_whitespace"
               %stb.image::%pnm-skip-whitespace)
              :void
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::c claw-utils:claw-string))

(cffi:defcfun ("stbi__pnm_test" %stb.image::%pnm-test)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__process_frame_header"
               %stb.image::%process-frame-header)
              :int
              (%stb.image::z (:pointer %stb.image::%jpeg))
              (%stb.image::scan :int))

(cffi:defcfun ("stbi__process_gif_raster"
               %stb.image::%process-gif-raster)
              (:pointer %stb.image::uc)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::g (:pointer %stb.image::%gif)))

(cffi:defcfun ("stbi__process_marker" %stb.image::%process-marker)
              :int
              (%stb.image::z (:pointer %stb.image::%jpeg))
              (%stb.image::m :int))

(cffi:defcfun ("stbi__process_scan_header"
               %stb.image::%process-scan-header)
              :int
              (%stb.image::z (:pointer %stb.image::%jpeg)))

(cffi:defcfun ("stbi__psd_decode_rle" %stb.image::%psd-decode-rle)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::p (:pointer %stb.image::uc))
              (%stb.image::pixel-count :int))

(cffi:defcfun ("stbi__psd_info" %stb.image::%psd-info)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defcfun ("stbi__psd_is16" %stb.image::%psd-is16)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__psd_load" %stb.image::%psd-load)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info))
              (%stb.image::bpc :int))

(cffi:defcfun ("stbi__psd_test" %stb.image::%psd-test)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__readval" %stb.image::%readval)
              (:pointer %stb.image::uc)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::channel :int)
              (%stb.image::dest (:pointer %stb.image::uc)))

(cffi:defcfun ("stbi__refill_buffer" %stb.image::%refill-buffer)
              :void
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__resample_row_generic"
               %stb.image::%resample-row-generic)
              (:pointer %stb.image::uc)
              (%stb.image::out (:pointer %stb.image::uc))
              (%stb.image::in-near (:pointer %stb.image::uc))
              (%stb.image::in-far (:pointer %stb.image::uc))
              (%stb.image::w :int)
              (%stb.image::hs :int))

(cffi:defcfun ("stbi__resample_row_h_2"
               %stb.image::%resample-row-h-2)
              (:pointer %stb.image::uc)
              (%stb.image::out (:pointer %stb.image::uc))
              (%stb.image::in-near (:pointer %stb.image::uc))
              (%stb.image::in-far (:pointer %stb.image::uc))
              (%stb.image::w :int)
              (%stb.image::hs :int))

(cffi:defcfun ("stbi__resample_row_hv_2"
               %stb.image::%resample-row-hv-2)
              (:pointer %stb.image::uc)
              (%stb.image::out (:pointer %stb.image::uc))
              (%stb.image::in-near (:pointer %stb.image::uc))
              (%stb.image::in-far (:pointer %stb.image::uc))
              (%stb.image::w :int)
              (%stb.image::hs :int))

(cffi:defcfun ("stbi__resample_row_v_2"
               %stb.image::%resample-row-v-2)
              (:pointer %stb.image::uc)
              (%stb.image::out (:pointer %stb.image::uc))
              (%stb.image::in-near (:pointer %stb.image::uc))
              (%stb.image::in-far (:pointer %stb.image::uc))
              (%stb.image::w :int)
              (%stb.image::hs :int))

(cffi:defcfun ("stbi__rewind" %stb.image::%rewind)
              :void
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__setup_jpeg" %stb.image::%setup-jpeg)
              :void
              (%stb.image::j (:pointer %stb.image::%jpeg)))

(cffi:defcfun ("stbi__shiftsigned" %stb.image::%shiftsigned)
              :int
              (%stb.image::v :unsigned-int)
              (%stb.image::shift :int)
              (%stb.image::bits :int))

(cffi:defcfun ("stbi__skip" %stb.image::%skip)
              :void
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::n :int))

(cffi:defcfun ("stbi__start_callbacks" %stb.image::%start-callbacks)
              :void
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::c (:pointer %stb.image::io-callbacks))
              (%stb.image::user (:pointer :void)))

(cffi:defcfun ("stbi__start_file" %stb.image::%start-file)
              :void
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::f (:pointer %stb.image::file)))

(cffi:defcfun ("stbi__start_mem" %stb.image::%start-mem)
              :void
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::buffer (:pointer %stb.image::uc))
              (%stb.image::len :int))

(cffi:defcfun ("stbi__stdio_eof" %stb.image::%stdio-eof)
              :int
              (%stb.image::user (:pointer :void)))

(cffi:defcfun ("stbi__stdio_read" %stb.image::%stdio-read)
              :int
              (%stb.image::user (:pointer :void))
              (%stb.image::data claw-utils:claw-string)
              (%stb.image::size :int))

(cffi:defcfun ("stbi__stdio_skip" %stb.image::%stdio-skip)
              :void
              (%stb.image::user (:pointer :void))
              (%stb.image::n :int))

(cffi:defcfun ("stbi__tga_get_comp" %stb.image::%tga-get-comp)
              :int
              (%stb.image::bits-per-pixel :int)
              (%stb.image::is-grey :int)
              (%stb.image::is-rgb16 (:pointer :int)))

(cffi:defcfun ("stbi__tga_info" %stb.image::%tga-info)
              :int
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int)))

(cffi:defcfun ("stbi__tga_load" %stb.image::%tga-load)
              (:pointer :void)
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::x (:pointer :int))
              (%stb.image::y (:pointer :int))
              (%stb.image::comp (:pointer :int))
              (%stb.image::req-comp :int)
              (%stb.image::ri (:pointer %stb.image::%result-info)))

(cffi:defcfun ("stbi__tga_read_rgb16" %stb.image::%tga-read-rgb16)
              :void
              (%stb.image::s (:pointer %stb.image::%context))
              (%stb.image::out (:pointer %stb.image::uc)))

(cffi:defcfun ("stbi__tga_test" %stb.image::%tga-test)
              :int
              (%stb.image::s (:pointer %stb.image::%context)))

(cffi:defcfun ("stbi__vertical_flip" %stb.image::%vertical-flip)
              :void
              (%stb.image::image (:pointer :void))
              (%stb.image::w :int)
              (%stb.image::h :int)
              (%stb.image::bytes-per-pixel :int))

(cffi:defcfun ("stbi__vertical_flip_slices"
               %stb.image::%vertical-flip-slices)
              :void
              (%stb.image::image (:pointer :void))
              (%stb.image::w :int)
              (%stb.image::h :int)
              (%stb.image::z :int)
              (%stb.image::bytes-per-pixel :int))

(cffi:defcfun ("stbi__zbuild_huffman" %stb.image::%zbuild-huffman)
              :int
              (%stb.image::z (:pointer %stb.image::%zhuffman))
              (%stb.image::sizelist (:pointer %stb.image::uc))
              (%stb.image::num :int))

(cffi:defcfun ("stbi__zeof" %stb.image::%zeof)
              :int
              (%stb.image::z (:pointer %stb.image::%zbuf)))

(cffi:defcfun ("stbi__zexpand" %stb.image::%zexpand)
              :int
              (%stb.image::z (:pointer %stb.image::%zbuf))
              (%stb.image::zout claw-utils:claw-string)
              (%stb.image::n :int))

(cffi:defcfun ("stbi__zget8" %stb.image::%zget8)
              %stb.image::uc
              (%stb.image::z (:pointer %stb.image::%zbuf)))

(cffi:defcfun ("stbi__zhuffman_decode" %stb.image::%zhuffman-decode)
              :int
              (%stb.image::a (:pointer %stb.image::%zbuf))
              (%stb.image::z (:pointer %stb.image::%zhuffman)))

(cffi:defcfun ("stbi__zhuffman_decode_slowpath"
               %stb.image::%zhuffman-decode-slowpath)
              :int
              (%stb.image::a (:pointer %stb.image::%zbuf))
              (%stb.image::z (:pointer %stb.image::%zhuffman)))

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
  (export '%stb.image::resample-row-func "%STB.IMAGE")
  (export '%stb.image::%zhuffman "%STB.IMAGE")
  (export '%stb.image::%png-info "%STB.IMAGE")
  (export '%stb.image::line0 "%STB.IMAGE")
  (export '%stb.image::delay "%STB.IMAGE")
  (export '%stb.image::%malloc-mad2 "%STB.IMAGE")
  (export '%stb.image::%codecvt "%STB.IMAGE")
  (export '%stb.image::%get-chunk-header "%STB.IMAGE")
  (export '%stb.image::restart-interval "%STB.IMAGE")
  (export '%stb.image::buffer-start "%STB.IMAGE")
  (export '%stb.image::%zhuffman-decode-slowpath "%STB.IMAGE")
  (export '%stb.image::load "%STB.IMAGE")
  (export '%stb.image::%old-offset "%STB.IMAGE")
  (export '%stb.image::%free-jpeg-components "%STB.IMAGE")
  (export '%stb.image::%gif-lzw "%STB.IMAGE")
  (export '%stb.image::%io-read-end "%STB.IMAGE")
  (export '%stb.image::+%zfast-bits+ "%STB.IMAGE")
  (export '%stb.image::%fopen "%STB.IMAGE")
  (export '%stb.image::%addsizes-valid "%STB.IMAGE")
  (export '%stb.image::eob-run "%STB.IMAGE")
  (export '%stb.image::background "%STB.IMAGE")
  (export '%stb.image::%gif-load-next "%STB.IMAGE")
  (export '%stb.image::%jpeg-dequantize "%STB.IMAGE")
  (export '%stb.image::%gif "%STB.IMAGE")
  (export '%stb.image::%tga-info "%STB.IMAGE")
  (export '%stb.image::load-16-from-callbacks "%STB.IMAGE")
  (export '%stb.image::expanded "%STB.IMAGE")
  (export '%stb.image::%compute-transparency "%STB.IMAGE")
  (export '%stb.image::bits-per-channel "%STB.IMAGE")
  (export '%stb.image::%zexpand "%STB.IMAGE")
  (export '%stb.image::%rewind "%STB.IMAGE")
  (export '%stb.image::%load-main "%STB.IMAGE")
  (export '%stb.image::%compute-huffman-codes "%STB.IMAGE")
  (export '%stb.image::%result-info "%STB.IMAGE")
  (export '%stb.image::load-16 "%STB.IMAGE")
  (export '%stb.image::firstsymbol "%STB.IMAGE")
  (export '%stb.image::z-distance "%STB.IMAGE")
  (export '%stb.image::%shiftsigned "%STB.IMAGE")
  (export '%stb.image::codes "%STB.IMAGE")
  (export '%stb.image::%lock "%STB.IMAGE")
  (export '%stb.image::is-hdr-from-memory "%STB.IMAGE")
  (export '%stb.image::%idct-block "%STB.IMAGE")
  (export '%stb.image::%load-and-postprocess-16bit "%STB.IMAGE")
  (export '%stb.image::depth "%STB.IMAGE")
  (export '%stb.image::img-buffer-end "%STB.IMAGE")
  (export '%stb.image::%vertical-flip "%STB.IMAGE")
  (export '%stb.image::%create-png-image-raw "%STB.IMAGE")
  (export '%stb.image::ldr-to-hdr-gamma "%STB.IMAGE")
  (export '%stb.image::out "%STB.IMAGE")
  (export '%stb.image::%check-png-header "%STB.IMAGE")
  (export '%stb.image::%getn "%STB.IMAGE")
  (export '%stb.image::*%zdefault-length* "%STB.IMAGE")
  (export '%stb.image::%chain "%STB.IMAGE")
  (export '%stb.image::raw-coeff "%STB.IMAGE")
  (export '%stb.image::%malloc-mad4 "%STB.IMAGE")
  (export '%stb.image::%start-mem "%STB.IMAGE")
  (export '%stb.image::%png-load "%STB.IMAGE")
  (export '%stb.image::img-buffer-original "%STB.IMAGE")
  (export '%stb.image::firstcode "%STB.IMAGE")
  (export '%stb.image::%io-codecvt "%STB.IMAGE")
  (export '%stb.image::loadf "%STB.IMAGE")
  (export '%stb.image::%jpeg-get-bit "%STB.IMAGE")
  (export '%stb.image::load-from-file-16 "%STB.IMAGE")
  (export '%stb.image::%pnm-skip-whitespace "%STB.IMAGE")
  (export '%stb.image::%jpeg "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--JPEG@S@STB-IMAGE.H@66207|
          "%STB.IMAGE")
  (export '%stb.image::loadf-from-callbacks "%STB.IMAGE")
  (export '%stb.image::history "%STB.IMAGE")
  (export '%stb.image::img-y "%STB.IMAGE")
  (export '%stb.image::*%depth-scale-table* "%STB.IMAGE")
  (export '%stb.image::read-from-callbacks "%STB.IMAGE")
  (export '%stb.image::spec-end "%STB.IMAGE")
  (export '%stb.image::img-v-max "%STB.IMAGE")
  (export '%stb.image::%float-postprocess "%STB.IMAGE")
  (export '%stb.image::%jpeg-huff-decode "%STB.IMAGE")
  (export '%stb.image::%%pad5 "%STB.IMAGE")
  (export '%stb.image::%tga-read-rgb16 "%STB.IMAGE")
  (export '%stb.image::%parse-huffman-block "%STB.IMAGE")
  (export '%stb.image::*%zlength-extra* "%STB.IMAGE")
  (export '%stb.image::code-bits "%STB.IMAGE")
  (export '%stb.image::%tga-get-comp "%STB.IMAGE")
  (export '%stb.image::%load-and-postprocess-8bit "%STB.IMAGE")
  (export '%stb.image::%gif-test-raw "%STB.IMAGE")
  (export '%stb.image::set-flip-vertically-on-load "%STB.IMAGE")
  (export '%stb.image::line1 "%STB.IMAGE")
  (export '%stb.image::marker "%STB.IMAGE")
  (export '%stb.image::zlib-decode-noheader-malloc "%STB.IMAGE")
  (export '%stb.image::zlib-decode-malloc-guesssize-headerflag
          "%STB.IMAGE")
  (export '%stb.image::%uint16 "%STB.IMAGE")
  (export '%stb.image::img-buffer "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--GIF-LZW| "%STB.IMAGE")
  (export '%stb.image::%process-scan-header "%STB.IMAGE")
  (export '%stb.image::img-n "%STB.IMAGE")
  (export '%stb.image::%is-16-main "%STB.IMAGE")
  (export '%stb.image::%mad2sizes-valid "%STB.IMAGE")
  (export '%stb.image::lpal "%STB.IMAGE")
  (export '%stb.image::%clamp "%STB.IMAGE")
  (export '%stb.image::%int16 "%STB.IMAGE")
  (export '%stb.image::%zbuild-huffman "%STB.IMAGE")
  (export '%stb.image::%parse-uncompressed-block "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--JPEG| "%STB.IMAGE")
  (export '%stb.image::%get16le "%STB.IMAGE")
  (export '%stb.image::y "%STB.IMAGE")
  (export '%stb.image::%io-save-base "%STB.IMAGE")
  (export '%stb.image::+%marker-none+ "%STB.IMAGE")
  (export '%stb.image::%skip "%STB.IMAGE")
  (export '%stb.image::extra-read "%STB.IMAGE")
  (export '%stb.image::lflags "%STB.IMAGE")
  (export '%stb.image::set-flip-vertically-on-load-thread
          "%STB.IMAGE")
  (export '%stb.image::%pic-info "%STB.IMAGE")
  (export '%stb.image::h2 "%STB.IMAGE")
  (export '%stb.image::%bmp-parse-header "%STB.IMAGE")
  (export '%stb.image::%freeres-buf "%STB.IMAGE")
  (export '%stb.image::length "%STB.IMAGE")
  (export '%stb.image::%bitreverse16 "%STB.IMAGE")
  (export '%stb.image::is-16-bit-from-file "%STB.IMAGE")
  (export '%stb.image::%uint32 "%STB.IMAGE")
  (export '%stb.image::z-expandable "%STB.IMAGE")
  (export '%stb.image::*%l2h-scale* "%STB.IMAGE")
  (export '%stb.image::%jpeg-info-raw "%STB.IMAGE")
  (export '%stb.image::%get32le "%STB.IMAGE")
  (export '%stb.image::%zbuf "%STB.IMAGE")
  (export '%stb.image::%jpeg-load "%STB.IMAGE")
  (export '%stb.image::zout-start "%STB.IMAGE")
  (export '%stb.image::pal "%STB.IMAGE")
  (export '%stb.image::failure-reason "%STB.IMAGE")
  (export '%stb.image::%jpeg-decode-block-prog-dc "%STB.IMAGE")
  (export '%stb.image::%bmp-test-raw "%STB.IMAGE")
  (export '%stb.image::suffix "%STB.IMAGE")
  (export '%stb.image::*%jpeg-dezigzag* "%STB.IMAGE")
  (export '%stb.image::%stdio-eof "%STB.IMAGE")
  (export '%stb.image::values "%STB.IMAGE")
  (export '%stb.image::%jpeg-finish "%STB.IMAGE")
  (export '%stb.image::img-h-max "%STB.IMAGE")
  (export '%stb.image::%convert-format "%STB.IMAGE")
  (export '%stb.image::%context "%STB.IMAGE")
  (export '%stb.image::step "%STB.IMAGE")
  (export '%stb.image::%io-read-ptr "%STB.IMAGE")
  (export '%stb.image::bgindex "%STB.IMAGE")
  (export '%stb.image::is-hdr "%STB.IMAGE")
  (export '%stb.image::%expand-png-palette "%STB.IMAGE")
  (export '%stb.image::info "%STB.IMAGE")
  (export '%stb.image::delta "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--PIC-PACKET| "%STB.IMAGE")
  (export '%stb.image::%io-write-end "%STB.IMAGE")
  (export '%stb.image::huff-ac "%STB.IMAGE")
  (export '%stb.image::all-a "%STB.IMAGE")
  (export '%stb.image::spec-start "%STB.IMAGE")
  (export '%stb.image::%build-huffman "%STB.IMAGE")
  (export '%stb.image::hdr-to-ldr-gamma "%STB.IMAGE")
  (export '%stb.image::%de-iphone "%STB.IMAGE")
  (export '%stb.image::img-mcu-w "%STB.IMAGE")
  (export '%stb.image::%high-bit "%STB.IMAGE")
  (export '%stb.image::%grow-buffer-unsafe "%STB.IMAGE")
  (export '%stb.image::eof "%STB.IMAGE")
  (export '%stb.image::todo "%STB.IMAGE")
  (export '%stb.image::color-table "%STB.IMAGE")
  (export '%stb.image::%io-buf-base "%STB.IMAGE")
  (export '%stb.image::code "%STB.IMAGE")
  (export '%stb.image::%jpeg-decode-block-prog-ac "%STB.IMAGE")
  (export '%stb.image::%load-gif-main "%STB.IMAGE")
  (export '%stb.image::%jpeg-info "%STB.IMAGE")
  (export '%stb.image::%cleanup-jpeg "%STB.IMAGE")
  (export '%stb.image::callback-already-read "%STB.IMAGE")
  (export '%stb.image::load-from-callbacks "%STB.IMAGE")
  (export '%stb.image::%do-zlib "%STB.IMAGE")
  (export '%stb.image::%io-buf-end "%STB.IMAGE")
  (export '%stb.image::%pnm-isdigit "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--PNGCHUNK| "%STB.IMAGE")
  (export '%stb.image::%pngchunk "%STB.IMAGE")
  (export '%stb.image::img-buffer-original-end "%STB.IMAGE")
  (export '%stb.image::img-x "%STB.IMAGE")
  (export '%stb.image::%pnm-test "%STB.IMAGE")
  (export '%stb.image::+thread-local+ "%STB.IMAGE")
  (export '%stb.image::%flags "%STB.IMAGE")
  (export '%stb.image::fast "%STB.IMAGE")
  (export '%stb.image::%shortbuf "%STB.IMAGE")
  (export '%stb.image::v "%STB.IMAGE")
  (export '%stb.image::%malloc-mad3 "%STB.IMAGE")
  (export '%stb.image::%pic-load "%STB.IMAGE")
  (export '%stb.image::%bitcount "%STB.IMAGE")
  (export '%stb.image::%decode-jpeg-image "%STB.IMAGE")
  (export '%stb.image::%pic-is4 "%STB.IMAGE")
  (export '%stb.image::info-from-file "%STB.IMAGE")
  (export '%stb.image::%start-file "%STB.IMAGE")
  (export '%stb.image::maxcode "%STB.IMAGE")
  (export '%stb.image::%io-marker "%STB.IMAGE")
  (export '%stb.image::+%vertically-flip-on-load+ "%STB.IMAGE")
  (export '%stb.image::%stdio-read "%STB.IMAGE")
  (export '%stb.image::is-hdr-from-callbacks "%STB.IMAGE")
  (export '%stb.image::*%bmask* "%STB.IMAGE")
  (export '%stb.image::%vertical-flip-slices "%STB.IMAGE")
  (export '%stb.image::prefix "%STB.IMAGE")
  (export '%stb.image::+%hdr-buflen+ "%STB.IMAGE")
  (export '%stb.image::flags "%STB.IMAGE")
  (export '%stb.image::%pnm-info "%STB.IMAGE")
  (export '%stb.image::%psd-decode-rle "%STB.IMAGE")
  (export '%stb.image::%bmp-info "%STB.IMAGE")
  (export '%stb.image::zbuffer "%STB.IMAGE")
  (export '%stb.image::%pic-packet "%STB.IMAGE")
  (export '%stb.image::%flags2 "%STB.IMAGE")
  (export '%stb.image::tq "%STB.IMAGE")
  (export '%stb.image::w2 "%STB.IMAGE")
  (export '%stb.image::*%de-iphone-flag* "%STB.IMAGE")
  (export '%stb.image::z-length "%STB.IMAGE")
  (export '%stb.image::%tga-load "%STB.IMAGE")
  (export '%stb.image::%gif-info-raw "%STB.IMAGE")
  (export '%stb.image::%get16be "%STB.IMAGE")
  (export '%stb.image::%extend-receive "%STB.IMAGE")
  (export '%stb.image::offset "%STB.IMAGE")
  (export '%stb.image::num-bits "%STB.IMAGE")
  (export '%stb.image::%get-marker "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--RESAMPLE| "%STB.IMAGE")
  (export '%stb.image::%convert-16-to-8 "%STB.IMAGE")
  (export '%stb.image::%png-info-raw "%STB.IMAGE")
  (export '%stb.image::%get32be "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--PNG| "%STB.IMAGE")
  (export '%stb.image::eflags "%STB.IMAGE")
  (export '%stb.image::+extern+ "%STB.IMAGE")
  (export '%stb.image::%loadf-main "%STB.IMAGE")
  (export '%stb.image::%psd-test "%STB.IMAGE")
  (export '%stb.image::%int32 "%STB.IMAGE")
  (export '%stb.image::%hdr-test-core "%STB.IMAGE")
  (export '%stb.image::info-from-callbacks "%STB.IMAGE")
  (export '%stb.image::cur-x "%STB.IMAGE")
  (export '%stb.image::is-hdr-from-file "%STB.IMAGE")
  (export '%stb.image::%png-is16 "%STB.IMAGE")
  (export '%stb.image::*%h2l-scale-i* "%STB.IMAGE")
  (export '%stb.image::*%vertically-flip-on-load-set* "%STB.IMAGE")
  (export '%stb.image::ma "%STB.IMAGE")
  (export '%stb.image::%process-marker "%STB.IMAGE")
  (export '%stb.image::is-16-bit "%STB.IMAGE")
  (export '%stb.image::idct-block-kernel "%STB.IMAGE")
  (export '%stb.image::type "%STB.IMAGE")
  (export '%stb.image::%io-wide-data "%STB.IMAGE")
  (export '%stb.image::size-t "%STB.IMAGE")
  (export '%stb.image::linebuf "%STB.IMAGE")
  (export '%stb.image::%parse-zlib "%STB.IMAGE")
  (export '%stb.image::%io-read-base "%STB.IMAGE")
  (export '%stb.image::convert-iphone-png-to-rgb "%STB.IMAGE")
  (export '%stb.image::%png-test "%STB.IMAGE")
  (export '%stb.image::resample-row-hv-2-kernel "%STB.IMAGE")
  (export '%stb.image::%io-write-ptr "%STB.IMAGE")
  (export '%stb.image::app14-color-transform "%STB.IMAGE")
  (export '%stb.image::%process-frame-header "%STB.IMAGE")
  (export '%stb.image::+%zfast-mask+ "%STB.IMAGE")
  (export '%stb.image::load-from-memory "%STB.IMAGE")
  (export '%stb.image::%create-png-image "%STB.IMAGE")
  (export '%stb.image::ratio "%STB.IMAGE")
  (export '%stb.image::%compute-y "%STB.IMAGE")
  (export '%stb.image::img-mcu-y "%STB.IMAGE")
  (export '%stb.image::%gif-test "%STB.IMAGE")
  (export '%stb.image::%err "%STB.IMAGE")
  (export '%stb.image::jfif "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--HUFFMAN| "%STB.IMAGE")
  (export '%stb.image::%huffman "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--GIF| "%STB.IMAGE")
  (export '%stb.image::%get8 "%STB.IMAGE")
  (export '%stb.image::%freeres-list "%STB.IMAGE")
  (export '%stb.image::idata "%STB.IMAGE")
  (export '%stb.image::%out-gif-code "%STB.IMAGE")
  (export '%stb.image::id "%STB.IMAGE")
  (export '%stb.image::ypos "%STB.IMAGE")
  (export '%stb.image::%stdio-skip "%STB.IMAGE")
  (export '%stb.image::%y-cb-cr-to-rgb-row "%STB.IMAGE")
  (export '%stb.image::%%off-t "%STB.IMAGE")
  (export '%stb.image::file "%STB.IMAGE")
  (export '%stb.image::zbuffer-end "%STB.IMAGE")
  (export '%stb.image::vs "%STB.IMAGE")
  (export '%stb.image::img-mcu-h "%STB.IMAGE")
  (export '%stb.image::is-16-bit-from-callbacks "%STB.IMAGE")
  (export '%stb.image::%pnm-getinteger "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--ZHUFFMAN| "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--RESULT-INFO| "%STB.IMAGE")
  (export '%stb.image::data "%STB.IMAGE")
  (export '%stb.image::%%off64-t "%STB.IMAGE")
  (export '%stb.image::+%case+ "%STB.IMAGE")
  (export '%stb.image::resample "%STB.IMAGE")
  (export '%stb.image::%pic-test "%STB.IMAGE")
  (export '%stb.image::%mad3sizes-valid "%STB.IMAGE")
  (export '%stb.image::%io-backup-base "%STB.IMAGE")
  (export '%stb.image::scan-n "%STB.IMAGE")
  (export '%stb.image::w "%STB.IMAGE")
  (export '%stb.image::%copyval "%STB.IMAGE")
  (export '%stb.image::hs "%STB.IMAGE")
  (export '%stb.image::%pic-test-core "%STB.IMAGE")
  (export '%stb.image::%pic-load-core "%STB.IMAGE")
  (export '%stb.image::coeff-h "%STB.IMAGE")
  (export '%stb.image::line-size "%STB.IMAGE")
  (export '%stb.image::%fileno "%STB.IMAGE")
  (export '%stb.image::code-buffer "%STB.IMAGE")
  (export '%stb.image::loadf-from-file "%STB.IMAGE")
  (export '%stb.image::%gif-parse-colortable "%STB.IMAGE")
  (export '%stb.image::zlib-decode-malloc-guesssize "%STB.IMAGE")
  (export '%stb.image::%zget8 "%STB.IMAGE")
  (export '%stb.image::*%h2l-gamma-i* "%STB.IMAGE")
  (export '%stb.image::%bmp-test "%STB.IMAGE")
  (export '%stb.image::is-16-bit-from-memory "%STB.IMAGE")
  (export '%stb.image::channel "%STB.IMAGE")
  (export '%stb.image::image-free "%STB.IMAGE")
  (export '%stb.image::max-y "%STB.IMAGE")
  (export '%stb.image::ha "%STB.IMAGE")
  (export '%stb.image::coeff "%STB.IMAGE")
  (export '%stb.image::w-lores "%STB.IMAGE")
  (export '%stb.image::nomore "%STB.IMAGE")
  (export '%stb.image::+include-stb-image-h+ "%STB.IMAGE")
  (export '%stb.image::x "%STB.IMAGE")
  (export '%stb.image::%compute-transparency16 "%STB.IMAGE")
  (export '%stb.image::*%stdio-callbacks* "%STB.IMAGE")
  (export '%stb.image::%psd-info "%STB.IMAGE")
  (export '%stb.image::succ-high "%STB.IMAGE")
  (export '%stb.image::%gif-header "%STB.IMAGE")
  (export '%stb.image::%mad4sizes-valid "%STB.IMAGE")
  (export '%stb.image::cur-y "%STB.IMAGE")
  (export '%stb.image::%malloc "%STB.IMAGE")
  (export '%stb.image::%psd-is16 "%STB.IMAGE")
  (export '%stb.image::+inline+ "%STB.IMAGE")
  (export '%stb.image::coeff-w "%STB.IMAGE")
  (export '%stb.image::%resample-row-generic "%STB.IMAGE")
  (export '%stb.image::%at-eof "%STB.IMAGE")
  (export '%stb.image::%info-main "%STB.IMAGE")
  (export '%stb.image::s "%STB.IMAGE")
  (export '%stb.image::transparent "%STB.IMAGE")
  (export '%stb.image::%offset "%STB.IMAGE")
  (export '%stb.image::read "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--BMP-DATA| "%STB.IMAGE")
  (export '%stb.image::%io-file "%STB.IMAGE")
  (export '%stb.image::%refill-buffer "%STB.IMAGE")
  (export '%stb.image::%zeof "%STB.IMAGE")
  (export '%stb.image::%pnm-isspace "%STB.IMAGE")
  (export '%stb.image::mr "%STB.IMAGE")
  (export '%stb.image::ystep "%STB.IMAGE")
  (export '%stb.image::uc "%STB.IMAGE")
  (export '%stb.image::load-from-file "%STB.IMAGE")
  (export '%stb.image::load-16-from-memory "%STB.IMAGE")
  (export '%stb.image::io "%STB.IMAGE")
  (export '%stb.image::start-x "%STB.IMAGE")
  (export '%stb.image::dequant "%STB.IMAGE")
  (export '%stb.image::%hdr-info "%STB.IMAGE")
  (export '%stb.image::*%zlength-base* "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--CONTEXT| "%STB.IMAGE")
  (export '%stb.image::%convert-format16 "%STB.IMAGE")
  (export '%stb.image::load-gif-from-memory "%STB.IMAGE")
  (export '%stb.image::rgb "%STB.IMAGE")
  (export '%stb.image::%parse-entropy-coded-data "%STB.IMAGE")
  (export '%stb.image::%paeth "%STB.IMAGE")
  (export '%stb.image::max-x "%STB.IMAGE")
  (export '%stb.image::%bmp-data "%STB.IMAGE")
  (export '%stb.image::zout-end "%STB.IMAGE")
  (export '%stb.image::h "%STB.IMAGE")
  (export '%stb.image::%io-save-end "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI--ZBUF| "%STB.IMAGE")
  (export '%stb.image::fast-ac "%STB.IMAGE")
  (export '%stb.image::%io-write-base "%STB.IMAGE")
  (export '%stb.image::*%zdefault-distance* "%STB.IMAGE")
  (export '%stb.image::%compute-y-16 "%STB.IMAGE")
  (export '%stb.image::bpp "%STB.IMAGE")
  (export '%stb.image::%jpeg-decode-block "%STB.IMAGE")
  (export '%stb.image::*%l2h-gamma* "%STB.IMAGE")
  (export '%stb.image::%resample "%STB.IMAGE")
  (export '%stb.image::raw-data "%STB.IMAGE")
  (export '%stb.image::%resample-row-hv-2 "%STB.IMAGE")
  (export '%stb.image::%tga-test "%STB.IMAGE")
  (export '%stb.image::progressive "%STB.IMAGE")
  (export '%stb.image::%start-callbacks "%STB.IMAGE")
  (export '%stb.image::zlib-decode-malloc "%STB.IMAGE")
  (export '%stb.image::+max-dimensions+ "%STB.IMAGE")
  (export '%stb.image::info-from-memory "%STB.IMAGE")
  (export '%stb.image::%gif-load "%STB.IMAGE")
  (export '%stb.image::%decode-jpeg-header "%STB.IMAGE")
  (export '%stb.image::%bmp-load "%STB.IMAGE")
  (export '%stb.image::%png "%STB.IMAGE")
  (export '%stb.image::%fill-bits "%STB.IMAGE")
  (export '%stb.image::channel-order "%STB.IMAGE")
  (export '%stb.image::%vtable-offset "%STB.IMAGE")
  (export '%stb.image::parse "%STB.IMAGE")
  (export '%stb.image::%zhuffman-decode "%STB.IMAGE")
  (export '%stb.image::skip "%STB.IMAGE")
  (export '%stb.image::io-user-data "%STB.IMAGE")
  (export '%stb.image::ldr-to-hdr-scale "%STB.IMAGE")
  (export '%stb.image::img-comp "%STB.IMAGE")
  (export '%stb.image::huff-dc "%STB.IMAGE")
  (export '%stb.image::*%vertically-flip-on-load-global*
          "%STB.IMAGE")
  (export '%stb.image::%hdr-to-ldr "%STB.IMAGE")
  (export '%stb.image::*%zdist-extra* "%STB.IMAGE")
  (export '%stb.image::num-channels "%STB.IMAGE")
  (export '%stb.image::*%vertically-flip-on-load-local* "%STB.IMAGE")
  (export '%stb.image::set-unpremultiply-on-load "%STB.IMAGE")
  (export '%stb.image::%zreceive "%STB.IMAGE")
  (export '%stb.image::succ-low "%STB.IMAGE")
  (export '%stb.image::%markers "%STB.IMAGE")
  (export '%stb.image::*%zdist-base* "%STB.IMAGE")
  (export '%stb.image::io-callbacks "%STB.IMAGE")
  (export '%stb.image::start-y "%STB.IMAGE")
  (export '%stb.image::zlib-decode-buffer "%STB.IMAGE")
  (export '%stb.image::%ldr-to-hdr "%STB.IMAGE")
  (export '%stb.image::%convert-8-to-16 "%STB.IMAGE")
  (export '%stb.image::%pnm-load "%STB.IMAGE")
  (export '%stb.image::%resample-row-h-2 "%STB.IMAGE")
  (export '%stb.image::zout "%STB.IMAGE")
  (export '%stb.image::*%jbias* "%STB.IMAGE")
  (export '%stb.image::dc-pred "%STB.IMAGE")
  (export '%stb.image::%jpeg-test "%STB.IMAGE")
  (export '%stb.image::%hdr-test "%STB.IMAGE")
  (export '%stb.image::%cur-column "%STB.IMAGE")
  (export '%stb.image::%parse-zlib-header "%STB.IMAGE")
  (export '%stb.image::%io-lock-t "%STB.IMAGE")
  (export '%stb.image::order "%STB.IMAGE")
  (export '%stb.image::%build-fast-ac "%STB.IMAGE")
  (export '%stb.image::%hdr-gettoken "%STB.IMAGE")
  (export '%stb.image::img-mcu-x "%STB.IMAGE")
  (export '%stb.image::hdr-to-ldr-scale "%STB.IMAGE")
  (export '%stb.image::mb "%STB.IMAGE")
  (export '%stb.image::img-out-n "%STB.IMAGE")
  (export '%stb.image::value "%STB.IMAGE")
  (export '%stb.image::%hdr-convert "%STB.IMAGE")
  (export '%stb.image::%jpeg-get-bits "%STB.IMAGE")
  (export '%stb.image::hsz "%STB.IMAGE")
  (export '%stb.image::y-cb-cr-to-rgb-kernel "%STB.IMAGE")
  (export '%stb.image::%process-gif-raster "%STB.IMAGE")
  (export '%stb.image::hd "%STB.IMAGE")
  (export '%stb.image::mg "%STB.IMAGE")
  (export '%stb.image::%hdr-load "%STB.IMAGE")
  (export '%stb.image::%psd-load "%STB.IMAGE")
  (export '%stb.image::us "%STB.IMAGE")
  (export '%stb.image::%unused2 "%STB.IMAGE")
  (export '%stb.image::%blinn-8x8 "%STB.IMAGE")
  (export '%stb.image::size "%STB.IMAGE")
  (export '%stb.image::%parse-png-file "%STB.IMAGE")
  (export '%stb.image::%mode "%STB.IMAGE")
  (export '%stb.image::first "%STB.IMAGE")
  (export '%stb.image::*%unpremultiply-on-load* "%STB.IMAGE")
  (export '%stb.image::|C:@SA@STBI-IO-CALLBACKS| "%STB.IMAGE")
  (export '%stb.image::loadf-from-memory "%STB.IMAGE")
  (export '%stb.image::%readval "%STB.IMAGE")
  (export '%stb.image::zlib-decode-noheader-buffer "%STB.IMAGE")
  (export '%stb.image::%do-png "%STB.IMAGE")
  (export '%stb.image::%jpeg-reset "%STB.IMAGE")
  (export '%stb.image::%bit-reverse "%STB.IMAGE")
  (export '%stb.image::*%g-failure-reason* "%STB.IMAGE")
  (export '%stb.image::%setup-jpeg "%STB.IMAGE")
  (export '%stb.image::%mul2sizes-valid "%STB.IMAGE")
  (export '%stb.image::buflen "%STB.IMAGE")
  (export '%stb.image::%resample-row-v-2 "%STB.IMAGE")
  (export '%stb.image::%gif-info "%STB.IMAGE")
  (export '%stb.image::%wide-data "%STB.IMAGE"))

