(asdf:defsystem :aw-stb
  :description "Common Lisp bindings for STB library collection"
  :version "0.0.1"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:aw-stb/image :aw-stb/image-write))


(asdf:defsystem :aw-stb/image
  :description "Bindings for stb_image.h library"
  :version "0.0.1"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:aw-stb-image-bindings))


(asdf:defsystem :aw-stb/image-write
  :description "Bindigns for stb_image_write.h library"
  :version "0.0.1"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:aw-stb-image-write-bindings))


(asdf:defsystem :aw-stb/wrapper
  :description "Wrapper generator for stb library collection"
  :version "0.0.1"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:claw-utils :claw)
  :serial t
  :components ((:file "src/image")
               (:file "src/image-write")
               (:module :stb-includes :pathname "src/lib/stb/")))
