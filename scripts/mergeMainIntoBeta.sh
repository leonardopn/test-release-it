#!/bin/bash

# Verifica se o repositório está atualizado
git fetch origin

# Cria um merge da branch master na branch beta, resolvendo conflitos
# de forma que as modificações da master sempre saiam na frente
git checkout beta
git merge --no-ff -X theirs master

# Adiciona todas as alterações
git add .

# Cria um commit com a mensagem desejada
git commit -m "Merge branch 'master' into beta [skip ci]" -n

# Faz push para o repositório remoto
git push origin beta
