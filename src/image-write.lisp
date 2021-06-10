(uiop:define-package :stb.image.write
  (:use :cl))
(cl:in-package :stb.image.write)

(claw.wrapper:defwrapper (:aw-stb/image-write/wrapper
                          (:system aw-stb/wrapper)
                          (:headers "stb_image_write.h")
                          (:defines "STB_IMAGE_WRITE_IMPLEMENTATION" 1)
                          (:includes :stb-includes)
                          (:intrinsics :sse42 :avx)
                          (:targets ((:and :x86-64 :linux) "x86_64-pc-linux-gnu")
                                    ((:and :aarch64 :android) "aarch64-linux-android"))
                          (:persistent :aw-stb-image-write-bindings
                           :asd-path "../aw-stb-image-write-bindings.asd"
                           :bindings-path "../bindings/image-write/"
                           :depends-on (:claw-utils))
                          (:language :c)
                          (:include-definitions "stbi_\\w*" "STBIW_\\w*"))
  :in-package :%stb.image.write
  :trim-enum-prefix t
  :recognize-bitfields t
  :recognize-strings t
  :with-adapter (:static
                 :path "lib/image_write_adapter.c")
  :override-types ((:string claw-utils:claw-string)
                   (:pointer claw-utils:claw-pointer))
  :symbolicate-names (:in-pipeline
                      (:by-removing-prefixes "STBIW_" "stbi_")))
