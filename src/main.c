#include <stdlib.h>
#include <stdio.h>
#include <GLFW/glfw3.h>
#include <glad/gl.h>

const int WIDTH = 1920;
const int HEIGHT = 1080;
int glVersion = 0;

GLFWwindow *mainWindow = NULL;

void key_callback(GLFWwindow *window,
                  int key, int scancode,
                  int action, int mode)
{
    /**
     * action:
     *  0: release
     *  1: down
     *  2: hold
     **/
    if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS)
        glfwSetWindowShouldClose(window, GL_TRUE);
}

void framebuffer_size_callback(GLFWwindow *window, int width, int height)
{
    glViewport(0, 0, width, height);
}

void init_main()
{
    glfwInit();
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 6);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    /**
     * if (mac)
     * {
     *      glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
     * }
     *
    **/

    mainWindow = glfwCreateWindow(WIDTH, HEIGHT, "GLFW -> GLAD (OpenGL in C)", NULL, NULL);
    if (mainWindow == NULL)
    {
        printf("Failed to create window using GLFW\n");
        glfwTerminate();
        abort();
    }
    glfwMakeContextCurrent(mainWindow);

    glVersion = gladLoadGL(glfwGetProcAddress);
    if (glVersion == 0)
    {
        printf("Failed to get OpenGL context\n");
        glfwTerminate();
        abort();
    }
    printf("Loaded OpenGL v%d.%d\n",
           GLAD_VERSION_MAJOR(glVersion),
           GLAD_VERSION_MINOR(glVersion));

    glfwSetKeyCallback(mainWindow, key_callback);
    glfwSetFramebufferSizeCallback(mainWindow, framebuffer_size_callback);
}

void close_main()
{
    glfwTerminate();
}

void draw_main()
{
    while (!glfwWindowShouldClose(mainWindow))
    {
        glfwPollEvents();
        glClearColor(0.27f, 0.87f, 0.75f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT);

        glfwSwapBuffers(mainWindow);
    }
}

int main()
{
    init_main();
    draw_main();

    close_main();
    return 0;
}
