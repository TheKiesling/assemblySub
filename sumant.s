/* --------------------------------------------------------------------------------------
* #      #    #######    ########   #######   #          #######   ##      #    #########
* #     #        #       #          #         #             #      # #     #    #
* #    #         #       #          #         #             #      #  #    #    #
* ####           #       #####      #######   #             #      #   #   #    #    ####
* #    #         #       #                #   #             #      #    #  #    #       #
* #     #        #       #                #   #             #      #     # #    #       #
* #      #    ########   ########   #######   ########   #######   #      ##    #########
*
* UNIVERSIDAD DEL VALLE DE GUATEMALA 
* Organización de computadoras y Assembler
* Ciclo 1 - 2022
* -------------------------------
* Emily Elvia Perez Alarcón 21385
* Jose Pablo Kiesling Lange 21581
* -------------------------------
* sumant.s
* Resta dos valores numéricos: valor1 y valor2, al-
* macenados en memoria. El resultado se guarda en 
* resta.
* Imprime en pantalla el mensaje y resultado, uti-
* lizando programación mixta.
* -------------------------------------------------
* R0: inicio de cadena o mensaje a imprimir.
* R1: valor numérico resultado de resta.
 -------------------------------------------------------------------------------------- */
 
 
/* --------------------------------------- TEXT --------------------------------------- */
.text
.align 2
.global main
.type main,%function

main:

	stmfd sp!, {lr}	/* SP = R13 link register */
	/* ----- Carga valor1 en R1 ----- */
	
	ldr r0,=valor1				@@ carga dirección de la localidad de memoria donde está valor1 al R0
	ldr r1,[r0]					@@ carga valor contenido (de la localidad) hacia el R1

	/* ----- Carga valor2 en R2 ----- */

	ldr r0,=valor2
	ldr r2,[r0]

	sub r3,r1,r2				@@ resta R1 y R2, y el resultado lo guarda en R3
	
	ldr r0,=resta				@@ guarda resultado en "variable" resta
	str r3,[r0]

	/* ----- Imprime resultado ----- */

	ldr r0,=formato				@@ carga inicio de mensaje a imprimir.
	mov r1,r3					@@ mueve resultado de R3 a R1 a imprimir
	bl printf
	
	/* salida correcta */
	mov r0, #0
	mov r3, #0
	ldmfd sp!, {lr}	/* R13 = SP */
	bx lr


/* --------------------------------------- DATA --------------------------------------- */
.data
.align 2
formato:
	.asciz "El resultado de la resta es: %d\n"
valor1:
	.word 4141592653589
valor2:
	.word 1000000000000
resta:
	.word 0