# Use uma imagem Node.js como base
FROM node:latest

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /usr/src/app

# Copie o package.json e package-lock.json para o diretório de trabalho
COPY package*.json ./

# Instale as dependências
RUN npm install

# Copie os arquivos estáticos para o diretório de trabalho
COPY index.html .
COPY styles.css .

# Crie o diretório 'img' no contêiner
RUN mkdir img

# Copie o conteúdo da pasta 'img' para o diretório de trabalho
COPY img/ ./img/

# Copie o arquivo index.js para o diretório de trabalho
COPY index.js .

# Exponha a porta em que o servidor estará em execução
EXPOSE 4001

# Comando para iniciar o servidor quando o contêiner for iniciado
CMD ["npm", "start"]
