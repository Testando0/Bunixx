# 🚀 Guia Rápido: Subir Tudo no Render

## ⚡ 3 PASSOS RÁPIDOS

### PASSO 1: GitHub
```bash
# Criar novo repo em github.com (pode ser privado ou público)
# Nome: ollama-image-api

# No seu terminal:
cd projeto-completo
git init
git add .
git commit -m "Initial commit: Ollama Image API"
git branch -M main
git remote add origin https://github.com/SEU-USER/ollama-image-api.git
git push -u origin main
```

### PASSO 2: Render
1. Vá em https://render.com
2. Clique em "New +" → "Blueprint"
3. Selecione seu repositório
4. Clique "Deploy"

**Pronto! Render vai:**
- Ler `render.yaml`
- Criar 2 serviços automaticamente
- Fazer build dos Dockerfiles
- Iniciar tudo

### PASSO 3: Aguardar
- ⏳ 10-15 minutos: Deploy da API
- ⏳ 30-45 minutos: Ollama + Model FLUX
- ✅ **~45-60 minutos: Tudo pronto!**

---

## ✅ VERIFICAR SE ESTÁ FUNCIONANDO

```bash
# Health check
curl https://bhjjii.onrender.com/health

# Resposta esperada:
# {"status":"ok","ollama_connected":true,...}
```

---

## 🎨 GERAR PRIMEIRA IMAGEM

```bash
curl -X POST https://bhjjii.onrender.com/api/generate \
  -H "Content-Type: application/json" \
  -d '{"prompt":"um gato colorido"}' \
  -o image.png

# Abrir imagem
open image.png  # Mac
xdg-open image.png  # Linux
start image.png  # Windows
```

---

## 🔔 OPCIONAL: Manter Sempre Ativo

```
1. Vá em uptimerobot.com
2. Sign Up (grátis)
3. Add Monitor
4. URL: https://bhjjii.onrender.com/health
5. Interval: 10 minutes
6. Create!
```

**Pronto!** Seu serviço **nunca dorme** 24/7

---

## 📁 ESTRUTURA DO PROJETO

```
projeto-completo/
├── backend/
│   ├── app.py           ← API Flask
│   ├── requirements.txt
│   ├── Dockerfile
│   └── .dockerignore
├── ollama/
│   ├── Dockerfile       ← Ollama container
│   └── entrypoint.sh
├── frontend/
│   └── index.html       ← Website
├── docs/
│   ├── RENDER_DEPLOYMENT_GUIDE.md
│   └── UPTIMEROBOT_GUIDE.md
├── render.yaml          ← Config Render (IMPORTANTE!)
├── docker-compose.yml   ← Para testes local
├── .gitignore
├── .env.example
└── README.md
```

---

## 🎯 DICAS IMPORTANTES

1. **Não modifique `render.yaml`** - Ele já está correto!
2. **A URL é fixa:** `https://bhjjii.onrender.com`
3. **Primeira vez leva tempo:** Aguarde 45-60 minutos
4. **Ollama dorme após 15 min:** Use UptimeRobot
5. **Tudo é gratuito:** Sem custos ocultos!

---

## 🐛 SE ALGO DESSE ERRADO

1. Vá em render.com → Dashboard
2. Clique no seu serviço
3. Verifique os Logs
4. Procure por mensagens de erro
5. Aguarde inicialização (30-45 min)

---

## 📞 CHECKLIST FINAL

- [ ] Criei conta GitHub
- [ ] Fiz push dos arquivos
- [ ] Criei repositório no GitHub
- [ ] Conectei no Render
- [ ] Cliquei "Deploy"
- [ ] Aguardei 45-60 minutos
- [ ] Testei health check
- [ ] Gerei primeira imagem
- [ ] Configurei UptimeRobot (opcional)

---

**Se chegou aqui, parabéns! 🎉 Sua API está PRONTA!**

Qualquer dúvida, releia a documentação em `/docs`
