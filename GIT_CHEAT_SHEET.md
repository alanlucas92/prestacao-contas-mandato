# 🔧 Git Cheat Sheet | Guia Rápido de Comandos

Referência rápida de comandos Git mais usados | Quick reference for Git commands

---

## 🚀 PRIMEIRAS VEZES | FIRST TIME SETUP

### Configurar Git
```bash
# Definir seu nome (aparecerá nos commits)
git config --global user.name "Alan Lucas Pereira"

# Definir seu email (deve ser o mesmo do GitHub)
git config --global user.email "alan.lucasmkt@gmail.com"

# Verificar se ficou correto
git config --global --list
```

### Inicializar um repositório local
```bash
# Entrar na pasta do projeto
cd caminho/para/prestacao-contas-mandato

# Inicializar git nessa pasta
git init

# Verificar status
git status
```

---

## 📤 FAZER UPLOAD (PRIMEIRO PUSH)

### 1. Primeiro commit
```bash
# Adicionar todos os arquivos
git add .

# Criar um commit (salvar ponto)
git commit -m "Initial commit: Prestação de contas website"

# Verificar commits
git log
```

### 2. Conectar ao GitHub
```bash
# COPIE A LINHA DO GITHUB E EXECUTE:
git remote add origin https://github.com/seu-usuario/prestacao-contas-mandato.git

# Renomear branch para 'main' (padrão novo)
git branch -M main

# Fazer push (enviar para GitHub)
git push -u origin main
```

### 3. Verificar se funcionou
```bash
# Listar repositórios remotos
git remote -v

# Deve mostrar:
# origin  https://github.com/seu-usuario/prestacao-contas-mandato.git (fetch)
# origin  https://github.com/seu-usuario/prestacao-contas-mandato.git (push)
```

---

## 💾 WORKFLOW DIÁRIO | DAILY WORKFLOW

### Ver o que mudou
```bash
# Ver status (arquivos modificados, não staged)
git status

# Ver diferenças no código
git diff

# Ver apenas nomes dos arquivos modificados
git status -s
```

### Adicionar mudanças
```bash
# Adicionar TODOS os arquivos modificados
git add .

# Adicionar um arquivo específico
git add index.html

# Adicionar múltiplos arquivos
git add index.html styles.css README.md

# Fazer "stage" interativo (escolher o que adicionar)
git add -p
```

### Fazer commit
```bash
# Commit simples
git commit -m "Update content and styles"

# Commit com descrição detalhada
git commit -m "Update hero section" -m "
- Changed title text
- Updated color scheme
- Fixed mobile responsiveness"

# Alterar último commit (se ainda não fez push)
git commit --amend -m "Nova mensagem"
```

### Enviar para GitHub
```bash
# Push para branch atual
git push

# Push com mais detalhes
git push origin main

# Push de múltiplos commits
git push
```

---

## 🔍 VER HISTÓRICO | VIEW HISTORY

### Ver commits
```bash
# Ver últimos commits
git log

# Ver últimos 5 commits
git log -5

# Ver commits em uma linha
git log --oneline

# Ver commits com estatísticas
git log --stat

# Ver commits de um arquivo específico
git log -- index.html

# Ver commits de um autor
git log --author="Alan Lucas"
```

### Ver mudanças
```bash
# Ver diferenças não committed
git diff

# Ver diferenças de um arquivo
git diff index.html

# Ver diferenças staged (prontas para commit)
git diff --staged

# Ver diferenças entre commits
git diff abc123 def456

# Ver diferenças entre branches
git diff main develop
```

---

## 🔄 BRANCHES | RAMIFICAÇÕES

### Criar e mudar de branch
```bash
# Listar branches locais
git branch

# Listar todos os branches (local + remoto)
git branch -a

# Criar nova branch
git branch feature/nova-animacao

# Criar e mudar para nova branch
git checkout -b feature/nova-animacao

# Ou versão nova (mais intuitiva)
git switch -c feature/nova-animacao

# Mudar para branch existente
git checkout main

# Ou versão nova
git switch main

# Deletar branch local
git branch -d feature/nova-animacao

# Forçar delete
git branch -D feature/nova-animacao

# Deletar branch remoto
git push origin --delete feature/nova-animacao
```

### Merge (Juntar branches)
```bash
# Primeiro, mude para a branch main
git checkout main

# Faça merge da feature branch
git merge feature/nova-animacao

# Se tiver conflitos, resolve manualmente depois
git add .
git commit -m "Merge feature/nova-animacao"
git push
```

---

## ↩️ DESFAZER MUDANÇAS | UNDO CHANGES

### Descartar mudanças locais
```bash
# Descartar mudanças em um arquivo
git checkout -- index.html

# Descartar mudanças em TODOS os arquivos
git checkout -- .

# Remover arquivo do staging (mas manter mudanças)
git reset HEAD index.html

# Descartar as mudanças completamente
git reset --hard HEAD

# ⚠️ CUIDADO com --hard, não pode reverter!
```

### Reverter commits
```bash
# Reverter um commit específico (cria novo commit)
git revert abc123

# Voltar para um commit anterior
git reset --soft abc123     # Mantém mudanças
git reset --mixed abc123    # Unmount do staging
git reset --hard abc123     # Descarta tudo (⚠️)

# Ver commits deletados (reflog)
git reflog

# Recuperar branch deletada
git checkout -b feature/recuperada abc123
```

### Limpar arquivos não tracked
```bash
# Ver arquivos que serão removidos (dry run)
git clean -n

# Remover arquivos não tracked
git clean -f

# Remover arquivos e pastas não tracked
git clean -fd

# Remover também arquivos ignored
git clean -fdx
```

---

## 🔀 REBASE E CHERRY-PICK | ADVANCED

### Rebase (reescrever histórico)
```bash
# Fazer rebase interativo (limpador + poderoso)
git rebase -i main

# Rebase simples
git rebase main

# Continuar rebase após resolver conflitos
git rebase --continue

# Cancelar rebase
git rebase --abort
```

### Cherry-pick (copiar commits)
```bash
# Copiar um commit específico
git cherry-pick abc123

# Copiar múltiplos commits
git cherry-pick abc123 def456 ghi789

# Copiar range de commits
git cherry-pick abc123..xyz789
```

---

## 🔐 CONFIGURAÇÕES | CONFIGURATION

### Alias (atalhos)
```bash
# Criar atalhos para comandos longos
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.cm commit
git config --global alias.log1 "log --oneline"
git config --global alias.amend "commit --amend --no-edit"

# Usar os atalhos
git st         # ao invés de git status
git co main    # ao invés de git checkout main
git cm "msg"   # ao invés de git commit -m "msg"
```

### Editar configuração
```bash
# Listar configurações
git config --list

# Editar configuração global
git config --global --edit

# Remover configuração
git config --global --unset user.name
```

---

## ⚠️ MENSAGENS DE COMMIT BOM HÁBITO | COMMIT MESSAGES

### Padrão Conventional Commits (Profissional)
```
<tipo>(<escopo>): <assunto>

<corpo>

<rodapé>
```

### Tipos
- `feat:` Nova feature
- `fix:` Bug fix
- `docs:` Documentação
- `style:` Formatação, sem mudança de lógica
- `refactor:` Refatoração de código
- `perf:` Melhoria de performance
- `test:` Adicionar ou atualizar testes
- `chore:` Tarefas de build, dependências, etc
- `ci:` Mudanças em CI/CD

### Exemplos bons
```bash
# ✅ BOM
git commit -m "feat: add smooth scroll to navigation"
git commit -m "fix: correct hero section responsive layout"
git commit -m "docs: update README with deployment guide"
git commit -m "style: adjust color variables for better contrast"

# ❌ RUIM
git commit -m "update"
git commit -m "changes"
git commit -m "fixed bugs"
git commit -m "working version"
```

---

## 🚨 EMERGÊNCIAS | EMERGENCY COMMANDS

### Quando algo deu errado
```bash
# Ver tudo que aconteceu
git reflog

# Voltar para um ponto específico
git reset --hard abc123

# Ver o que foi deletado
git fsck --lost-found

# Limpar cache se tiver arquivo gigante
git gc

# Verificar integridade do repositório
git fsck --full
```

### Problemas comuns
```bash
# Erro: "fatal: not a git repository"
# Solução: Certifique-se que você rodou git init

# Erro: "Permission denied (publickey)"
# Solução: Use HTTPS ao invés de SSH
git remote set-url origin https://github.com/usuario/repo.git

# Erro: "failed to push some refs to 'origin'"
# Solução: Pull primeiro
git pull origin main
git push origin main

# Commits desaparecidos após reset --hard
# Solução: Ver reflog e recuperar
git reflog
git reset --hard abc123  # ID que você vê no reflog
```

---

## 📊 COMANDOS ÚTEIS | USEFUL COMMANDS

```bash
# Ver tamanho do repositório
du -sh .git

# Ver quem foi o último a modificar cada linha
git blame index.html

# Ver commits que alteraram uma linha específica
git log -L 10,20:index.html

# Procurar por palavra no histórico
git log -S "palavra"

# Ver quem commitou mais
git shortlog -sn

# Simular push (verificar o que será enviado)
git push --dry-run

# Fazer squash de commits (juntar vários em um)
git rebase -i HEAD~3  # juntar últimos 3

# Stash (guardar mudanças temporariamente)
git stash
git stash list
git stash pop

# Tags (criar versões)
git tag v1.0.0
git push origin v1.0.0
```

---

## 📈 FLUXO TÍPICO DIÁRIO | TYPICAL DAILY FLOW

```bash
# 1. Ver o que mudou
git status

# 2. Revisar mudanças
git diff index.html

# 3. Adicionar arquivos
git add .

# 4. Verificar o que vai ser commitado
git status

# 5. Fazer commit descritivo
git commit -m "feat: add new animation to hero section"

# 6. Enviar para GitHub
git push

# 7. Verificar se funcionou
git log --oneline -5
```

---

## 🎯 DICAS OURO | GOLDEN TIPS

✅ **Commit frequentemente** - Pequenos commits são mais fáceis de entender  
✅ **Mensagens descritivas** - Seu "eu" do futuro agradecerá  
✅ **Sempre faça pull antes de push** - Evita conflitos  
✅ **Use branches para features** - Mantenha main estável  
✅ **Revise o diff antes de commit** - Verifique o que está enviando  
✅ **Aprenda git rebase** - Histórico limpo é profissional  
✅ **Use gitignore** - Não versione arquivos desnecessários  

---

## 📚 RECURSOS | RESOURCES

- Documentação oficial: https://git-scm.com/doc
- Interactive learning: https://learngitbranching.js.org/
- Visual tool: https://gitexplorer.com/

---

**Salve este arquivo para consulta rápida!**  
**Save this file for quick reference!**

🚀 **Happy coding!**  
🚀 **Bom desenvolvimento!**

Criado por Alan Lucas Pereira  
Created by Alan Lucas Pereira
