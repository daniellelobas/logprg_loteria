Algoritmo "crud danielleloba"

Var
    p: vetor[0..100, 0..4] de caracter
    busca: caracter
    indiceBusca: inteiro
    acao: caracter
    continuarAcao: caracter

procedimento preencherDadosParaTeste()
inicio
    p[0,0] := "Capitao do mato"
    p[0,1] := "capacho"
    p[0,2] := "39"
    p[0,3] := "M"
    p[0,4] := "1.000,00 "

    p[1,0] := "Carla perez"
    p[1,1] := "Professora"
    p[1,2] := "43"
    p[1,3] := "F"
    p[1,4] := "4.000,00"

    p[2,0] := "Ana Carla"
    p[2,1] := "Cozinheira"
    p[2,2] := "40"
    p[2,3] := "f"
    p[2,4] := "1.000,00"

    p[3,0] := "Maria do bairro "
    p[3,1] := "matadora"
    p[3,2] := "22"
    p[3,3] := "F"
    p[3,4] := "5.000,00"

    p[4,0] := "Eliano Costa Sousa"
    p[4,1] := "Professor"
    p[4,2] := "27"
    p[4,3] := "M"
    p[4,4] := "10.000,00"

fimprocedimento

funcao indicep(nome: caracter): inteiro
var
    linha, indice: inteiro
inicio
    para linha de 0 ate 100 faca
        indice := -1
        se pos(nome, p[linha, 0]) > 0 entao
            indice := linha
            interrompa
        fimse
    fimpara
    retorne indice
fimfuncao

procedimento removerp(indice: inteiro)
var
    linha, coluna: inteiro
inicio
    para coluna de 0 ate 4 faca // s�o 5 atributos a serem removidos
        p[indice, coluna] := ""
    fimpara

    para linha de indice + 1 ate 100 faca // s�o 5 posi��es de funcion�rios
        para coluna de 0 ate 4 faca
           p[linha - 1, coluna] := p[linha, coluna]

            se linha = 100 entao
                p[linha, coluna] := ""
            fimse
        fimpara
    fimpara
fimprocedimento

procedimento listar()
var
    linha, coluna: inteiro
inicio
    escreval()
    escreval("-------------------------------------")
    escreval("A��o escolhida: L - Listar ----------")
    escreval("-------------------------------------")
    para linha de 0 ate 100 faca

        se p[linha, 0] = "" entao
            interrompa
        fimse

        escreva(linha, " - ")
        para coluna de 0 ate 4 faca
            escreva(p[linha, coluna], "     ")
        fimpara
        escreval()

    fimpara
    escreval()
fimprocedimento

procedimento atualizarLinha(linha: inteiro)
var
    nome, funcaop, idade, sexo, salario: caracter
inicio

    escreva("Nome: ")
    leia(nome)
    escreva("Fun��o: ")
    leia(funcaop)
    escreva("Idade: ")
    leia(idade)
    escreva("Sexo (M/F): ")
    leia(sexo)
    escreva("Sal�rio: ")
    leia(salario)

    p[linha,0] := nome
    p[linha,1] := funcaop
    p[linha,2] := idade
    p[linha,3] := sexo
    p[linha,4] := salario

fimprocedimento

procedimento inclusao()
var
    linha: inteiro
inicio
    escreval()
    escreval("-------------------------------------")
    escreval("A��o escolhida: I - Incluir ---------")
    escreval("-------------------------------------")

    para linha de 0 ate 100 faca

        se (p[linha, 0] = "") entao

            escreval("-------------------------------")
            escreval("Novo �ndice ", linha)
            escreval("-------------------------------")
            atualizarLinha(linha)
            interrompa
        fimse

    fimpara
    limpatela
fimprocedimento

procedimento atualizacao()
var
inicio
    escreval()
    escreval("-------------------------------------")
    escreval("A��o escolhida: A - Atualizar -------")
    escreval("-------------------------------------")

    escreva("Informe o nome do funcion�rio a ser alterado: ")
    leia(busca)
    indiceBusca := indicep(busca)

    se indiceBusca >= 0 entao
        escreval("Encontrado no �ndice: ", indiceBusca)
        atualizarLinha(indiceBusca)
        escreval("Funcion�rio alterado com sucesso...")
    senao
        escreval("Funcion�rio n�o encontrado")
    fimse
    limpatela
fimprocedimento


procedimento remocao()
var
inicio
    escreval()
    escreval("-------------------------------------")
    escreval("A��o escolhida: R - Remover ---------")
    escreval("-------------------------------------")

    escreva("Informe o nome do funcion�rio a excluir: ")
    leia(busca)
    indiceBusca := indicep(busca)

    se indiceBusca >= 0 entao
        escreval("Encontrado no �ndice: ", indiceBusca)
        removerp(indiceBusca)
        escreval("Funcion�rio removido com sucesso...")
    senao
        escreval("Funcion�rio n�o encontrado")
    fimse
    limpatela
fimprocedimento

procedimento acaoInvalida()
inicio
    escreval()
    escreval("Opa... A��o inv�lida...")
    escreval()
fimprocedimento

procedimento finalizar()
inicio
    continuarAcao := "N"
    escreval("---------------------------------------------")
    escreval("------ Obrigado, volte sempre ---------------")
    escreval("---------------------------------------------")
fimprocedimento

Inicio

    preencherDadosParaTeste()

    enquanto (continuarAcao <> "N") e (continuarAcao <> "n") faca

        escreval("---------------------------------------------------------")
        escreval("------------ Controle de Funcion�rios (Ozzy) ------------")
        escreval("---------------------------------------------------------")
        escreval("A��es Permitidas:")
        escreval("(l)istar")
        escreval("(i)ncluir")
        escreval("(a)lterar")
        escreval("(r)emover")
        escreval("(s)air")
        escreva("O que deseja fazer? ")
        escreval()

        leia(acao)

        escreval()

        escolha maiusc(acao)
            caso "L"
                listar()
            caso "I"
                inclusao()
            caso "A"
                atualizacao()
            caso "R"
                remocao()
            caso "S"
                finalizar()
            outrocaso
                acaoInvalida()
        fimescolha

    fimenquanto


Fimalgoritmo



Fimalgoritmo