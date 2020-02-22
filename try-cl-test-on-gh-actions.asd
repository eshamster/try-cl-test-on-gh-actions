#|
  This file is a part of try-cl-test-on-gh-actions project.

  These codes are licensed under CC0.
  http://creativecommons.org/publicdomain/zero/1.0/deed.ja
|#

(defsystem try-cl-test-on-gh-actions
  :version "0.1"
  :class :package-inferred-system
  :author "eshamster"
  :license "CC0"
  :depends-on ()
  :description "try-cl-test-on-gh-actions is a test project to run test in docker on Travis.CI"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op try-cl-test-on-gh-actions/t))))

(defsystem try-cl-test-on-gh-actions/t
  :class :package-inferred-system
  :depends-on (:rove
               "try-cl-test-on-gh-actions/t/test")
  :perform (test-op (o c) (symbol-call :rove '#:run c)))
