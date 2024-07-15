#include <GL/glew.h>
#include <GLFW/glfw3.h>

#include "../cglm/include/cglm/affine.h"
#include "../cglm/include/cglm/cam.h"
#include "../cglm/include/cglm/affine-pre.h"
#include "../cglm/include/cglm/ivec2.h"
#include "../cglm/include/cglm/mat4.h"
#include "../cglm/include/cglm/types.h"
#include "../cglm/include/cglm/util.h"
#include "../cglm/include/cglm/vec3.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

void window_callback(GLFWwindow * window, int width, int height);
GLFWwindow * create_gl_context();
unsigned int get_shader_program();

const char *vertex_source = "#version 330 core\n"
    "layout (location = 0) in vec3 aPos;\n"
    "uniform mat4 transform;\n"
    "void main()\n"
    "{\n"
    "gl_Position = transform*vec4(aPos , 1.0);\n"
    "}\0";

const char *fragment_source = "#version 330 core\n"
    "out vec4 FragColor;\n"
    "uniform vec4 faceColor;\n"
    "void main()\n"
    "{\n"
    "FragColor = faceColor;\n"
    "}\0";

//the plan: Get cglm. Make the fragment shader take a uniform as input. Send a reasonable projection matrix as that input uniform. Once you know that rotation works, make the figure 3d. Keep in mind that you probably need at least two additional opnegl functions: First is to depth test, second is to use the good kind of projection

int main() {

	GLFWwindow * window = create_gl_context();

	//step 1: get a triangle going!	
	float vertices [] = {
		-0.5f,-0.5f, 0.0,
		0.5f, -0.5, 0.0,
		0.0f,  0.5f, 0.0,
		0.0f,  -0.5f, 0.5,
		1.0, 0, 0,
		-1.0, 0, 0};

	unsigned int indices [] = {0,1,2,1,3,2,2,0,3}; //this is unfortunately suss
	unsigned int indices2 [] = {1,3,2,2,0,3}; 
	unsigned int indices3 [] = {2,0,3}; 
	unsigned int indices4 [] = {4,5};

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
	
	unsigned int EBO2;
	glGenBuffers(1, &EBO2);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO2);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices2), indices2, GL_STATIC_DRAW);
	
	unsigned int EBO3;
	glGenBuffers(1, &EBO3);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO3);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices3), indices3, GL_STATIC_DRAW);

	//get gl to interpret the vbo correctly 
	glVertexAttribPointer(0,3,GL_FLOAT,GL_FALSE,3*(sizeof(float)),(void *) 0);
	glEnableVertexAttribArray(0);

	unsigned int shader_program = get_shader_program();

	//define the transformations you want and send them to the shader
	mat4 identity;
	glm_mat4_identity(identity);	
	glm_translate(identity, (vec3) {0,0,-0.5});

	int transform_location = glGetUniformLocation(shader_program, "transform");
	int color_location= glGetUniformLocation(shader_program, "faceColor");

	glUseProgram(shader_program);	

	glUniformMatrix4fv(transform_location, 1, GL_FALSE, (float *)identity); 
	glm_rotate(identity, glm_rad(150), (vec3) {0.0,1.0,0.0});
	glm_rotate(identity, glm_rad(20), (vec3) {0.0,0.0,1.0});
	float scale = 0.4;
	glm_scale_uni(identity, scale);

	glEnable(GL_DEPTH_TEST);


	while(!glfwWindowShouldClose(window)) {
		glfwPollEvents();
		glClearColor(0.7, 0, 0.2, 0.4);
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

		glBindVertexArray(VAO);
		glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,EBO);
		glUseProgram(shader_program);
	
		glUniformMatrix4fv(transform_location, 1, GL_FALSE, (float *)identity); 

		glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,EBO);
		glUniform4f(color_location, 0.0, 0.0, 1.0, 1.0);
		glDrawElements(GL_TRIANGLES,3,GL_UNSIGNED_INT, 0);

		glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,EBO2);
		glUniform4f(color_location, 0.0, 0.3, 0.7, 1.0);
		glDrawElements(GL_TRIANGLES,3,GL_UNSIGNED_INT, 0);

		glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,EBO3);
		glUniform4f(color_location, 0.0, 0.7, 0.3, 1.0);
		glDrawElements(GL_TRIANGLES,3,GL_UNSIGNED_INT, 0);

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
