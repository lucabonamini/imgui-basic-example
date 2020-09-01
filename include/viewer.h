#ifndef _IMGUI_BASE_EXAMPLE_H_
#define _IMGUI_BASE_EXAMPLE_H_

#include <iostream>
#include <fstream>
#include <string>
#include <numeric>

#include <imgui/imgui.h>

using namespace std;

class GLFWwindow;

class Viewer {

    public:

        Viewer();
        ~Viewer();

        void run();

    private:

        GLFWwindow* window;

};

#endif