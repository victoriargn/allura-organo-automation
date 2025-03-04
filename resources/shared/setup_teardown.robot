*** Settings ***
Resource  ../main.robot

*** Keywords ***

Dado que o formulário de colaborador esteja em exibição
  Open Browser  url=http://localhost:3000/  browser=Chrome

Fechar o navegador
  Close Browser