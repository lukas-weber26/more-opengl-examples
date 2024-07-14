#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <assert.h>

const char *vertex_shader_source = "#version 330 core\n"
    "layout (location = 0) in vec3 aPos;\n"
    "out vec4 localColor;\n"
    "void main()\n"
    "{\n"
    "gl_Position = vec4(aPos, 1.0);\n"
    "localColor = vec4(aPos.x,aPos.y,1,1.0);\n"
    "}\0";

const char *fragment_shader_source = "#version 330 core\n"
    "out vec4 FragColor;\n"
    "in vec4 localColor;\n"
    "void main()\n"
    "{\n"
    "FragColor = localColor;\n"
    "}\0";

//const char *vertex_shader_source = "#version 330 core\n"
//    "layout (location = 0) in vec3 aPos;\n"
//    "void main()\n"
//    "{\n"
//    "gl_Position = vec4(aPos.x, aPos.y, aPos.z, 1.0);\n"
//    "}\0";
//
//const char *fragment_shader_source = "#version 330 core\n"
//    "out vec4 FragColor;\n"
//    "void main()\n"
//    "{\n"
//    "FragColor = vec4(1.0,0.5,0.2,1.0);\n"
//    "}\0";

void window_callback(GLFWwindow * window, int w, int h) {
	glViewport(0,0,w, h);
}

int main() {
	
	int width = 600;
	int height = 600;

	glfwInit();
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
	
	GLFWwindow * window = glfwCreateWindow(width, height, "Main", NULL, NULL);	
	glfwMakeContextCurrent(window);

	glfwSetFramebufferSizeCallback(window, window_callback);
	glfwPollEvents();
	glViewport(0, 0, width, height);
	
	//This needs to happen after a window is made.
	glewExperimental = GL_TRUE; 
	glewInit();

	float vertices[] = {-0.5,-0.5,0, 0.0, 0.5, 0.0, 0.5,-0.5,0.0}; 
	//float vertices[] = {-0.5,-0.5,0.0, 0.5,-0.5,0.0,0.0,0.5,0.0};
	
	unsigned int VAO;
	glGenVertexArrays(1,&VAO);	
	glBindVertexArray(VAO);

	unsigned int VBO;
	glGenBuffers(1,&VBO);
	glBindBuffer(GL_ARRAY_BUFFER,VBO); 
	glBufferData(GL_ARRAY_BUFFER,sizeof(vertices),vertices, GL_STATIC_DRAW); //this was probably the issue

	//wow I really forgot how unpleasant this whole thing is!
	
	unsigned int vertex_shader = glCreateShader(GL_VERTEX_SHADER);	
	glShaderSource(vertex_shader,1,&vertex_shader_source, 0);
	glCompileShader(vertex_shader);

	int success; 
	glGetShaderiv(vertex_shader,GL_COMPILE_STATUS,&success);
	assert(success == 1);
	
	unsigned int fragment_shader = glCreateShader(GL_FRAGMENT_SHADER);	
	glShaderSource(fragment_shader,1,&fragment_shader_source,0);
	glCompileShader(fragment_shader);
	
	glGetShaderiv(fragment_shader,GL_COMPILE_STATUS,&success);
	assert(success == 1);

	int program = glCreateProgram();
	glAttachShader(program,vertex_shader);	
	glAttachShader(program,fragment_shader);	
	glLinkProgram(program);

	glGetProgramiv(program, GL_LINK_STATUS, &success);
	assert(success == 1);

	glDeleteShader(vertex_shader);
	glDeleteShader(fragment_shader);
	
	glVertexAttribPointer(0,3,GL_FLOAT,GL_FALSE, 3*sizeof(float), (void *)0);
	glEnableVertexAttribArray(0);

	while (!glfwWindowShouldClose(window)) {

		glClearColor(0.1, 0.2, 0.3, 0.2);
		glClear(GL_COLOR_BUFFER_BIT);
	
		glUseProgram(program);
		glBindVertexArray(VAO);
		glDrawArrays(GL_TRIANGLES, 0, 3);

		glfwSwapBuffers(window); //this comand is a total bastard!
	}

	glfwDestroyWindow(window);
	glfwTerminate();
	return 1;

}

//learnings: Vertex arrays are weird because you never really use them but if they are not set up and bound everything breaks 

//vertex buffers are where things are actually stored, that's where all your data goes.
//interestingly, no one cares about these once they are bound. I guess that's because the vertex buffer is just allways used

//vertex attribs are things that need to be set. Stragely it seems like they point nowhere but they actually do. They just always act on the vertex buffer.




