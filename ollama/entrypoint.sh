#!/bin/bash
set -e

echo "🚀 Iniciando Ollama..."

ollama serve &
OLLAMA_PID=$!

echo "⏳ Aguardando Ollama..."
for i in {1..60}; do
    if curl -s http://localhost:11434/api/tags > /dev/null 2>&1; then
        echo "✅ Ollama pronto!"
        break
    fi
    echo "  Tentativa $i/60..."
    sleep 2
done

echo "📦 Puxando modelo flux:latest..."
ollama pull flux:latest

echo "✅ Setup completo! Ollama rodando..."

wait $OLLAMA_PID
