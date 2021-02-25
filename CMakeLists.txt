cmake_minimum_required(VERSION 3.0.0)
project(imgui-basic-example CXX C)

add_compile_options(-std=c++14)
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

if ((NOT "${CMAKE_SYSTEM_NAME}" STREQUAL "Linux"))
    message(FATAL_ERROR "Only Linux OSs are supported.")
endif()

# Build options.
option(BUILD_ILQPLANNER_TESTS "Build tests" OFF)

set(CMAKE_CXX_FLAGS "-Wall")
set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DIMGUI_IMPL_OPENGL_LOADER_GL3W")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DIMGUI_IMPL_OPENGL_LOADER_GL3W")

include(cmake/Dependencies.cmake)

# Find and build third party libraries.
add_subdirectory(external)

# Set the build type. Default to Release mode.
if(NOT CMAKE_BUILD_TYPE)
  message("Defaulting to building targets in Release mode.")
  set(CMAKE_BUILD_TYPE Release)
endif(NOT CMAKE_BUILD_TYPE)

# List of dependent sources in src/*.cc
list(APPEND SRCS
    src/viewer.cpp
)

add_executable(${CMAKE_PROJECT_NAME} 
    src/main.cpp ${SRCS})

# target_compile_definitions(${CMAKE_PROJECT_NAME}  PUBLIC IMGUI_IMPL_OPENGL_LOADER_GL3W)
message("${imgui_SOURCE_DIR}")

# Add the source directories to the search path so cmake can find our headers.
target_include_directories(${CMAKE_PROJECT_NAME}
    PUBLIC ${CMAKE_SOURCE_DIR}/include
    PUBLIC ${imgui_SOURCE_DIR}/include
    PUBLIC "${PROJECT_SOURCE_DIR}/external/progress/include"
)

target_link_libraries(${CMAKE_PROJECT_NAME} 
    glfw 
    ${GLFW_LIBRARIES} 
    ${X11_LIBRARIES} 
    ${OPENGL_LIBRARIES}
    ${GLUT_LIBRARIES}
    imgui
)

