;; Auto-generated. Do not edit!


(when (boundp 'stdr_msgs::SoundSourceVector)
  (if (not (find-package "STDR_MSGS"))
    (make-package "STDR_MSGS"))
  (shadow 'SoundSourceVector (find-package "STDR_MSGS")))
(unless (find-package "STDR_MSGS::SOUNDSOURCEVECTOR")
  (make-package "STDR_MSGS::SOUNDSOURCEVECTOR"))

(in-package "ROS")
;;//! \htmlinclude SoundSourceVector.msg.html


(defclass stdr_msgs::SoundSourceVector
  :super ros::object
  :slots (_sound_sources ))

(defmethod stdr_msgs::SoundSourceVector
  (:init
   (&key
    ((:sound_sources __sound_sources) (let (r) (dotimes (i 0) (push (instance stdr_msgs::SoundSource :init) r)) r))
    )
   (send-super :init)
   (setq _sound_sources __sound_sources)
   self)
  (:sound_sources
   (&rest __sound_sources)
   (if (keywordp (car __sound_sources))
       (send* _sound_sources __sound_sources)
     (progn
       (if __sound_sources (setq _sound_sources (car __sound_sources)))
       _sound_sources)))
  (:serialization-length
   ()
   (+
    ;; stdr_msgs/SoundSource[] _sound_sources
    (apply #'+ (send-all _sound_sources :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; stdr_msgs/SoundSource[] _sound_sources
     (write-long (length _sound_sources) s)
     (dolist (elem _sound_sources)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; stdr_msgs/SoundSource[] _sound_sources
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sound_sources (let (r) (dotimes (i n) (push (instance stdr_msgs::SoundSource :init) r)) r))
     (dolist (elem- _sound_sources)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get stdr_msgs::SoundSourceVector :md5sum-) "b0990ed9e7eeb58876a06c8b484951b4")
(setf (get stdr_msgs::SoundSourceVector :datatype-) "stdr_msgs/SoundSourceVector")
(setf (get stdr_msgs::SoundSourceVector :definition-)
      "# Sound sources list
stdr_msgs/SoundSource[] sound_sources

================================================================================
MSG: stdr_msgs/SoundSource
# Source description

string id
float32 dbs

# sensor pose, relative to the map origin
geometry_msgs/Pose2D pose 

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta
")



(provide :stdr_msgs/SoundSourceVector "b0990ed9e7eeb58876a06c8b484951b4")


