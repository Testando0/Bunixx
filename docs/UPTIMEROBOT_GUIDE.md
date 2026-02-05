# 🔔 Guia: Manter seu Render Sempre Ativo com UptimeRobot (GRÁTIS)

## 🎯 Por que fazer isso?

Render **dorme** após 15 minutos de inatividade. Com UptimeRobot fazendo ping a cada 10 minutos, seu serviço **nunca dorme**.

---

## 📋 PASSO 1: Criar Conta UptimeRobot

1. **Acesse:** https://uptimerobot.com/
2. **Clique em:** "Sign Up" (canto superior direito)
3. **Preencha:**
   - Email
   - Senha
   - Nome da conta (ex: "Ollama API")
4. **Clique:** "Sign Up"
5. **Confirme** no email (eles mandam link)

---

## 🔧 PASSO 2: Criar Monitor

1. **Depois de logado, clique em:** "Add New Monitor"

2. **Preencha assim:**

```
Monitor Type: HTTP(s)

Friendly Name: Ollama Image API

URL to monitor: https://bhjjii.onrender.com/health

Monitoring Interval: 10 minutes  ← IMPORTANTE!

Timeout: 30 seconds

HTTP Method: GET
```

3. **Clique:** "Create Monitor"

---

## ✅ VERIFICAR SE ESTÁ FUNCIONANDO

1. **Dashboard UptimeRobot** (uptimerobot.com)
2. **Procure seu monitor**
3. **Deve mostrar:** "Up" (verde)
4. **Uptime:** Próximo de 100%

---

## 📊 RESULT

```
UptimeRobot
    ↓ (ping a cada 10 min)
Render Ollama API
    ↓
Sempre ACORDADO! ✅
    ↓
Respostas rápidas (~1 min)
```

---

## 🎉 PRONTO!

Agora sua API está:
- ✅ 24/7 ativa
- ✅ Sempre rápida
- ✅ Sem custo extra

---

## 📞 CONTATO

Se tiver dúvidas:
1. Verifique status em https://uptimerobot.com
2. Verifique logs em render.com
3. Teste manualmente: curl https://bhjjii.onrender.com/health
