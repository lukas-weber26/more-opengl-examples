	.file	"main.c"
	.text
.Ltext0:
	.file 0 "/home/lweber/cprog/opengl_examples/triangle" "main.c"
	.globl	vertex_shader_source
	.section	.rodata
	.align 8
.LC0:
	.string	"#version 330 core\nlayout (location = 0) in vec3 aPos;\nout vec4 localColor;\nvoid main()\n{\ngl_Position = vec4(aPos, 1.0);\nlocalColor = vec4(aPos.x,aPos.y,1,1.0);\n}"
	.string	""
	.section	.data.rel.local,"aw"
	.align 8
	.type	vertex_shader_source, @object
	.size	vertex_shader_source, 8
vertex_shader_source:
	.quad	.LC0
	.globl	fragment_shader_source
	.section	.rodata
	.align 8
.LC1:
	.string	"#version 330 core\nout vec4 FragColor;\nin vec4 localColor;\nvoid main()\n{\nFragColor = localColor;\n}"
	.string	""
	.section	.data.rel.local
	.align 8
	.type	fragment_shader_source, @object
	.size	fragment_shader_source, 8
fragment_shader_source:
	.quad	.LC1
	.text
	.globl	window_callback
	.type	window_callback, @function
window_callback:
.LFB0:
	.file 1 "main.c"
	.loc 1 36 57
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	.loc 1 37 2
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	glViewport@PLT
	.loc 1 38 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	window_callback, .-window_callback
	.section	.rodata
.LC2:
	.string	"Main"
.LC6:
	.string	"main.c"
.LC7:
	.string	"success == 1"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.loc 1 40 12
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	.loc 1 40 12
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 42 6
	movl	$600, -76(%rbp)
	.loc 1 43 6
	movl	$600, -72(%rbp)
	.loc 1 45 2
	call	glfwInit@PLT
	.loc 1 46 2
	movl	$3, %esi
	movl	$139266, %edi
	call	glfwWindowHint@PLT
	.loc 1 47 2
	movl	$3, %esi
	movl	$139267, %edi
	call	glfwWindowHint@PLT
	.loc 1 48 2
	movl	$204801, %esi
	movl	$139272, %edi
	call	glfwWindowHint@PLT
	.loc 1 50 24
	movl	-72(%rbp), %esi
	movl	-76(%rbp), %eax
	movl	$0, %r8d
	movl	$0, %ecx
	leaq	.LC2(%rip), %rdx
	movl	%eax, %edi
	call	glfwCreateWindow@PLT
	movq	%rax, -56(%rbp)
	.loc 1 51 2
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	glfwMakeContextCurrent@PLT
	.loc 1 53 2
	movq	-56(%rbp), %rax
	leaq	window_callback(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	glfwSetFramebufferSizeCallback@PLT
	.loc 1 54 2
	call	glfwPollEvents@PLT
	.loc 1 55 2
	movl	-72(%rbp), %edx
	movl	-76(%rbp), %eax
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	glViewport@PLT
	.loc 1 58 19
	movb	$1, glewExperimental(%rip)
	.loc 1 59 2
	call	glewInit@PLT
	.loc 1 61 8
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, -48(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, -44(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -40(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -36(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, -32(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -28(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, -24(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, -20(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 65 2
	movq	__glewGenVertexArrays(%rip), %rdx
	leaq	-88(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	*%rdx
.LVL0:
	.loc 1 66 2
	movq	__glewBindVertexArray(%rip), %rdx
	movl	-88(%rbp), %eax
	movl	%eax, %edi
	call	*%rdx
.LVL1:
	.loc 1 69 2
	movq	__glewGenBuffers(%rip), %rdx
	leaq	-84(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	*%rdx
.LVL2:
	.loc 1 70 2
	movq	__glewBindBuffer(%rip), %rdx
	movl	-84(%rbp), %eax
	movl	%eax, %esi
	movl	$34962, %edi
	call	*%rdx
.LVL3:
	.loc 1 71 2
	movq	__glewBufferData(%rip), %r8
	leaq	-48(%rbp), %rax
	movl	$35044, %ecx
	movq	%rax, %rdx
	movl	$36, %esi
	movl	$34962, %edi
	call	*%r8
.LVL4:
	.loc 1 75 31
	movq	__glewCreateShader(%rip), %rax
	movl	$35633, %edi
	call	*%rax
.LVL5:
	movl	%eax, -68(%rbp)
	.loc 1 76 2
	movq	__glewShaderSource(%rip), %r8
	movl	-68(%rbp), %eax
	movl	$0, %ecx
	leaq	vertex_shader_source(%rip), %rdx
	movl	$1, %esi
	movl	%eax, %edi
	call	*%r8
.LVL6:
	.loc 1 77 2
	movq	__glewCompileShader(%rip), %rdx
	movl	-68(%rbp), %eax
	movl	%eax, %edi
	call	*%rdx
.LVL7:
	.loc 1 80 2
	movq	__glewGetShaderiv(%rip), %rcx
	leaq	-80(%rbp), %rdx
	movl	-68(%rbp), %eax
	movl	$35713, %esi
	movl	%eax, %edi
	call	*%rcx
.LVL8:
	.loc 1 81 2
	movl	-80(%rbp), %eax
	cmpl	$1, %eax
	je	.L3
	.loc 1 81 2 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax
	movq	%rax, %rcx
	movl	$81, %edx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L3:
	.loc 1 83 33 is_stmt 1
	movq	__glewCreateShader(%rip), %rax
	movl	$35632, %edi
	call	*%rax
.LVL9:
	movl	%eax, -64(%rbp)
	.loc 1 84 2
	movq	__glewShaderSource(%rip), %r8
	movl	-64(%rbp), %eax
	movl	$0, %ecx
	leaq	fragment_shader_source(%rip), %rdx
	movl	$1, %esi
	movl	%eax, %edi
	call	*%r8
.LVL10:
	.loc 1 85 2
	movq	__glewCompileShader(%rip), %rdx
	movl	-64(%rbp), %eax
	movl	%eax, %edi
	call	*%rdx
.LVL11:
	.loc 1 87 2
	movq	__glewGetShaderiv(%rip), %rcx
	leaq	-80(%rbp), %rdx
	movl	-64(%rbp), %eax
	movl	$35713, %esi
	movl	%eax, %edi
	call	*%rcx
.LVL12:
	.loc 1 88 2
	movl	-80(%rbp), %eax
	cmpl	$1, %eax
	je	.L4
	.loc 1 88 2 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax
	movq	%rax, %rcx
	movl	$88, %edx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L4:
	.loc 1 90 16 is_stmt 1
	movq	__glewCreateProgram(%rip), %rax
	call	*%rax
.LVL13:
	.loc 1 90 6 discriminator 1
	movl	%eax, -60(%rbp)
	.loc 1 91 2
	movq	__glewAttachShader(%rip), %rcx
	movl	-60(%rbp), %eax
	movl	-68(%rbp), %edx
	movl	%edx, %esi
	movl	%eax, %edi
	call	*%rcx
.LVL14:
	.loc 1 92 2
	movq	__glewAttachShader(%rip), %rcx
	movl	-60(%rbp), %eax
	movl	-64(%rbp), %edx
	movl	%edx, %esi
	movl	%eax, %edi
	call	*%rcx
.LVL15:
	.loc 1 93 2
	movq	__glewLinkProgram(%rip), %rdx
	movl	-60(%rbp), %eax
	movl	%eax, %edi
	call	*%rdx
.LVL16:
	.loc 1 95 2
	movq	__glewGetProgramiv(%rip), %rcx
	movl	-60(%rbp), %eax
	leaq	-80(%rbp), %rdx
	movl	$35714, %esi
	movl	%eax, %edi
	call	*%rcx
.LVL17:
	.loc 1 96 2
	movl	-80(%rbp), %eax
	cmpl	$1, %eax
	je	.L5
	.loc 1 96 2 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax
	movq	%rax, %rcx
	movl	$96, %edx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L5:
	.loc 1 98 2 is_stmt 1
	movq	__glewDeleteShader(%rip), %rdx
	movl	-68(%rbp), %eax
	movl	%eax, %edi
	call	*%rdx
.LVL18:
	.loc 1 99 2
	movq	__glewDeleteShader(%rip), %rdx
	movl	-64(%rbp), %eax
	movl	%eax, %edi
	call	*%rdx
.LVL19:
	.loc 1 101 2
	movq	__glewVertexAttribPointer(%rip), %rax
	movl	$0, %r9d
	movl	$12, %r8d
	movl	$0, %ecx
	movl	$5126, %edx
	movl	$3, %esi
	movl	$0, %edi
	call	*%rax
.LVL20:
	.loc 1 102 2
	movq	__glewEnableVertexAttribArray(%rip), %rax
	movl	$0, %edi
	call	*%rax
.LVL21:
	.loc 1 104 8
	jmp	.L6
.L7:
	.loc 1 106 3
	movss	.LC8(%rip), %xmm3
	movss	.LC9(%rip), %xmm2
	movss	.LC8(%rip), %xmm1
	movl	.LC10(%rip), %eax
	movd	%eax, %xmm0
	call	glClearColor@PLT
	.loc 1 107 3
	movl	$16384, %edi
	call	glClear@PLT
	.loc 1 109 3
	movq	__glewUseProgram(%rip), %rdx
	movl	-60(%rbp), %eax
	movl	%eax, %edi
	call	*%rdx
.LVL22:
	.loc 1 110 3
	movq	__glewBindVertexArray(%rip), %rdx
	movl	-88(%rbp), %eax
	movl	%eax, %edi
	call	*%rdx
.LVL23:
	.loc 1 111 3
	movl	$3, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	glDrawArrays@PLT
	.loc 1 113 3
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	glfwSwapBuffers@PLT
.L6:
	.loc 1 104 10
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	glfwWindowShouldClose@PLT
	.loc 1 104 9 discriminator 1
	testl	%eax, %eax
	je	.L7
	.loc 1 116 2
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	glfwDestroyWindow@PLT
	.loc 1 117 2
	call	glfwTerminate@PLT
	.loc 1 118 9
	movl	$1, %eax
	.loc 1 120 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 5
__PRETTY_FUNCTION__.0:
	.string	"main"
	.align 4
.LC3:
	.long	-1090519040
	.align 4
.LC5:
	.long	1056964608
	.align 4
.LC8:
	.long	1045220557
	.align 4
.LC9:
	.long	1050253722
	.align 4
.LC10:
	.long	1036831949
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-pc-linux-gnu/14.1.1/include/stddef.h"
	.file 3 "/usr/include/GL/glew.h"
	.file 4 "/usr/local/include/GLFW/glfw3.h"
	.file 5 "/usr/include/assert.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x6f6
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x13
	.long	.LASF88
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x14
	.long	.LASF12
	.byte	0x2
	.byte	0x91
	.byte	0x1a
	.long	0x3a
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x15
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF4
	.uleb128 0x5
	.byte	0x10
	.byte	0x4
	.long	.LASF5
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.long	.LASF8
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.long	.LASF10
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x9
	.long	0x80
	.uleb128 0x2
	.long	.LASF13
	.byte	0x3
	.value	0x122
	.byte	0x16
	.long	0x6b
	.uleb128 0x2
	.long	.LASF14
	.byte	0x3
	.value	0x123
	.byte	0x16
	.long	0x6b
	.uleb128 0x2
	.long	.LASF15
	.byte	0x3
	.value	0x124
	.byte	0x16
	.long	0x6b
	.uleb128 0x2
	.long	.LASF16
	.byte	0x3
	.value	0x125
	.byte	0xd
	.long	0x48
	.uleb128 0x9
	.long	0xb3
	.uleb128 0x2
	.long	.LASF17
	.byte	0x3
	.value	0x126
	.byte	0xd
	.long	0x48
	.uleb128 0x2
	.long	.LASF18
	.byte	0x3
	.value	0x127
	.byte	0x17
	.long	0x5d
	.uleb128 0x5
	.byte	0x4
	.byte	0x4
	.long	.LASF19
	.uleb128 0x2
	.long	.LASF20
	.byte	0x3
	.value	0x12e
	.byte	0xf
	.long	0xdf
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.long	.LASF21
	.uleb128 0x2
	.long	.LASF22
	.byte	0x3
	.value	0x143
	.byte	0xe
	.long	0x80
	.uleb128 0x9
	.long	0xfa
	.uleb128 0x3
	.long	0x111
	.uleb128 0x16
	.uleb128 0x3
	.long	0xc0
	.uleb128 0x2
	.long	.LASF23
	.byte	0x3
	.value	0x69e
	.byte	0x13
	.long	0x2e
	.uleb128 0x3
	.long	0x129
	.uleb128 0x6
	.long	0x139
	.uleb128 0x1
	.long	0x8c
	.uleb128 0x1
	.long	0xa6
	.byte	0
	.uleb128 0x2
	.long	.LASF24
	.byte	0x3
	.value	0x6a1
	.byte	0x1c
	.long	0x124
	.uleb128 0x2
	.long	.LASF25
	.byte	0x3
	.value	0x6a2
	.byte	0x1c
	.long	0x153
	.uleb128 0x3
	.long	0x158
	.uleb128 0x6
	.long	0x172
	.uleb128 0x1
	.long	0x8c
	.uleb128 0x1
	.long	0x117
	.uleb128 0x1
	.long	0x10c
	.uleb128 0x1
	.long	0x8c
	.byte	0
	.uleb128 0x2
	.long	.LASF26
	.byte	0x3
	.value	0x6a7
	.byte	0x1c
	.long	0x17f
	.uleb128 0x3
	.long	0x184
	.uleb128 0x6
	.long	0x194
	.uleb128 0x1
	.long	0xc5
	.uleb128 0x1
	.long	0x194
	.byte	0
	.uleb128 0x3
	.long	0xa6
	.uleb128 0x3
	.long	0xb3
	.uleb128 0x3
	.long	0x1a3
	.uleb128 0x6
	.long	0x1b8
	.uleb128 0x1
	.long	0xa6
	.uleb128 0x1
	.long	0x8c
	.uleb128 0x1
	.long	0x199
	.byte	0
	.uleb128 0x2
	.long	.LASF27
	.byte	0x3
	.value	0x726
	.byte	0x1c
	.long	0x1c5
	.uleb128 0x3
	.long	0x1ca
	.uleb128 0x6
	.long	0x1da
	.uleb128 0x1
	.long	0xa6
	.uleb128 0x1
	.long	0xa6
	.byte	0
	.uleb128 0x3
	.long	0x107
	.uleb128 0x9
	.long	0x1da
	.uleb128 0x2
	.long	.LASF28
	.byte	0x3
	.value	0x729
	.byte	0x1c
	.long	0x1f1
	.uleb128 0x3
	.long	0x1f6
	.uleb128 0x6
	.long	0x201
	.uleb128 0x1
	.long	0xa6
	.byte	0
	.uleb128 0x2
	.long	.LASF29
	.byte	0x3
	.value	0x72a
	.byte	0x1e
	.long	0x20e
	.uleb128 0x3
	.long	0x213
	.uleb128 0x17
	.long	0xa6
	.uleb128 0x2
	.long	.LASF30
	.byte	0x3
	.value	0x72b
	.byte	0x1e
	.long	0x225
	.uleb128 0x3
	.long	0x22a
	.uleb128 0x18
	.long	0xa6
	.long	0x239
	.uleb128 0x1
	.long	0x8c
	.byte	0
	.uleb128 0x2
	.long	.LASF31
	.byte	0x3
	.value	0x72d
	.byte	0x1c
	.long	0x1f1
	.uleb128 0x2
	.long	.LASF32
	.byte	0x3
	.value	0x731
	.byte	0x1c
	.long	0x1f1
	.uleb128 0x2
	.long	.LASF33
	.byte	0x3
	.value	0x737
	.byte	0x1c
	.long	0x19e
	.uleb128 0x2
	.long	.LASF34
	.byte	0x3
	.value	0x73a
	.byte	0x1c
	.long	0x19e
	.uleb128 0x2
	.long	.LASF35
	.byte	0x3
	.value	0x744
	.byte	0x1c
	.long	0x1f1
	.uleb128 0x2
	.long	.LASF36
	.byte	0x3
	.value	0x745
	.byte	0x1c
	.long	0x287
	.uleb128 0x3
	.long	0x28c
	.uleb128 0x6
	.long	0x2a6
	.uleb128 0x1
	.long	0xa6
	.uleb128 0x1
	.long	0xc5
	.uleb128 0x1
	.long	0x2a6
	.uleb128 0x1
	.long	0x112
	.byte	0
	.uleb128 0x3
	.long	0x1df
	.uleb128 0x2
	.long	.LASF37
	.byte	0x3
	.value	0x75c
	.byte	0x1c
	.long	0x1f1
	.uleb128 0x2
	.long	.LASF38
	.byte	0x3
	.value	0x782
	.byte	0x1c
	.long	0x2c5
	.uleb128 0x3
	.long	0x2ca
	.uleb128 0x6
	.long	0x2ee
	.uleb128 0x1
	.long	0xa6
	.uleb128 0x1
	.long	0xb3
	.uleb128 0x1
	.long	0x8c
	.uleb128 0x1
	.long	0xd2
	.uleb128 0x1
	.long	0xc5
	.uleb128 0x1
	.long	0x10c
	.byte	0
	.uleb128 0x2
	.long	.LASF39
	.byte	0x3
	.value	0x1eb8
	.byte	0x1c
	.long	0x1f1
	.uleb128 0x2
	.long	.LASF40
	.byte	0x3
	.value	0x1eba
	.byte	0x1c
	.long	0x17f
	.uleb128 0x4
	.long	.LASF41
	.value	0x576e
	.byte	0x25
	.long	0x139
	.uleb128 0x4
	.long	.LASF42
	.value	0x576f
	.byte	0x25
	.long	0x146
	.uleb128 0x4
	.long	.LASF43
	.value	0x5774
	.byte	0x25
	.long	0x172
	.uleb128 0x4
	.long	.LASF44
	.value	0x5781
	.byte	0x27
	.long	0x1b8
	.uleb128 0x4
	.long	.LASF45
	.value	0x5784
	.byte	0x28
	.long	0x1e4
	.uleb128 0x4
	.long	.LASF46
	.value	0x5785
	.byte	0x28
	.long	0x201
	.uleb128 0x4
	.long	.LASF47
	.value	0x5786
	.byte	0x27
	.long	0x218
	.uleb128 0x4
	.long	.LASF48
	.value	0x5788
	.byte	0x27
	.long	0x239
	.uleb128 0x4
	.long	.LASF49
	.value	0x578c
	.byte	0x32
	.long	0x246
	.uleb128 0x4
	.long	.LASF50
	.value	0x5792
	.byte	0x27
	.long	0x253
	.uleb128 0x4
	.long	.LASF51
	.value	0x5795
	.byte	0x26
	.long	0x260
	.uleb128 0x4
	.long	.LASF52
	.value	0x579f
	.byte	0x26
	.long	0x26d
	.uleb128 0x4
	.long	.LASF53
	.value	0x57a0
	.byte	0x27
	.long	0x27a
	.uleb128 0x4
	.long	.LASF54
	.value	0x57b7
	.byte	0x25
	.long	0x2ab
	.uleb128 0x4
	.long	.LASF55
	.value	0x57dd
	.byte	0x2e
	.long	0x2b8
	.uleb128 0x4
	.long	.LASF56
	.value	0x5b46
	.byte	0x2a
	.long	0x2ee
	.uleb128 0x4
	.long	.LASF57
	.value	0x5b48
	.byte	0x2a
	.long	0x2fb
	.uleb128 0x4
	.long	.LASF58
	.value	0x6720
	.byte	0x13
	.long	0xd2
	.uleb128 0x2
	.long	.LASF59
	.byte	0x4
	.value	0x56f
	.byte	0x1c
	.long	0x3ed
	.uleb128 0xb
	.long	.LASF59
	.uleb128 0x2
	.long	.LASF60
	.byte	0x4
	.value	0x57b
	.byte	0x1b
	.long	0x3ff
	.uleb128 0xb
	.long	.LASF60
	.uleb128 0x3
	.long	0x87
	.uleb128 0x3
	.long	0x40e
	.uleb128 0x6
	.long	0x423
	.uleb128 0x1
	.long	0x423
	.uleb128 0x1
	.long	0x48
	.uleb128 0x1
	.long	0x48
	.byte	0
	.uleb128 0x3
	.long	0x3f2
	.uleb128 0x2
	.long	.LASF61
	.byte	0x4
	.value	0x6df
	.byte	0x11
	.long	0x409
	.uleb128 0x3
	.long	0x3e0
	.uleb128 0xc
	.long	.LASF62
	.byte	0x5
	.long	0x404
	.uleb128 0x9
	.byte	0x3
	.quad	vertex_shader_source
	.uleb128 0xc
	.long	.LASF63
	.byte	0xe
	.long	0x404
	.uleb128 0x9
	.byte	0x3
	.quad	fragment_shader_source
	.uleb128 0xd
	.long	.LASF71
	.value	0x8ce
	.uleb128 0x7
	.long	.LASF64
	.byte	0x4
	.value	0xcc0
	.byte	0xe
	.long	0x47c
	.uleb128 0x1
	.long	0x423
	.byte	0
	.uleb128 0xa
	.long	.LASF69
	.value	0xcd4
	.byte	0xd
	.long	0x48
	.long	0x492
	.uleb128 0x1
	.long	0x423
	.byte	0
	.uleb128 0x7
	.long	.LASF65
	.byte	0x4
	.value	0x1814
	.byte	0xe
	.long	0x4a5
	.uleb128 0x1
	.long	0x423
	.byte	0
	.uleb128 0x7
	.long	.LASF66
	.byte	0x3
	.value	0x39f
	.byte	0x17
	.long	0x4c2
	.uleb128 0x1
	.long	0x8c
	.uleb128 0x1
	.long	0xb3
	.uleb128 0x1
	.long	0xc5
	.byte	0
	.uleb128 0x7
	.long	.LASF67
	.byte	0x3
	.value	0x368
	.byte	0x17
	.long	0x4d5
	.uleb128 0x1
	.long	0x99
	.byte	0
	.uleb128 0x7
	.long	.LASF68
	.byte	0x3
	.value	0x36a
	.byte	0x17
	.long	0x4f7
	.uleb128 0x1
	.long	0xe6
	.uleb128 0x1
	.long	0xe6
	.uleb128 0x1
	.long	0xe6
	.uleb128 0x1
	.long	0xe6
	.byte	0
	.uleb128 0x19
	.long	.LASF70
	.byte	0x5
	.byte	0x43
	.byte	0xd
	.long	0x518
	.uleb128 0x1
	.long	0x404
	.uleb128 0x1
	.long	0x404
	.uleb128 0x1
	.long	0x6b
	.uleb128 0x1
	.long	0x404
	.byte	0
	.uleb128 0xe
	.long	.LASF77
	.byte	0x3
	.value	0x6714
	.byte	0x1d
	.long	0x8c
	.uleb128 0xd
	.long	.LASF72
	.value	0x11b6
	.uleb128 0xa
	.long	.LASF73
	.value	0x1171
	.byte	0x20
	.long	0x428
	.long	0x547
	.uleb128 0x1
	.long	0x423
	.uleb128 0x1
	.long	0x428
	.byte	0
	.uleb128 0x7
	.long	.LASF74
	.byte	0x4
	.value	0x17dd
	.byte	0xe
	.long	0x55a
	.uleb128 0x1
	.long	0x423
	.byte	0
	.uleb128 0xa
	.long	.LASF75
	.value	0xca3
	.byte	0x15
	.long	0x423
	.long	0x584
	.uleb128 0x1
	.long	0x48
	.uleb128 0x1
	.long	0x48
	.uleb128 0x1
	.long	0x404
	.uleb128 0x1
	.long	0x435
	.uleb128 0x1
	.long	0x423
	.byte	0
	.uleb128 0x7
	.long	.LASF76
	.byte	0x4
	.value	0xbed
	.byte	0xe
	.long	0x59c
	.uleb128 0x1
	.long	0x48
	.uleb128 0x1
	.long	0x48
	.byte	0
	.uleb128 0xe
	.long	.LASF78
	.byte	0x4
	.value	0x8ac
	.byte	0xd
	.long	0x48
	.uleb128 0x7
	.long	.LASF79
	.byte	0x3
	.value	0x4ad
	.byte	0x17
	.long	0x5cb
	.uleb128 0x1
	.long	0xb3
	.uleb128 0x1
	.long	0xb3
	.uleb128 0x1
	.long	0xc5
	.uleb128 0x1
	.long	0xc5
	.byte	0
	.uleb128 0x1a
	.long	.LASF89
	.byte	0x1
	.byte	0x28
	.byte	0x5
	.long	0x48
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x694
	.uleb128 0x8
	.long	.LASF80
	.byte	0x2a
	.byte	0x6
	.long	0x48
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x8
	.long	.LASF81
	.byte	0x2b
	.byte	0x6
	.long	0x48
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x8
	.long	.LASF82
	.byte	0x32
	.byte	0xf
	.long	0x423
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x8
	.long	.LASF83
	.byte	0x3d
	.byte	0x8
	.long	0x694
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xf
	.string	"VAO"
	.byte	0x40
	.long	0x6b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0xf
	.string	"VBO"
	.byte	0x44
	.long	0x6b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x8
	.long	.LASF84
	.byte	0x4b
	.byte	0xf
	.long	0x6b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x8
	.long	.LASF85
	.byte	0x4f
	.byte	0x6
	.long	0x48
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1b
	.long	.LASF90
	.long	0x6b4
	.uleb128 0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.0
	.uleb128 0x8
	.long	.LASF86
	.byte	0x53
	.byte	0xf
	.long	0x6b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x8
	.long	.LASF87
	.byte	0x5a
	.byte	0x6
	.long	0x48
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.byte	0
	.uleb128 0x10
	.long	0xdf
	.long	0x6a4
	.uleb128 0x11
	.long	0x41
	.byte	0x8
	.byte	0
	.uleb128 0x10
	.long	0x87
	.long	0x6b4
	.uleb128 0x11
	.long	0x41
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.long	0x6a4
	.uleb128 0x1c
	.long	.LASF91
	.byte	0x1
	.byte	0x24
	.byte	0x6
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1d
	.long	.LASF82
	.byte	0x1
	.byte	0x24
	.byte	0x23
	.long	0x423
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.string	"w"
	.byte	0x2f
	.long	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.string	"h"
	.byte	0x36
	.long	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 13
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 14
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 15
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 36
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF78:
	.string	"glfwInit"
.LASF19:
	.string	"float"
.LASF71:
	.string	"glfwTerminate"
.LASF61:
	.string	"GLFWframebuffersizefun"
.LASF73:
	.string	"glfwSetFramebufferSizeCallback"
.LASF58:
	.string	"glewExperimental"
.LASF62:
	.string	"vertex_shader_source"
.LASF10:
	.string	"short int"
.LASF60:
	.string	"GLFWwindow"
.LASF83:
	.string	"vertices"
.LASF74:
	.string	"glfwMakeContextCurrent"
.LASF79:
	.string	"glViewport"
.LASF90:
	.string	"__PRETTY_FUNCTION__"
.LASF14:
	.string	"GLbitfield"
.LASF89:
	.string	"main"
.LASF29:
	.string	"PFNGLCREATEPROGRAMPROC"
.LASF25:
	.string	"PFNGLBUFFERDATAPROC"
.LASF31:
	.string	"PFNGLDELETESHADERPROC"
.LASF39:
	.string	"PFNGLBINDVERTEXARRAYPROC"
.LASF84:
	.string	"vertex_shader"
.LASF23:
	.string	"GLsizeiptr"
.LASF87:
	.string	"program"
.LASF65:
	.string	"glfwSwapBuffers"
.LASF12:
	.string	"ptrdiff_t"
.LASF46:
	.string	"__glewCreateProgram"
.LASF63:
	.string	"fragment_shader_source"
.LASF9:
	.string	"signed char"
.LASF80:
	.string	"width"
.LASF42:
	.string	"__glewBufferData"
.LASF5:
	.string	"long double"
.LASF16:
	.string	"GLint"
.LASF51:
	.string	"__glewGetShaderiv"
.LASF28:
	.string	"PFNGLCOMPILESHADERPROC"
.LASF88:
	.string	"GNU C17 14.1.1 20240522 -mtune=generic -march=x86-64 -g"
.LASF67:
	.string	"glClear"
.LASF2:
	.string	"long int"
.LASF54:
	.string	"__glewUseProgram"
.LASF45:
	.string	"__glewCompileShader"
.LASF22:
	.string	"GLchar"
.LASF27:
	.string	"PFNGLATTACHSHADERPROC"
.LASF15:
	.string	"GLuint"
.LASF6:
	.string	"unsigned char"
.LASF33:
	.string	"PFNGLGETPROGRAMIVPROC"
.LASF72:
	.string	"glfwPollEvents"
.LASF26:
	.string	"PFNGLGENBUFFERSPROC"
.LASF44:
	.string	"__glewAttachShader"
.LASF81:
	.string	"height"
.LASF8:
	.string	"unsigned int"
.LASF59:
	.string	"GLFWmonitor"
.LASF75:
	.string	"glfwCreateWindow"
.LASF68:
	.string	"glClearColor"
.LASF56:
	.string	"__glewBindVertexArray"
.LASF13:
	.string	"GLenum"
.LASF7:
	.string	"short unsigned int"
.LASF64:
	.string	"glfwDestroyWindow"
.LASF41:
	.string	"__glewBindBuffer"
.LASF11:
	.string	"char"
.LASF86:
	.string	"fragment_shader"
.LASF66:
	.string	"glDrawArrays"
.LASF48:
	.string	"__glewDeleteShader"
.LASF57:
	.string	"__glewGenVertexArrays"
.LASF3:
	.string	"long unsigned int"
.LASF18:
	.string	"GLboolean"
.LASF21:
	.string	"double"
.LASF43:
	.string	"__glewGenBuffers"
.LASF53:
	.string	"__glewShaderSource"
.LASF4:
	.string	"long long int"
.LASF55:
	.string	"__glewVertexAttribPointer"
.LASF35:
	.string	"PFNGLLINKPROGRAMPROC"
.LASF17:
	.string	"GLsizei"
.LASF24:
	.string	"PFNGLBINDBUFFERPROC"
.LASF32:
	.string	"PFNGLENABLEVERTEXATTRIBARRAYPROC"
.LASF20:
	.string	"GLclampf"
.LASF52:
	.string	"__glewLinkProgram"
.LASF82:
	.string	"window"
.LASF30:
	.string	"PFNGLCREATESHADERPROC"
.LASF49:
	.string	"__glewEnableVertexAttribArray"
.LASF40:
	.string	"PFNGLGENVERTEXARRAYSPROC"
.LASF77:
	.string	"glewInit"
.LASF91:
	.string	"window_callback"
.LASF47:
	.string	"__glewCreateShader"
.LASF36:
	.string	"PFNGLSHADERSOURCEPROC"
.LASF50:
	.string	"__glewGetProgramiv"
.LASF38:
	.string	"PFNGLVERTEXATTRIBPOINTERPROC"
.LASF70:
	.string	"__assert_fail"
.LASF85:
	.string	"success"
.LASF37:
	.string	"PFNGLUSEPROGRAMPROC"
.LASF69:
	.string	"glfwWindowShouldClose"
.LASF34:
	.string	"PFNGLGETSHADERIVPROC"
.LASF76:
	.string	"glfwWindowHint"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lweber/cprog/opengl_examples/triangle"
.LASF0:
	.string	"main.c"
	.ident	"GCC: (GNU) 14.1.1 20240522"
	.section	.note.GNU-stack,"",@progbits
