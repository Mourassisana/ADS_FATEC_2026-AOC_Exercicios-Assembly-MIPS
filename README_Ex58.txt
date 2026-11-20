# 💻 Arquitetura e Organização de Computadores (AOC) — FATEC Zona Leste

Repositório dedicado às atividades e exercícios de programação em baixo nível (**Assembly MIPS**) desenvolvidos durante o **1º Semestre de Análise e Desenvolvimento de Sistemas (ADS — Noturno)** na **FATEC Zona Leste**.

---

## 🛠️ Ambiente e Ferramentas
* **Linguagem:** Assembly (Arquitetura MIPS 32 bits)
* **Simulador:** MARS 4.5 (*MIPS Assembler and Runtime Simulator*)
* **Professor:** Leandro Colevati dos Santos

---

## 📂 Exercício Resolvido

### [`AOC_Exercicio58.asm`](./AOC_Exercicio58.asm) — Cálculo da Série Matemática $H$
* **Enunciado:** Entrar com o número de termos da série ($N$), validando que $N > 0$ (solicitando novamente caso contrário), e calcular o valor de $H$, onde cada multiplicação representa um termo:
  $$H = 1 \cdot 2 + 3 \cdot 2 + 5 \cdot 2 + 7 \cdot 2 + \dots$$
* **Recursos implementados:**
  * Validação de entrada com desvio condicional (`bgtz`) e laço de repetição.
  * Acumulação da série e geração dinâmica dos números ímpares usando registradores salvos (`$s0`–`$s2`) e temporários (`$t0`–`$t3`).
  * Menu interativo extra ao final da execução para reiniciar o cálculo (`1`) ou encerrar o programa (`2`), com tratamento de opção inválida.

---

## ▶️ Como Executar
1. Baixe e abra o simulador **MARS 4.5** (requer Java instalado).
2. Abra o arquivo `.asm` desejado (**File → Open**).
3. Compile o código pressionando **F3** (*Assemble*).
4. Execute o programa pressionando **F5** (*Run*) e acompanhe a entrada e saída de dados na aba **Run I/O**.

---

## 👩‍💻 Autora
**Ana Lígia de Moura Assis** (`ALMA` | [@Mourassisana](https://github.com))  
Estudante de Análise e Desenvolvimento de Sistemas — FATEC Zona Leste
