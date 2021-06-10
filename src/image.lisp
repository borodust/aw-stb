(uiop:define-package :stb.image
  (:use :cl))
(cl:in-package :stb.image)

(claw.wrapper:defwrapper (:aw-stb/image/wrapper
                          (:system aw-stb/wrapper)
                          (:headers "stb_image.h")
                          (:defines "STB_IMAGE_IMPLEMENTATION" 1)
                          (:includes :stb-includes)
                          (:intrinsics :sse42 :avx)
                          (:targets ((:and :x86-64 :linux) "x86_64-pc-linux-gnu")
                                    ((:and :aarch64 :android) "aarch64-linux-android"))
                          (:persistent :aw-stb-image-bindings
                           :asd-path "../aw-stb-image-bindings.asd"
                           :bindings-path "../bindings/image/"
                           :depends-on (:claw-utils))
                          (:language :c)
                          (:include-definitions "stbi_\\w*" "STBI_\\w*"))
  :in-package :%stb.image
  :trim-enum-prefix t
  :recognize-bitfields t
  :recognize-strings t
  :with-adapter (:static
                 :path "lib/image_adapter.c")
  :override-types ((:string claw-utils:claw-string)
                   (:pointer claw-utils:claw-pointer))
  :symbolicate-names (:in-pipeline
                      (:by-removing-prefixes "STBI_" "stbi_")))
