(uiop:define-package :%stb.image.write (:use))
(uiop:define-package :claw-stb-image-write-bindings~pristine (:use
                                                              :cl))
(common-lisp:in-package :claw-stb-image-write-bindings~pristine)

(cffi:defcfun ("stbi_flip_vertically_on_write"
               %stb.image.write::flip-vertically-on-write)
              :void
              (%stb.image.write::flip-boolean :int))

(cffi:defcfun ("stbi_write_bmp" %stb.image.write::write-bmp)
              :int
              (%stb.image.write::filename claw-utils:claw-string)
              (%stb.image.write::w :int)
              (%stb.image.write::h :int)
              (%stb.image.write::comp :int)
              (%stb.image.write::data (:pointer :void)))

(cffi:defctype %stb.image.write::write-func :pointer)

(cffi:defcfun ("stbi_write_bmp_to_func"
               %stb.image.write::write-bmp-to-func)
              :int
              (%stb.image.write::func
               (:pointer %stb.image.write::write-func))
              (%stb.image.write::context (:pointer :void))
              (%stb.image.write::w :int)
              (%stb.image.write::h :int)
              (%stb.image.write::comp :int)
              (%stb.image.write::data (:pointer :void)))

(cffi:defcfun ("stbi_write_hdr" %stb.image.write::write-hdr)
              :int
              (%stb.image.write::filename claw-utils:claw-string)
              (%stb.image.write::w :int)
              (%stb.image.write::h :int)
              (%stb.image.write::comp :int)
              (%stb.image.write::data (:pointer :float)))

(cffi:defcfun ("stbi_write_hdr_to_func"
               %stb.image.write::write-hdr-to-func)
              :int
              (%stb.image.write::func
               (:pointer %stb.image.write::write-func))
              (%stb.image.write::context (:pointer :void))
              (%stb.image.write::w :int)
              (%stb.image.write::h :int)
              (%stb.image.write::comp :int)
              (%stb.image.write::data (:pointer :float)))

(cffi:defcfun ("stbi_write_jpg" %stb.image.write::write-jpg)
              :int
              (%stb.image.write::filename claw-utils:claw-string)
              (%stb.image.write::x :int)
              (%stb.image.write::y :int)
              (%stb.image.write::comp :int)
              (%stb.image.write::data (:pointer :void))
              (%stb.image.write::quality :int))

(cffi:defcfun ("stbi_write_jpg_to_func"
               %stb.image.write::write-jpg-to-func)
              :int
              (%stb.image.write::func
               (:pointer %stb.image.write::write-func))
              (%stb.image.write::context (:pointer :void))
              (%stb.image.write::x :int)
              (%stb.image.write::y :int)
              (%stb.image.write::comp :int)
              (%stb.image.write::data (:pointer :void))
              (%stb.image.write::quality :int))

(cffi:defcfun ("stbi_write_png" %stb.image.write::write-png)
              :int
              (%stb.image.write::filename claw-utils:claw-string)
              (%stb.image.write::w :int)
              (%stb.image.write::h :int)
              (%stb.image.write::comp :int)
              (%stb.image.write::data (:pointer :void))
              (%stb.image.write::stride-in-bytes :int))

(cffi:defcfun ("stbi_write_png_to_func"
               %stb.image.write::write-png-to-func)
              :int
              (%stb.image.write::func
               (:pointer %stb.image.write::write-func))
              (%stb.image.write::context (:pointer :void))
              (%stb.image.write::w :int)
              (%stb.image.write::h :int)
              (%stb.image.write::comp :int)
              (%stb.image.write::data (:pointer :void))
              (%stb.image.write::stride-in-bytes :int))

(cffi:defcfun ("stbi_write_png_to_mem"
               %stb.image.write::write-png-to-mem)
              (:pointer :unsigned-char)
              (%stb.image.write::pixels (:pointer :unsigned-char))
              (%stb.image.write::stride-bytes :int)
              (%stb.image.write::x :int)
              (%stb.image.write::y :int)
              (%stb.image.write::n :int)
              (%stb.image.write::out-len (:pointer :int)))

(cffi:defcfun ("stbi_write_tga" %stb.image.write::write-tga)
              :int
              (%stb.image.write::filename claw-utils:claw-string)
              (%stb.image.write::w :int)
              (%stb.image.write::h :int)
              (%stb.image.write::comp :int)
              (%stb.image.write::data (:pointer :void)))

(cffi:defcfun ("stbi_write_tga_to_func"
               %stb.image.write::write-tga-to-func)
              :int
              (%stb.image.write::func
               (:pointer %stb.image.write::write-func))
              (%stb.image.write::context (:pointer :void))
              (%stb.image.write::w :int)
              (%stb.image.write::h :int)
              (%stb.image.write::comp :int)
              (%stb.image.write::data (:pointer :void)))

(cffi:defcfun ("stbi_zlib_compress" %stb.image.write::zlib-compress)
              (:pointer :unsigned-char)
              (%stb.image.write::data (:pointer :unsigned-char))
              (%stb.image.write::data-len :int)
              (%stb.image.write::out-len (:pointer :int))
              (%stb.image.write::quality :int))

(cffi:defcstruct (%stb.image.write::|C:@SA@STBI--WRITE-CONTEXT| :size
                  88)
                 (%stb.image.write::func
                  (:pointer %stb.image.write::write-func) :offset 0)
                 (%stb.image.write::context (:pointer :void) :offset
                  8)
                 (%stb.image.write::buffer :unsigned-char :count 64
                  :offset 16)
                 (%stb.image.write::buf-used :int :offset 80))

(cffi:defctype %stb.image.write::%write-context
               (:struct
                %stb.image.write::|C:@SA@STBI--WRITE-CONTEXT|))

(define-symbol-macro
  %stb.image.write::*write-force-png-filter*
  (let ((%stb.image.write::ptr
         (cffi:foreign-symbol-pointer
           "stbi_write_force_png_filter")))
    (when %stb.image.write::ptr
      (cffi:mem-ref %stb.image.write::ptr ':int))))

(define-symbol-macro
  %stb.image.write::*write-png-compression-level*
  (let ((%stb.image.write::ptr
         (cffi:foreign-symbol-pointer
           "stbi_write_png_compression_level")))
    (when %stb.image.write::ptr
      (cffi:mem-ref %stb.image.write::ptr ':int))))

(define-symbol-macro
  %stb.image.write::*write-tga-with-rle*
  (let ((%stb.image.write::ptr
         (cffi:foreign-symbol-pointer "stbi_write_tga_with_rle")))
    (when %stb.image.write::ptr
      (cffi:mem-ref %stb.image.write::ptr ':int))))

(cffi:defcfun ("stbi__end_write_file"
               %stb.image.write::%end-write-file)
              :void
              (%stb.image.write::s
               (:pointer %stb.image.write::%write-context)))

(cffi:defcfun ("stbi__start_write_callbacks"
               %stb.image.write::%start-write-callbacks)
              :void
              (%stb.image.write::s
               (:pointer %stb.image.write::%write-context))
              (%stb.image.write::c
               (:pointer %stb.image.write::write-func))
              (%stb.image.write::context (:pointer :void)))

(cffi:defcfun ("stbi__start_write_file"
               %stb.image.write::%start-write-file)
              :int
              (%stb.image.write::s
               (:pointer %stb.image.write::%write-context))
              (%stb.image.write::filename claw-utils:claw-string))

(cffi:defcfun ("stbi__stdio_write" %stb.image.write::%stdio-write)
              :void
              (%stb.image.write::context (:pointer :void))
              (%stb.image.write::data (:pointer :void))
              (%stb.image.write::size :int))

(cffi:defcfun ("stbi_write_bmp_core"
               %stb.image.write::write-bmp-core)
              :int
              (%stb.image.write::s
               (:pointer %stb.image.write::%write-context))
              (%stb.image.write::x :int)
              (%stb.image.write::y :int)
              (%stb.image.write::comp :int)
              (%stb.image.write::data (:pointer :void)))

(cffi:defcfun ("stbi_write_hdr_core"
               %stb.image.write::write-hdr-core)
              :int
              (%stb.image.write::s
               (:pointer %stb.image.write::%write-context))
              (%stb.image.write::x :int)
              (%stb.image.write::y :int)
              (%stb.image.write::comp :int)
              (%stb.image.write::data (:pointer :float)))

(cffi:defcfun ("stbi_write_jpg_core"
               %stb.image.write::write-jpg-core)
              :int
              (%stb.image.write::s
               (:pointer %stb.image.write::%write-context))
              (%stb.image.write::width :int)
              (%stb.image.write::height :int)
              (%stb.image.write::comp :int)
              (%stb.image.write::data (:pointer :void))
              (%stb.image.write::quality :int))

(cffi:defcfun ("stbi_write_tga_core"
               %stb.image.write::write-tga-core)
              :int
              (%stb.image.write::s
               (:pointer %stb.image.write::%write-context))
              (%stb.image.write::x :int)
              (%stb.image.write::y :int)
              (%stb.image.write::comp :int)
              (%stb.image.write::data (:pointer :void)))

(defparameter %stb.image.write::*%flip-vertically-on-write* 0)

(eval-when (:load-toplevel :compile-toplevel :execute)
  (export '%stb.image.write::write-png-to-func "%STB.IMAGE.WRITE")
  (export '%stb.image.write::write-bmp-core "%STB.IMAGE.WRITE")
  (export '%stb.image.write::write-bmp "%STB.IMAGE.WRITE")
  (export '%stb.image.write::%stdio-write "%STB.IMAGE.WRITE")
  (export '%stb.image.write::%start-write-callbacks
          "%STB.IMAGE.WRITE")
  (export '%stb.image.write::write-jpg "%STB.IMAGE.WRITE")
  (export '%stb.image.write::*write-png-compression-level*
          "%STB.IMAGE.WRITE")
  (export '%stb.image.write::write-tga-core "%STB.IMAGE.WRITE")
  (export '%stb.image.write::buf-used "%STB.IMAGE.WRITE")
  (export '%stb.image.write::*%flip-vertically-on-write*
          "%STB.IMAGE.WRITE")
  (export '%stb.image.write::write-hdr-core "%STB.IMAGE.WRITE")
  (export '%stb.image.write::write-tga-to-func "%STB.IMAGE.WRITE")
  (export '%stb.image.write::write-jpg-core "%STB.IMAGE.WRITE")
  (export '%stb.image.write::func "%STB.IMAGE.WRITE")
  (export '%stb.image.write::write-png "%STB.IMAGE.WRITE")
  (export '%stb.image.write::*write-tga-with-rle* "%STB.IMAGE.WRITE")
  (export '%stb.image.write::*write-force-png-filter*
          "%STB.IMAGE.WRITE")
  (export '%stb.image.write::context "%STB.IMAGE.WRITE")
  (export '%stb.image.write::write-jpg-to-func "%STB.IMAGE.WRITE")
  (export '%stb.image.write::%write-context "%STB.IMAGE.WRITE")
  (export '%stb.image.write::|C:@SA@STBI--WRITE-CONTEXT|
          "%STB.IMAGE.WRITE")
  (export '%stb.image.write::write-tga "%STB.IMAGE.WRITE")
  (export '%stb.image.write::write-bmp-to-func "%STB.IMAGE.WRITE")
  (export '%stb.image.write::zlib-compress "%STB.IMAGE.WRITE")
  (export '%stb.image.write::write-hdr "%STB.IMAGE.WRITE")
  (export '%stb.image.write::%end-write-file "%STB.IMAGE.WRITE")
  (export '%stb.image.write::write-hdr-to-func "%STB.IMAGE.WRITE")
  (export '%stb.image.write::buffer "%STB.IMAGE.WRITE")
  (export '%stb.image.write::flip-vertically-on-write
          "%STB.IMAGE.WRITE")
  (export '%stb.image.write::%start-write-file "%STB.IMAGE.WRITE")
  (export '%stb.image.write::write-func "%STB.IMAGE.WRITE")
  (export '%stb.image.write::write-png-to-mem "%STB.IMAGE.WRITE"))

