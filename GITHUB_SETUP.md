# 🚀 Guia: Como Subir seu Projeto no GitHub

**Step-by-step guide to upload your project to GitHub**

---

## 📋 Pré-requisitos | Prerequisites

- [ ] Conta GitHub criada (https://github.com)
- [ ] Git instalado no seu computador
- [ ] Terminal/CMD com acesso

---

## ✅ Passo 1: Preparar os arquivos localmente | Step 1: Prepare Files Locally

Você já tem tudo pronto! Os arquivos criados são:

```
prestacao-contas-mandato/
├── index.html
├── styles.css
├── README.md
├── LICENSE
├── .gitignore
└── assets/
    └── imagens/
        ├── cloara-capa.jpg
        └── cloara-sobre.jpg
```

**⚠️ Importante | Important:**
- Crie a pasta `assets/imagens/` 
- Adicione as fotos (cloara-capa.jpg e cloara-sobre.jpg)

---

## ✅ Passo 2: Criar um novo repositório no GitHub | Step 2: Create Repository on GitHub

### 2a. Ir para GitHub
1. Acesse https://github.com
2. Clique no **+** (canto superior direito)
3. Selecione **"New repository"**

### 2b. Configurar o repositório
- **Repository name**: `prestacao-contas-mandato`
- **Description**: "Parliamentary accountability report website for Deputada Cloara Pinheiro"
- **Visibility**: `Public` (para portfólio)
- **Initialize this repository with**: NÃO marque nada
- Clique em **"Create repository"**

---

## ✅ Passo 3: Configurar Git no seu computador | Step 3: Configure Git Locally

Abra o terminal (CMD ou PowerShell no Windows) e rode:

```bash
# Configurar seu nome e email (primeira vez apenas)
git config --global user.name "Alan Lucas Pereira"
git config --global user.email "alan.lucasmkt@gmail.com"

# Verificar se ficou correto
git config --global user.name
git config --global user.email
```

---

## ✅ Passo 4: Inicializar Git no seu projeto | Step 4: Initialize Git in Project

Abra o terminal **DENTRO da pasta do projeto** e execute:

```bash
# Navegar até a pasta (exemplo)
cd caminho/para/prestacao-contas-mandato

# Inicializar git
git init

# Adicionar todos os arquivos
git add .

# Criar primeiro commit (salvamento)
git commit -m "Initial commit: Prestação de contas website"

# Criar branch main (se necessário)
git branch -M main
```

---

## ✅ Passo 5: Conectar ao repositório remoto | Step 5: Connect to Remote Repository

Na página do repositório no GitHub, você verá um código como este. **Copie e cole** no seu terminal:

```bash
git remote add origin https://github.com/SEU-USUARIO/prestacao-contas-mandato.git
git branch -M main
git push -u origin main
```

**Substitua `SEU-USUARIO` pelo seu username do GitHub!**

---

## ✅ Passo 6: Fazer upload | Step 6: Upload/Push

Pronto! Seus arquivos já foram enviados! ✨

Para verificar se funcionou, recarregue a página do repositório no GitHub.

---

## 📝 Atualizações futuras | Future Updates

Sempre que fizer mudanças:

```bash
# 1. Ver arquivos modificados
git status

# 2. Adicionar as mudanças
git add .

# 3. Criar um commit descritivo
git commit -m "Descrição clara da mudança"

# 4. Enviar para GitHub
git push
```

### Exemplos de mensagens de commit boas:
```bash
git commit -m "Add new styles for mobile responsiveness"
git commit -m "Update content and add new sections"
git commit -m "Fix navigation dots scroll behavior"
git commit -m "Optimize images for performance"
```

---

## 🚀 Colocar site online (Live) | Deploy Website

### Opção 1: GitHub Pages (Gratuito | Free)

1. Vá para: **Settings > Pages**
2. Em "Source", selecione: **Deploy from a branch**
3. Selecione: **main** e **/root**
4. Clique em **Save**
5. Aguarde 2-3 minutos
6. Seu site estará em: `https://seu-usuario.github.io/prestacao-contas-mandato`

### Opção 2: Netlify (Mais fácil | Easier)

1. Acesse https://netlify.com
2. Clique em **"New site from Git"**
3. Conecte sua conta GitHub
4. Selecione o repositório `prestacao-contas-mandato`
5. Clique em **Deploy**
6. Seu site estará online em poucos segundos! 🎉

### Opção 3: Vercel (Melhor performance | Best performance)

1. Acesse https://vercel.com
2. Clique em **"Import Project"**
3. Cole: `https://github.com/seu-usuario/prestacao-contas-mandato`
4. Clique em **Import**
5. Clique em **Deploy**
6. Pronto! 🚀

---

## 🎯 Resumo do processo | Process Summary

```
┌─────────────────────────────────────────┐
│ 1. Criar repo no GitHub                 │
│ 2. Configurar Git (nome + email)        │
│ 3. git init no seu projeto              │
│ 4. git add . → git commit               │
│ 5. git remote add origin [URL]          │
│ 6. git push -u origin main              │
│ 7. Ativar GitHub Pages OU Deploy        │
│ 8. Site está ONLINE! ✨                 │
└─────────────────────────────────────────┘
```

---

## ❓ Erros comuns | Common Issues

### Erro: "Permission denied (publickey)"
**Solução**: Configure chave SSH ou use HTTPS
```bash
# Use HTTPS ao invés de SSH
git remote set-url origin https://github.com/seu-usuario/prestacao-contas-mandato.git
```

### Erro: "fatal: not a git repository"
**Solução**: Verifique se você rodou `git init`
```bash
git status  # Se der erro, rode: git init
```

### Erro: "Everything up-to-date"
**Explicação**: Não há mudanças para fazer push. Faça alterações e commit.

---

## 💡 Dicas importantes | Important Tips

✅ **Use commits descritivos** - `git commit -m "fix: button color on hover"`  
✅ **Faça push regularmente** - Evita perder trabalho  
✅ **Mantenha README atualizado** - Primeira coisa que veem  
✅ **Adicione screenshots** - Mostre como fica no README  
✅ **Use branches** - Para ficar mais profissional

---

## 🎉 Pronto!

Seu projeto está no GitHub e online! 

**Próximos passos:**
1. Adicione o link na sua bio do LinkedIn
2. Compartilhe com recrutadores
3. Continue melhorando o projeto
4. Crie mais projetos para o portfólio 🚀

---

## 📞 Dúvidas?

Se tiver problemas:
- Verifique a URL do repositório
- Confirme seu username
- Teste com: `git remote -v`

Good luck! 🍀  
Boa sorte! 🍀

---

**Made by Alan Lucas Pereira**  
Transformando ideias em soluções digitais | Transforming ideas into digital solutions
