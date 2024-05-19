# Descrição do Projeto

Foi desenvolvido um aplicativo com tela de login e uma página inicial com uma listagem de notícias da API do IBGE (https://servicodados.ibge.gov.br/api/docs/noticias?versao=3). Na mesma tela há opção de busca por palavras que a api suporta, e também há o ícone de um filtro mais avançado que é o de data, é possível selecionar o DE ou ATÉ, ou os dois ao mesmo tempo.

O login inclui as validações necessárias para os campos, assim como a validação para confirmar o login correto. Quando o login é realizado, sempre que abrir o app novamente, ele irá encaminhar o usuário para a home do app (usuário já logado). E na home tem a possibilidade de fazer o logout.

Para fins de demonstração, as credenciais corretas foram fixadas no código. Use as seguintes credenciais para acessar o aplicativo:

- **Email**: teste@gmail.com
- **Senha**: 123456

## Instruções de Instalação e Configuração

### Versões utilizadas na criação

- Flutter 3.22
- Dart 3.4.0
- Android Studio 2023.3.1 (para emulação no Android)
- Visual Studio Code 1.89.1

### Passos para Instalação e Confifuração do ambiente

1. Clone o repositório do projeto:
   git clone https://github.com/LucasCampanuchi/Projeto.git projeto
   cd projeto

2. Instale as dependências do projeto:
   flutter pub get
3. Para rodar o build do gerenciados de estados usado:
   dart pub run build_runner watch --delete-conflicting-outputs

### Executar o aplicativo

1. Selecionar o dispositivo

   - Localmente (Inicie o emulador pelo Android Studio)
   - Dispositivo Físico (Conecte o aparelho via cabo usb pelo pc)

2. Executar o projeto:
   flutter run
