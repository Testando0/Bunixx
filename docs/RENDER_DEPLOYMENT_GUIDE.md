# 🚀 Guia de Deploy no Render

## ✅ O QUE VOCÊ TEM

Tudo já está organizado e pronto para deploy:

```
projeto-completo/
├── backend/          (API Flask - pronta!)
├── ollama/           (Serviço Ollama - pronto!)
├── frontend/         (Website - pronto!)
├── docs/             (Esta documentação)
├── render.yaml       (Configuração Render)
└── README.md
```

---

## 📋 PASSO 1: Preparar GitHub

1. **Crie um repositório vazio** em github.com
   - Nome: `ollama-image-api`
   - Deixe vazio (não inicie com README)

2. **No seu terminal:**

```bash
# Clonar ou iniciar repo
cd seu-repositorio
git init

# Adicionar todos os arquivos
git add .

# Commit inicial
git commit -m "Initial commit: Ollama Image Generation API"

# Configurar branch main
git branch -M main

# Adicionar remote GitHub
git remote add origin https://github.com/SEU-USUARIO/ollama-image-api.git

# Push
git push -u origin main
```

---

## 🎯 PASSO 2: Deploy no Render

### Opção A: Usando Blueprint (RECOMENDADO)

1. **Vá em https://render.com**
2. **Faça login** (ou crie conta)
3. **Clique em "New +" → "Blueprint"**
4. **Conecte seu repositório GitHub**
5. **Selecione `ollama-image-api`**
6. **Clique em "Deploy"**

**Pronto!** Render vai:
- Ler o arquivo `render.yaml`
- Criar automaticamente 2 serviços:
  - `ollama-image-api` (API Flask)
  - `ollama-server` (Serviço Ollama)
- Fazer build dos Dockerfiles
- Iniciar tudo automaticamente

---

## ⏳ O QUE ACONTECE DURANTE O DEPLOY

**Tempo estimado: 45-60 minutos**

### Minutos 1-10: Deploy da API
- Render cria o serviço `ollama-image-api`
- Compila o Dockerfile (backend/)
- Inicia a API Flask

### Minutos 10-45: Deploy do Ollama
- Render cria o serviço `ollama-server`
- Baixa imagem Ollama (~2GB)
- Inicializa Ollama
- **AGUARDA: Baixa modelo FLUX (~5GB)** ← Leva tempo!

### Minutos 45-60: Tudo pronto
- API conecta ao Ollama
- Health check passa
- Serviços prontos para uso

---

## ✅ VERIFICAR SE ESTÁ FUNCIONANDO

### 1. Ver Logs do Render

1. Vá em https://render.com → Dashboard
2. Clique no serviço `ollama-image-api`
3. Vá em **"Logs"**
4. Procure por mensagens de sucesso

### 2. Testar Health Check

```bash
curl https://bhjjii.onrender.com/health
```

**Resposta esperada:**
```json
{
  "status": "ok",
  "ollama_connected": true,
  "model": "flux:latest",
  "timestamp": "2025-02-05T..."
}
```

### 3. Listar Modelos

```bash
curl https://bhjjii.onrender.com/api/models
```

### 4. Gerar Imagem (Teste Manual)

```bash
curl -X POST https://bhjjii.onrender.com/api/generate \
  -H "Content-Type: application/json" \
  -d '{"prompt": "um gato colorido"}' \
  -o image.png
```

---

## 🐛 TROUBLESHOOTING

### Problema: "Connection refused"

**Causa:** Ollama ainda está inicializando
**Solução:** Aguarde 30-45 minutos na primeira vez

### Problema: "Ollama not connected"

**Causa:** Serviço Ollama não está rodando
**Solução:** 
1. Vá em Render → selecione `ollama-server`
2. Verifique os logs
3. Procure por "Puxando modelo"

### Problema: Timeout 504

**Causa:** Render plano starter é lento
**Solução:** Aguarde mais tempo ou upgrade plano

### Problema: Serviço dorme

**Causa:** Plano gratuito dorme após 15 min inativo
**Solução:** Use UptimeRobot (veja UPTIMEROBOT_GUIDE.md)

---

## 🔐 SEGURANÇA

Seus dados:
- ✅ Armazenados localmente no Render
- ✅ Não enviados para terceiros
- ✅ Modelos IA em seu servidor

---

## 📊 CUSTOS

- API Flask: **Gratuito**
- Ollama Server: **Gratuito**
- Storage modelos: **Gratuito**

**Total: R$0,00** 🎉

---

## 🎯 PRÓXIMOS PASSOS

1. ✅ Deploy no Render (você está aqui)
2. 🔔 Configurar UptimeRobot (veja guia)
3. 🌐 Acessar frontend: https://seu-repo/frontend/index.html
4. 🎨 Gerar primeiras imagens!

---

**Tudo pronto? Bora fazer o deploy! 🚀**
