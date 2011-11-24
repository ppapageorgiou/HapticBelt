; Auto-generated. Do not edit!


(cl:in-package ChapticBelt-msg)


;//! \htmlinclude data.msg.html

(cl:defclass <data> (roslisp-msg-protocol:ros-message)
  ((angle
    :reader angle
    :initarg :angle
    :type cl:integer
    :initform 0)
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass data (<data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ChapticBelt-msg:<data> is deprecated: use ChapticBelt-msg:data instead.")))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ChapticBelt-msg:angle-val is deprecated.  Use ChapticBelt-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ChapticBelt-msg:distance-val is deprecated.  Use ChapticBelt-msg:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <data>) ostream)
  "Serializes a message object of type '<data>"
  (cl:let* ((signed (cl:slot-value msg 'angle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <data>) istream)
  "Deserializes a message object of type '<data>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'angle) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<data>)))
  "Returns string type for a message object of type '<data>"
  "ChapticBelt/data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'data)))
  "Returns string type for a message object of type 'data"
  "ChapticBelt/data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<data>)))
  "Returns md5sum for a message object of type '<data>"
  "2b3030ca6b91bda74e68f5fcf33c93e2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'data)))
  "Returns md5sum for a message object of type 'data"
  "2b3030ca6b91bda74e68f5fcf33c93e2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<data>)))
  "Returns full string definition for message of type '<data>"
  (cl:format cl:nil "int32 angle~%float32 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'data)))
  "Returns full string definition for message of type 'data"
  (cl:format cl:nil "int32 angle~%float32 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <data>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <data>))
  "Converts a ROS message object to a list"
  (cl:list 'data
    (cl:cons ':angle (angle msg))
    (cl:cons ':distance (distance msg))
))
