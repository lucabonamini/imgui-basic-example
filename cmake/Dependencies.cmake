# Find Eigen.
find_package( Eigen3 REQUIRED )

# Find OpenGL.
find_package( OpenGL REQUIRED )
message("Found OpenGL: ${OPENGL_INCLUDE_DIR} --- ${OPENGL_LIBRARIES}")

# Find GLUT.
find_package( GLUT REQUIRED )

# Imgui
set(imgui_SOURCE_DIR ${CMAKE_SOURCE_DIR}/external/imgui)
include_directories(${CMAKE_SOURCE_DIR}/external)
include_directories(${imgui_SOURCE_DIR}/examples/libs/gl3w)
include_directories(${imgui_SOURCE_DIR})

find_package( OpenGL REQUIRED )
include_directories(SYSTEM ${OPENGL_INCLUDE_DIRS})

file(GLOB imgui_srcs ${imgui_SOURCE_DIR}/*.c*)
add_library(imgui ${imgui_srcs}
  ${imgui_SOURCE_DIR}/examples/imgui_impl_glfw.cpp
  ${imgui_SOURCE_DIR}/examples/imgui_impl_opengl3.cpp
  ${imgui_SOURCE_DIR}/examples/libs/gl3w/GL/gl3w.c)

message("IMGUI LIBS: ${imgui_LIBRARIES}")
target_link_libraries(imgui ${imgui_LIBRARIES} ${OPENGL_LIBRARIES})
