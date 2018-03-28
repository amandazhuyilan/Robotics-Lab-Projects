# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(WARNING "Invoking generate_messages() without having added any message or service file before.
You should either add add_message_files() and/or add_service_files() calls or remove the invocation of generate_messages().")
message(STATUS "rtk_gps_pkg: 0 messages, 0 services")

set(MSG_I_FLAGS "-Inav_msgs:/opt/ros/kinetic/share/nav_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(rtk_gps_pkg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_cpp(rtk_gps_pkg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rtk_gps_pkg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(rtk_gps_pkg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(rtk_gps_pkg_generate_messages rtk_gps_pkg_generate_messages_cpp)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(rtk_gps_pkg_gencpp)
add_dependencies(rtk_gps_pkg_gencpp rtk_gps_pkg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rtk_gps_pkg_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_eus(rtk_gps_pkg
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rtk_gps_pkg
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(rtk_gps_pkg_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(rtk_gps_pkg_generate_messages rtk_gps_pkg_generate_messages_eus)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(rtk_gps_pkg_geneus)
add_dependencies(rtk_gps_pkg_geneus rtk_gps_pkg_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rtk_gps_pkg_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_lisp(rtk_gps_pkg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rtk_gps_pkg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(rtk_gps_pkg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(rtk_gps_pkg_generate_messages rtk_gps_pkg_generate_messages_lisp)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(rtk_gps_pkg_genlisp)
add_dependencies(rtk_gps_pkg_genlisp rtk_gps_pkg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rtk_gps_pkg_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_nodejs(rtk_gps_pkg
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rtk_gps_pkg
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(rtk_gps_pkg_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(rtk_gps_pkg_generate_messages rtk_gps_pkg_generate_messages_nodejs)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(rtk_gps_pkg_gennodejs)
add_dependencies(rtk_gps_pkg_gennodejs rtk_gps_pkg_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rtk_gps_pkg_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_py(rtk_gps_pkg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rtk_gps_pkg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(rtk_gps_pkg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(rtk_gps_pkg_generate_messages rtk_gps_pkg_generate_messages_py)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(rtk_gps_pkg_genpy)
add_dependencies(rtk_gps_pkg_genpy rtk_gps_pkg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rtk_gps_pkg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rtk_gps_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rtk_gps_pkg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(rtk_gps_pkg_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(rtk_gps_pkg_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rtk_gps_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rtk_gps_pkg
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(rtk_gps_pkg_generate_messages_eus nav_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(rtk_gps_pkg_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rtk_gps_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rtk_gps_pkg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(rtk_gps_pkg_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(rtk_gps_pkg_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rtk_gps_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rtk_gps_pkg
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(rtk_gps_pkg_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(rtk_gps_pkg_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rtk_gps_pkg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rtk_gps_pkg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rtk_gps_pkg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(rtk_gps_pkg_generate_messages_py nav_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(rtk_gps_pkg_generate_messages_py sensor_msgs_generate_messages_py)
endif()