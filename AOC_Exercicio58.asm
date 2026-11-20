# Disciplina: Arquitetura e Organização de Computadores (AOC) - FATEC ZL
# 1º Semestre de ADS - noite
# Feito por: Ana Lígia de Moura Assis -> ALMA | Mourassisana

# Exercício 58: Cálculo da série H = 1*2 + 3*2 + 5*2 + ... para N termos (N > 0)

.data
msg_entrada:
	.asciiz "Digite o número de termos, considerando N > 0: "
msg_erro:
	.asciiz "Opa! Valor inválido. N DEVE ser MAIOR que zero!\n"
msg_saida:
	.asciiz "O valor de H é: "
# Extra
msg_repetir:
	.asciiz "\n\nDeseja calcular novamente? Digite 1 para Sim ou 2 para Não: "
msg_erro_repetir:
	.asciiz "Opa! Opção inválida. Digite estritamente 1 para reiniciar o programa, ou 2 para encerrar.\n"
	

.text 
main:
# 1. Validação da Entrada N > 0

 valida_n:
 	li $v0, 4               # carrega o serviço 4 (print_string)
 	la $a0, msg_entrada     # carrega o endereço da msg a ser exibida
 	syscall                 # executa o serviço 4, chamando na tela msg_entrada
 	
 	li $v0, 5               # carrega o serviço 5, quando usuário insere valor
 	syscall                 # pausa e aguarda usuário inserir valor de N (salva em $v0)
 	move $s0, $v0           # copia o valor inserido de $v0 em $s0 (N)
 	
 	bgtz $s0, inicia_serie  # se $s0 > 0, o programa é iniciado
 	
 	# Se $s0 <= 0, mostra msg_erro e reinicia
 	li $v0, 4               # carrega o serviço 4 (print_string)
 	la $a0, msg_erro        # carrega o endereço da msg a ser exibida
 	syscall                 # executa o serviço 4, chamando na tela msg_erro
 	j valida_n              # pula de volta para pedir N novamente
 

 # 2. Inicialização das Variáveis da Série

 inicia_serie:
 	li $s1, 0               #$s1 = H (acumulador da soma, começa em 0)
 	li $s2, 1               #$s2 = termo ímpar atual (começa em 1)
 	li $t0, 0               #$t0 = contador de voltas, equivale a i = 0 (começa em 0)
 	li $t1, 2               #$t1 = multiplica o termo sempre por 2

 
# 3. Laço de Repetição

 loop:
 	beq $t0, $s0, mostra_resultado          # Condição de parada: se (i == N), sai do laço
 	
 	mul $t2, $s2, $t1                       # calcula o termo atual: $t2 = ímpar * 2
 	add $s1, $s1, $t2                       # adiciona o termo ao acumulador: H = H + ($s2 * 2)
 	addi $s2, $s2, 2                        # próximo número ímpar ($s2 = $s2 + 2)
 	addi $t0, $t0, 1                        # acrescenta 1 ao contador ($t0 = $t0 + 1)
 	j loop                                  # volta para o começo do laço


# 4. Saída e Encerramento

 mostra_resultado:
 	li $v0, 4                        # carrega o serviço 4 (print_string)
 	la $a0, msg_saida                # carrega o endereço da msg a ser exibida
 	syscall                          # executa o serviço 4, chamando na tela msg_saida
 	
 	li $v0, 1                        # carrega o serviço 1 (print_int)
 	move $a0, $s1                    # copia o valor inserido em H de $s1 em $a0
 	syscall                          # executa o serviço 1, chamando na tela o número em H
 	
 	
# Extra
# Reiniciar o programa

 reiniciar_programa:
	li $v0, 4                         # carrega o serviço 4 (print_string)
	la $a0, msg_repetir               # carrega o endereço da pergunta se o usuário deseja repetir o programa
	syscall                           # executa o serviço 4, chamando na tela msg_repetir
	
	li $v0, 5                         # carrega o serviço 5 (ler número inteiro (read_int): 1 ou 2)
	syscall                           # armazena o valor inserido pelo usuário em $v0
	
	li $t3, 1                         # carrega 1 no registrador temporáro $t3 e compara
	beq $v0, $t3, valida_n            # se valor inserido pelo usuário for 1, reinicia o programa
	
	li $t3, 2                         # carrega 2 no registrador temporáro $t3 e compara
	beq $v0, $t3, encerra_programa    # se valor inserido pelo usuário for 2, encerra o programa
	
	li $v0, 4                         # carrega o serviço 4 (print_string)
	la $a0, msg_erro_repetir          # carrega o endereço da msg a ser exibida
	syscall                           # executa o serviço 4, chamando na tela msg_erro_repetir
	j reiniciar_programa              # força usuário a inserir uma opção válida (1 ou 2)
	
	
 encerra_programa:
	li $v0, 10                        # carrega o serviço 10 (encerrar execução / exit)
 	syscall                           # encerra o programa