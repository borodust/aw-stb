(asdf:defsystem :claw-stb
  :description "Common system for stb library wrappers"
  :version "0.0.1"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:claw-utils :claw)
  :pathname "src/"
  :components ((:file "packages")))


(asdf:defsystem :claw-stb/image
  :description "Wrapper for stb_image.h library"
  :version "0.0.1"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:claw-stb)
  :pathname "src/"
  :serial t
  :components ((:file "image")
               (:module :stb-includes :pathname "lib/stb/")))


(asdf:defsystem :claw-stb/image-write
  :description "Wrapper for stb_image_write.h library"
  :version "0.0.1"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:claw-stb)
  :pathname "src/"
  :serial t
  :components ((:file "image-write")
               (:module :stb-includes :pathname "lib/stb/")))
