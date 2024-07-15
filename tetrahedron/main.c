#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

void window_callback(GLFWwindow * window, int width, int height);
GLFWwindow * create_gl_context();
unsigned int get_shader_program();

const char *vertex_source = "#version 330 core\n"
    "layout (location = 0) in vec3 aPos;\n"
    "out vec4 localColor;\n"
    "void main()\n"
    "{\n"
    "gl_Position = vec4(aPos , 1.0);\n"
    "localColor = vec4(aPos.x, aPos.y,1,1.0);\n"
    "}\0";

const char *fragment_source = "#version 330 core\n"
    "out vec4 FragColor;\n"
    "in vec4 localColor;\n"
    "void main()\n"
    "{\n"
    "FragColor = localColor;\n"
    "}\0";

int main() {

	GLFWwindow * window = create_gl_context();

	//step 1: get a triangle going!	
	float vertices [] = {-0.5f, -0.5f, 0.0, 0.5f, -0.5f, 0.0, 0.0f,  0.5f, 0.0};
	unsigned int indices [] = {0,1,2};

	//not making the VAO mistake again 
	unsigned int VAO;
	glGenVertexArrays(1,&VAO);	
	glBindVertexArray(VAO);

	//VBO -> where the actual data goes 
	unsigned int VBO;
	glGenBuffers(1, &VBO);
	glBindBuffer(GL_ARRAY_BUFFER,VBO);
	glBufferData(GL_ARRAY_BUFFER,sizeof(vertices),vertices,GL_STATIC_DRAW);

	//want to draw based on indices instead of triangles 
	unsigned int EBO;
	glGenBuffers(1, &EBO);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);

	//get gl to interpret the vbo correctly 
	glVertexAttribPointer(0,3,GL_FLOAT,GL_FALSE,3*(sizeof(float)),(void *) 0);
	glEnableVertexAttribArray(0);

	unsigned int shader_program = get_shader_program();

	while(!glfwWindowShouldClose(window)) {
		glfwPollEvents();
		glClearColor(0.7, 0, 0.2, 0.4);
		glClear(GL_COLOR_BUFFER_BIT);

		glBindVertexArray(VAO);
		glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,EBO);
		glDrawElements(GL_TRIANGLES,3,GL_UNSIGNED_INT, 0);
		glUseProgram(shader_program);

		glfwSwapBuffers(window);
	}
	
}

void window_callback(GLFWwindow * window, int width, int height) {
	glViewport(0,0, width, height);
}

GLFWwindow * create_gl_context() {
	//step 1: Get a window set up
	glfwInit();

	//how you want the window to be created
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

	//create the window and actually bind it so things can be set up
	GLFWwindow * window = glfwCreateWindow(1920, 1080, "Tetrahedron", NULL, NULL);
	glfwMakeContextCurrent(window);

	//set up window features
	glfwSetFramebufferSizeCallback(window, window_callback);
	glfwPollEvents();
	glViewport(0, 0, 1920, 1080);

	glewExperimental = GL_TRUE;
	glewInit();

	return window;
}

unsigned int get_shader_program() {
	int success;

	unsigned int vertex_shader;
	vertex_shader = glCreateShader(GL_VERTEX_SHADER);
	glShaderSource(vertex_shader,1,&vertex_source,0);
	glCompileShader(vertex_shader);
	glGetShaderiv(vertex_shader,GL_COMPILE_STATUS,&success);	
	assert(success);
	
	unsigned int fragment_shader;
	fragment_shader = glCreateShader(GL_FRAGMENT_SHADER);
	glShaderSource(fragment_shader,1,&fragment_source,0);
	glCompileShader(fragment_shader);
	glGetShaderiv(fragment_shader,GL_COMPILE_STATUS,&success);	
	assert(success);
	
	unsigned int shader_program;
	shader_program = glCreateProgram();
	glAttachShader(shader_program,vertex_shader);
	glAttachShader(shader_program,fragment_shader);
	glLinkProgram(shader_program);

	glGetProgramiv(shader_program, GL_LINK_STATUS, &success);
	assert(success);

	glDeleteShader(fragment_shader);
	glDeleteShader(vertex_shader);

	return shader_program;
}
