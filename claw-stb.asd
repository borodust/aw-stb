(asdf:defsystem :claw-stb
  :description "Common Lisp bindings for STB library collection"
  :version "0.0.1"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:claw-stb/image :claw-stb/image-write))


(asdf:defsystem :claw-stb/image
  :description "Bindings for stb_image.h library"
  :version "0.0.1"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:claw-stb-image-bindings))


(asdf:defsystem :claw-stb/image-write
  :description "Bindigns for stb_image_write.h library"
  :version "0.0.1"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:claw-stb-image-write-bindings))


(asdf:defsystem :claw-stb/wrapper
  :description "Wrapper generator for stb library collection"
  :version "0.0.1"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:claw-utils :claw)
  :pathname "src/"
  :serial t
  :components ((:file "image")
               (:file "image-write")
               (:module :stb-includes :pathname "lib/stb/")))
