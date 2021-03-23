#include <stdio.h>
#include <GLFW/glfw3.h>
#include <glad/gl.h>

void key_callback(GLFWwindow *window,
                  int key, int scancode,
                  int action, int mode)
{
    if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS)
        glfwSetWindowShouldClose(window, GL_TRUE);
}

int main()
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

    GLFWwindow *window = glfwCreateWindow(1920, 1080, "GLFW -> GLAD (OpenGL in C)", NULL, NULL);
    if (window == NULL)
    {
        printf("Failed to create window using GLFW\n");
        glfwTerminate();
        return -1;
    }
    glfwMakeContextCurrent(window);
    glfwSetKeyCallback(window, key_callback);

    int version = gladLoadGL(glfwGetProcAddress);
    if (version == 0)
    {
        printf("Failed to get OpenGL context\n");
        glfwTerminate();
        return -1;
    }
    printf("Loaded OpenGL v%d.%d\n",
           GLAD_VERSION_MAJOR(version),
           GLAD_VERSION_MINOR(version));

    while (!glfwWindowShouldClose(window))
    {
        glfwPollEvents();
        glClearColor(0.27f, 0.87f, 0.75f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT);

        glfwSwapBuffers(window);
    }

    glfwTerminate();
    return 0;
}
