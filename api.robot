*** Settings ***
Library        RequestsLibrary


*** Variables ***

${URL}            aqui vai seu endpoint

*** Test Case ***
Cenário 01 - Buscando registros cadastrados no banco de dados através do endpoint
        Request Get Api

Cenário 02 - Não conseguindo localizar informações devido endpoint estar incorreto
        Funcional Negativo - Get Api


*** Keywords ***

Request Get Api
    Create Session    ApiGet        ${URL}
    # Cria seção com endpoint da api a ser testada
    
    ${results}=       Get Request    ApiGet    package
    # Get Request - Faz chamada em Get

    Log To Console    ${results}

Funcional Negativo - Get Api

    Create Session    ApiGet        ${URL}
    # Cria seção com endpoint da api a ser testada

    ${results}=       Get Request    ApiGet    123
    # Get Request - Faz chamada em Get

    ${status}=        Convert To String    ${results.status_code}
    # Convert To String - Converte 'results' em string

    Should Be Equal    ${status}        200
    # Should Be Equal - Irá verificar se o status é 200

    Log To Console    ${results}