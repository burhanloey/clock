(in-package :cl-user)

(defpackage :com.burhanloey.clock-asd
  (:use :cl :asdf))

(in-package :com.burhanloey.clock-asd)

(defsystem "com.burhanloey.clock"
  :description "A clock that will alarm for every hour at zero minute and zero second."
  :version "0.0.1"
  :author "Burhanuddin Baharuddin <burhan_loey@yahoo.com.my>"
  :licence "The Unlicense"
  :depends-on (:parenscript)
  :components ((:file "packages")
               (:file "transpiler" :depends-on ("packages"))))
