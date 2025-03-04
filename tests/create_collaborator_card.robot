*** Settings ***
Resource    ../resources/main.robot
Test Setup     Dado que o formulário de colaborador esteja em exibição
Test Teardown  Fechar o navegador


*** Test Cases ***

Verificar criação de um card em um time ao preencher o formulário corretamente
  Quando um formulário for preenchido com dados válidos
  Então um card para o time escolhido deve ser criado

Verificar a criação de 3 cards de colaborador em um mesmo time
  Quando 3 formulários forem enviados com dados válidos
  # Então 3 cards com os times correspondentes devem ser exibidos

Verificar a criação de cards em times diferentes
  Quando formulários forem enviados com nomes de times diferentes
  # Então cards com os times correspondentes devem ser exibidos