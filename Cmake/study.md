

Breakdown:

    add_subdirectory(${IMGUI_DIR} ${CMAKE_BINARY_DIR}/imgui_build):
        This command adds a subdirectory to the CMake build process, meaning it tells CMake to process another CMakeLists.txt file located in the specified source directory (the first argument) and create an output build directory (the second argument).

    ${IMGUI_DIR}:
        This is a variable holding the path to the source directory where ImGui's source code is located. In this case, ${IMGUI_DIR} is set to the relative path ../imgui (as seen in your CMake configuration), which points to the ImGui directory.

    ${CMAKE_BINARY_DIR}/imgui_build:
        This refers to the build directory where ImGui will be compiled. ${CMAKE_BINARY_DIR} is a special variable that contains the path to the top-level build directory (where you run the cmake command).
        imgui_build is a subfolder inside the build directory where the build process for ImGui will happen. This is used to keep the build artifacts for ImGui separate from the main project build.


The add_subdirectory command essentially tells CMake to:

    Process the CMakeLists.txt file inside the ${IMGUI_DIR} (the ImGui source folder).
    Create a build directory imgui_build inside the top-level build folder (denoted by ${CMAKE_BINARY_DIR}).
    This keeps ImGui's build process isolated within its own subdirectory, ensuring that everything is compiled and linked properly.
    
    
    
cmake_minimum_required(VERSION 2.6)

project(visualizer)

set(IMGUI_DIR ../../imgui)
set(IMPLOT_DIR ../../implot)
set(SCV_DIR ../scv)

set(visualizer_SRCS
    main.cpp
    ${IMGUI_DIR}/imgui.cpp
    # ${IMGUI_DIR}/imgui_demo.cpp
    ${IMGUI_DIR}/imgui_draw.cpp
    ${IMGUI_DIR}/imgui_tables.cpp
    ${IMGUI_DIR}/imgui_widgets.cpp 
    ${IMGUI_DIR}/backends/imgui_impl_glfw.cpp
    ${IMGUI_DIR}/backends/imgui_impl_opengl2.cpp 
    # ${IMPLOT_DIR}/implot_demo.cpp
    ${IMPLOT_DIR}/implot.cpp
    ${IMPLOT_DIR}/implot_items.cpp
    ${SCV_DIR}/planner.cpp
    ${SCV_DIR}/vec3.cpp
)

include_directories (
    ${IMGUI_DIR}
    ${IMGUI_DIR}/backends
    ${IMPLOT_DIR}
    ${SCV_DIR}
)

add_executable(visualizer
    ${visualizer_SRCS}
)

find_package(OpenGL REQUIRED)  # Fix_link_libraries
find_package(PkgConfig REQUIRED)
pkg_check_modules(GLFW3 REQUIRED glfw3)

# Correct way to link libraries
target_link_libraries(visualizer OpenGL::GL GLU ${GLFW3_LIBRARIES})




plan to make this static




cnc@debian:~/Desktop/TEMP/gui/imgui-node-editor/examples/b$ 
cnc@debian:~/Desktop/TEMP/gui/imgui-node-editor/examples/b$ 
cnc@debian:~/Desktop/TEMP/gui/imgui-node-editor/examples/b$ make
Scanning dependencies of target imgui
[  3%] Building CXX object external/imgui/CMakeFiles/imgui.dir/imgui.cpp.o
[  6%] Building CXX object external/imgui/CMakeFiles/imgui.dir/imgui_demo.cpp.o
[  9%] Building CXX object external/imgui/CMakeFiles/imgui.dir/imgui_draw.cpp.o
[ 12%] Building CXX object external/imgui/CMakeFiles/imgui.dir/imgui_widgets.cpp.o
[ 15%] Building CXX object external/imgui/CMakeFiles/imgui.dir/imgui_tables.cpp.o
[ 18%] Linking CXX static library libimgui.a
[ 18%] Built target imgui
Scanning dependencies of target application
[ 21%] Building CXX object application/CMakeFiles/application.dir/source/application.cpp.o
[ 24%] Building CXX object application/CMakeFiles/application.dir/source/entry_point.cpp.o
[ 27%] Building CXX object application/CMakeFiles/application.dir/source/platform_win32.cpp.o
[ 30%] Building CXX object application/CMakeFiles/application.dir/source/platform_glfw.cpp.o
[ 33%] Building CXX object application/CMakeFiles/application.dir/source/renderer_dx11.cpp.o
[ 36%] Building CXX object application/CMakeFiles/application.dir/source/renderer_ogl3.cpp.o
[ 39%] Building CXX object application/CMakeFiles/application.dir/source/imgui_impl_opengl3.cpp.o
[ 42%] Building CXX object application/CMakeFiles/application.dir/source/imgui_impl_glfw.cpp.o
[ 45%] Linking CXX static library libapplication.a
[ 45%] Built target application
Scanning dependencies of target canvas-example







learn cmake work??

https://github.com/thedmd/imgui-node-editor.git





