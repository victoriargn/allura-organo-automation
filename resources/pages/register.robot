*** Settings ***
Resource  ../main.robot

*** Variables ***

${FIELD_NAME}  id:form-nome    
${FIELD_ROLE}  id:form-cargo    
${FIELD_IMAGE}  id:form-imagem    
${FIELD_DROPDOWN}  class:lista-suspensa    

@{SELECT_TEAM}
...  //option[contains(.,'Programação')]    
...  //option[contains(.,'Front-End')]    
...  //option[contains(.,'Data Science')]    
...  //option[contains(.,'Devops')]    
...  //option[contains(.,'UX e Design')]    
...  //option[contains(.,'Mobile')]    
...  //option[contains(.,'Inovação e Gestão')] 
 
${BUTTON_CREATE_CARD}  id:form-botao   
${CARD_COLLABORATOR}  class:colaborador 

*** Keywords ***

Quando um formulário for preenchido com dados válidos
  ${Collaborator_Name}  FakerLibrary.First Name
  Input Text  ${FIELD_NAME}  ${Collaborator_Name}

  Input Text  ${FIELD_ROLE}  QA

  ${Image}  FakerLibrary.Image Url  width=100  height=100    
  Input Text  ${FIELD_IMAGE}  ${Image}    
  
  Click Element  ${FIELD_DROPDOWN}
  Click Element  ${SELECT_TEAM}[0] 

Quando 3 formulários forem enviados com dados válidos
  FOR    ${x}    IN RANGE    0    3
    Quando um formulário for preenchido com dados válidos
    Click Button  ${BUTTON_CREATE_CARD}
  END
  Sleep  5s

Quando formulários forem enviados com nomes de times diferentes
  FOR    ${index}    ${team}    IN ENUMERATE    @{SELECT_TEAM}
    Quando um formulário for preenchido com dados válidos
    Click Element    ${team}
    Click Button  ${BUTTON_CREATE_CARD}
  END
  Sleep    10s

Então um card para o time escolhido deve ser criado
  Click Button  ${BUTTON_CREATE_CARD}
  Element Should Be Visible  ${CARD_COLLABORATOR}
  Sleep    5s

# Então cards com os times correspondentes devem ser exibidos

#Verificar o time
# Então 3 cards com os times correspondentes devem ser exibidos

Quando os campos obrigatórios forem enviados em branco
  Click Button    ${BUTTON_CREATE_CARD}
Então mensagens de campo obrigatório devem ser exibidas
  Element Should Be Visible    id:form-nome-erro
  Element Should Be Visible    id:form-cargo-erro
  Element Should Be Visible    id:form-times-erro

E o card não será criado
  Element Should Not Be Visible  ${CARD_COLLABORATOR}
  Sleep    5s