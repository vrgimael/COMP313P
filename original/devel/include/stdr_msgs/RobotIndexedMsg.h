// Generated by gencpp from file stdr_msgs/RobotIndexedMsg.msg
// DO NOT EDIT!


#ifndef STDR_MSGS_MESSAGE_ROBOTINDEXEDMSG_H
#define STDR_MSGS_MESSAGE_ROBOTINDEXEDMSG_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <stdr_msgs/RobotMsg.h>

namespace stdr_msgs
{
template <class ContainerAllocator>
struct RobotIndexedMsg_
{
  typedef RobotIndexedMsg_<ContainerAllocator> Type;

  RobotIndexedMsg_()
    : name()
    , robot()  {
    }
  RobotIndexedMsg_(const ContainerAllocator& _alloc)
    : name(_alloc)
    , robot(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _name_type;
  _name_type name;

   typedef  ::stdr_msgs::RobotMsg_<ContainerAllocator>  _robot_type;
  _robot_type robot;





  typedef boost::shared_ptr< ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator> const> ConstPtr;

}; // struct RobotIndexedMsg_

typedef ::stdr_msgs::RobotIndexedMsg_<std::allocator<void> > RobotIndexedMsg;

typedef boost::shared_ptr< ::stdr_msgs::RobotIndexedMsg > RobotIndexedMsgPtr;
typedef boost::shared_ptr< ::stdr_msgs::RobotIndexedMsg const> RobotIndexedMsgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace stdr_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'nav_msgs': ['/opt/ros/kinetic/share/nav_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'stdr_msgs': ['/home/victor/COMP313P/original/src/comp313p/stdr_simulator/stdr_msgs/msg', '/home/victor/COMP313P/original/devel/share/stdr_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f74cd2b918be4e39c8fb0e1bebbbf480";
  }

  static const char* value(const ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf74cd2b918be4e39ULL;
  static const uint64_t static_value2 = 0xc8fb0e1bebbbf480ULL;
};

template<class ContainerAllocator>
struct DataType< ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "stdr_msgs/RobotIndexedMsg";
  }

  static const char* value(const ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string name\n\
stdr_msgs/RobotMsg robot\n\
\n\
================================================================================\n\
MSG: stdr_msgs/RobotMsg\n\
geometry_msgs/Pose2D initialPose\n\
\n\
stdr_msgs/FootprintMsg footprint\n\
\n\
stdr_msgs/LaserSensorMsg[] laserSensors\n\
stdr_msgs/SonarSensorMsg[] sonarSensors\n\
stdr_msgs/RfidSensorMsg[] rfidSensors\n\
stdr_msgs/CO2SensorMsg[] co2Sensors\n\
stdr_msgs/SoundSensorMsg[] soundSensors\n\
stdr_msgs/ThermalSensorMsg[] thermalSensors\n\
\n\
stdr_msgs/KinematicMsg kinematicModel\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Pose2D\n\
# This expresses a position and orientation on a 2D manifold.\n\
\n\
float64 x\n\
float64 y\n\
float64 theta\n\
================================================================================\n\
MSG: stdr_msgs/FootprintMsg\n\
geometry_msgs/Point[] points\n\
float32 radius # for circular footprints\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
\n\
================================================================================\n\
MSG: stdr_msgs/LaserSensorMsg\n\
# Laser Sensor description\n\
float32 maxAngle\n\
float32 minAngle\n\
float32 maxRange\n\
float32 minRange\n\
int32 numRays\n\
\n\
stdr_msgs/Noise noise\n\
\n\
float32 frequency\n\
\n\
string frame_id\n\
geometry_msgs/Pose2D pose # sensor pose, relative to robot center\n\
\n\
================================================================================\n\
MSG: stdr_msgs/Noise\n\
bool noise\n\
float32 noiseMean\n\
float32 noiseStd\n\
\n\
================================================================================\n\
MSG: stdr_msgs/SonarSensorMsg\n\
# Rfid sensor description\n\
float32 maxRange\n\
float32 minRange\n\
float32 coneAngle\n\
\n\
float32 frequency\n\
stdr_msgs/Noise noise\n\
\n\
string frame_id\n\
geometry_msgs/Pose2D pose # sensor pose, relative to robot center\n\
\n\
================================================================================\n\
MSG: stdr_msgs/RfidSensorMsg\n\
# Rfid sensor description\n\
float32 maxRange\n\
float32 angleSpan\n\
float32 signalCutoff\n\
\n\
float32 frequency\n\
\n\
string frame_id\n\
geometry_msgs/Pose2D pose # sensor pose, relative to robot center\n\
\n\
================================================================================\n\
MSG: stdr_msgs/CO2SensorMsg\n\
# Sensor description\n\
\n\
float32 maxRange\n\
float32 frequency\n\
string frame_id\n\
\n\
# sensor pose, relative to robot center\n\
geometry_msgs/Pose2D pose \n\
\n\
================================================================================\n\
MSG: stdr_msgs/SoundSensorMsg\n\
# Sensor description\n\
\n\
float32 maxRange\n\
float32 frequency\n\
float32 angleSpan\n\
string frame_id\n\
\n\
# sensor pose, relative to robot center\n\
geometry_msgs/Pose2D pose \n\
\n\
================================================================================\n\
MSG: stdr_msgs/ThermalSensorMsg\n\
# Sensor description\n\
\n\
float32 maxRange\n\
float32 frequency\n\
float32 angleSpan\n\
string frame_id\n\
\n\
# sensor pose, relative to robot center\n\
geometry_msgs/Pose2D pose \n\
\n\
================================================================================\n\
MSG: stdr_msgs/KinematicMsg\n\
# Container for the kinematic model parameters. The parameters selected/\n\
# are quite general. For a more accurate motion model a per-kinematic model\n\
# approach should be followed.\n\
# Parameters are in the form a_C_D, where C is affected by D.\n\
# ux is the linear speed\n\
# uy is the lateral speed (for omni vehicles)\n\
# w is the angular speed\n\
# g is a cofficient that directly affects the angular speed\n\
# For more information check the MotionController::sampleVelocities function.\n\
\n\
string type\n\
float32 a_ux_ux\n\
float32 a_ux_uy\n\
float32 a_ux_w\n\
float32 a_uy_ux\n\
float32 a_uy_uy\n\
float32 a_uy_w\n\
float32 a_w_ux\n\
float32 a_w_uy\n\
float32 a_w_w\n\
float32 a_g_ux\n\
float32 a_g_uy\n\
float32 a_g_w\n\
";
  }

  static const char* value(const ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.name);
      stream.next(m.robot);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RobotIndexedMsg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::stdr_msgs::RobotIndexedMsg_<ContainerAllocator>& v)
  {
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name);
    s << indent << "robot: ";
    s << std::endl;
    Printer< ::stdr_msgs::RobotMsg_<ContainerAllocator> >::stream(s, indent + "  ", v.robot);
  }
};

} // namespace message_operations
} // namespace ros

#endif // STDR_MSGS_MESSAGE_ROBOTINDEXEDMSG_H
