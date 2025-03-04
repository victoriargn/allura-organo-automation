*** Settings ***

Resource       ../resources/main.robot
Test Setup     Dado que o formulário de colaborador esteja em exibição
Test Teardown  Fechar o navegador

*** Variables ***
${BUTTON_CREATE_CARD}  id:form-botao   
${CARD_COLLABORATOR}  class:colaborador

*** Test Cases ***

Verificar que o formulário não é enviado ao deixar os campos obrigatórios em branco
  Quando os campos obrigatórios forem enviados em branco
  Então mensagens de campo obrigatório devem ser exibidas
  E o card não será criado