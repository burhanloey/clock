(in-package :com.burhanloey.clock)

(defun create-alarm ()
  (let ((alarm-sound (new (-audio "../audio/alarm.mp3"))))
    (setf (getprop alarm-sound 'loop) t)
    alarm-sound))

(defvar alarm        (create-alarm))
(defvar walk-text    (chain document (get-element-by-id "walk")))
(defvar gotit-button (chain document (get-element-by-id "gotit")))
(defvar clock        (chain document (get-element-by-id "clock")))

(defun start-alarm ()
  (chain alarm (play))
  (setf (chain walk-text style visibility) "visible")
  (setf (chain gotit-button disabled) f))

(defun stop-alarm ()
  (chain alarm (pause))
  (setf (chain walk-text style visibility) "hidden")
  (setf (chain gotit-button disabled) t))

(defun pad-zero (x)
  (if (< x 10)
      (concatenate 'string "0" x)
      x))

(defun format-time (hours minutes seconds)
  (concatenate 'string (pad-zero hours) ":" (pad-zero minutes) ":" (pad-zero seconds)))

(defun update-time ()
  (let* ((now          (new (-date)))
         (hours        (chain now (get-hours)))
         (minutes      (chain now (get-minutes)))
         (seconds      (chain now (get-seconds)))
         (current-time (format-time hours minutes seconds)))
    (setf (getprop clock 'inner-h-t-m-l) current-time)
    (when (and (= 0 minutes)
               (= 0 seconds))
      (start-alarm))))

(update-time)

(set-interval update-time 1000)  ; 1 sec
