#!/bin/bash

# Verifica se o repositório está atualizado
git fetch origin

# Muda para a branch beta
git checkout beta

# Cria um merge da branch master na branch beta, resolvendo conflitos
# de forma que as modificações da master sempre saiam na frente
git merge --no-ff -X theirs master -m "Merge branch 'master' into beta [skip ci]"

# Faz push para o repositório remoto
git push origin beta
