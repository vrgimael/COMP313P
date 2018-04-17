; Auto-generated. Do not edit!


(cl:in-package comp313p_mapper-msg)


;//! \htmlinclude MapUpdate.msg.html

(cl:defclass <MapUpdate> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (isPriorMap
    :reader isPriorMap
    :initarg :isPriorMap
    :type cl:boolean
    :initform cl:nil)
   (scale
    :reader scale
    :initarg :scale
    :type cl:float
    :initform 0.0)
   (extentInCells
    :reader extentInCells
    :initarg :extentInCells
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (resolution
    :reader resolution
    :initarg :resolution
    :type cl:float
    :initform 0.0)
   (occupancyGrid
    :reader occupancyGrid
    :initarg :occupancyGrid
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (deltaOccupancyGrid
    :reader deltaOccupancyGrid
    :initarg :deltaOccupancyGrid
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass MapUpdate (<MapUpdate>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapUpdate>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapUpdate)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name comp313p_mapper-msg:<MapUpdate> is deprecated: use comp313p_mapper-msg:MapUpdate instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MapUpdate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comp313p_mapper-msg:header-val is deprecated.  Use comp313p_mapper-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'isPriorMap-val :lambda-list '(m))
(cl:defmethod isPriorMap-val ((m <MapUpdate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comp313p_mapper-msg:isPriorMap-val is deprecated.  Use comp313p_mapper-msg:isPriorMap instead.")
  (isPriorMap m))

(cl:ensure-generic-function 'scale-val :lambda-list '(m))
(cl:defmethod scale-val ((m <MapUpdate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comp313p_mapper-msg:scale-val is deprecated.  Use comp313p_mapper-msg:scale instead.")
  (scale m))

(cl:ensure-generic-function 'extentInCells-val :lambda-list '(m))
(cl:defmethod extentInCells-val ((m <MapUpdate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comp313p_mapper-msg:extentInCells-val is deprecated.  Use comp313p_mapper-msg:extentInCells instead.")
  (extentInCells m))

(cl:ensure-generic-function 'resolution-val :lambda-list '(m))
(cl:defmethod resolution-val ((m <MapUpdate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comp313p_mapper-msg:resolution-val is deprecated.  Use comp313p_mapper-msg:resolution instead.")
  (resolution m))

(cl:ensure-generic-function 'occupancyGrid-val :lambda-list '(m))
(cl:defmethod occupancyGrid-val ((m <MapUpdate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comp313p_mapper-msg:occupancyGrid-val is deprecated.  Use comp313p_mapper-msg:occupancyGrid instead.")
  (occupancyGrid m))

(cl:ensure-generic-function 'deltaOccupancyGrid-val :lambda-list '(m))
(cl:defmethod deltaOccupancyGrid-val ((m <MapUpdate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comp313p_mapper-msg:deltaOccupancyGrid-val is deprecated.  Use comp313p_mapper-msg:deltaOccupancyGrid instead.")
  (deltaOccupancyGrid m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapUpdate>) ostream)
  "Serializes a message object of type '<MapUpdate>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'isPriorMap) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'scale))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'extentInCells))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'extentInCells))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'resolution))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'occupancyGrid))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'occupancyGrid))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'deltaOccupancyGrid))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'deltaOccupancyGrid))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapUpdate>) istream)
  "Deserializes a message object of type '<MapUpdate>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'isPriorMap) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'scale) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'extentInCells) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'extentInCells)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'resolution) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'occupancyGrid) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'occupancyGrid)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'deltaOccupancyGrid) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'deltaOccupancyGrid)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapUpdate>)))
  "Returns string type for a message object of type '<MapUpdate>"
  "comp313p_mapper/MapUpdate")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapUpdate)))
  "Returns string type for a message object of type 'MapUpdate"
  "comp313p_mapper/MapUpdate")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapUpdate>)))
  "Returns md5sum for a message object of type '<MapUpdate>"
  "bb9eab5859acbeac865abd611e41d4b8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapUpdate)))
  "Returns md5sum for a message object of type 'MapUpdate"
  "bb9eab5859acbeac865abd611e41d4b8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapUpdate>)))
  "Returns full string definition for message of type '<MapUpdate>"
  (cl:format cl:nil "Header header~%~%bool isPriorMap~%~%float32 scale~%int16[] extentInCells~%float32 resolution~%~%float32[] occupancyGrid~%float32[] deltaOccupancyGrid~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapUpdate)))
  "Returns full string definition for message of type 'MapUpdate"
  (cl:format cl:nil "Header header~%~%bool isPriorMap~%~%float32 scale~%int16[] extentInCells~%float32 resolution~%~%float32[] occupancyGrid~%float32[] deltaOccupancyGrid~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapUpdate>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'extentInCells) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'occupancyGrid) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'deltaOccupancyGrid) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapUpdate>))
  "Converts a ROS message object to a list"
  (cl:list 'MapUpdate
    (cl:cons ':header (header msg))
    (cl:cons ':isPriorMap (isPriorMap msg))
    (cl:cons ':scale (scale msg))
    (cl:cons ':extentInCells (extentInCells msg))
    (cl:cons ':resolution (resolution msg))
    (cl:cons ':occupancyGrid (occupancyGrid msg))
    (cl:cons ':deltaOccupancyGrid (deltaOccupancyGrid msg))
))
