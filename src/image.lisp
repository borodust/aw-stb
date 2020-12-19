(cl:in-package :stb)

(cl:defpackage :%stb.image
  (:use))

(claw.wrapper:defwrapper (stb::claw-stb/image
                          (:headers "stb_image.h")
                          (:defines "STB_IMAGE_IMPLEMENTATION" 1)
                          (:includes :stb-includes)
                          (:intrinsics :sse42 :avx)
                          (:targets :local)
                          (:persistent nil)
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

(defun build-image ()
  (claw.generator.common:build-adapter 'stb::claw-stb/image :target "image_adapter.so"))
