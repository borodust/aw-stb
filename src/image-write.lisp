(cl:in-package :stb)

(cl:defpackage :%stb.image.write
  (:use))

(claw.wrapper:defwrapper (stb::claw-stb/image-write
                          (:headers "stb_image_write.h")
                          (:defines "STB_IMAGE_WRITE_IMPLEMENTATION" 1)
                          (:includes :stb-includes)
                          (:intrinsics :sse42 :avx)
                          (:targets :local)
                          (:persistent nil)
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


(defun build-image-write ()
  (claw.generator.common:build-adapter 'stb::claw-stb/image-write :target "image_write_adapter.so"))
