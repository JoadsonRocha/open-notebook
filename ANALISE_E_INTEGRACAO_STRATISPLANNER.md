# 🧠 Estudo Estratégico: Open Notebook & Integração com Stratis Planner

> **Documento de Análise Técnica, Viabilidade Comercial e Estratégia de Integração**  
> *Data: Novembro de 2026*  
> *Autor: Antigravity AI Assistant*

---

## 📌 Sumário Executivo

Este documento consolida a análise profunda do **Open Notebook**, seu potencial comercial sob a licença **MIT**, seus diferenciais em relação ao **Google NotebookLM** e as estratégias práticas para integrá-lo ao ecossistema do **Stratis Planner** (sua plataforma de estudos e editais para concursos).

---

## 1. O que é o Open Notebook?

O **Open Notebook** é uma plataforma open-source, auto-hospedável (*self-hosted*) e focada em privacidade para pesquisa, síntese e gestão de conhecimento potencializada por Inteligência Artificial (RAG - *Retrieval-Augmented Generation*).

### Arquitetura do Sistema (3 Camadas)
1. **Frontend:** Next.js 16 (App Router), React 19, TypeScript, Tailwind CSS v4, Zustand, TanStack Query, i18next (suporte a PT-BR e múltiplos idiomas).
2. **Backend & IA:** FastAPI (Python 3.12+), LangGraph (orquestração de grafos de IA), Esperanto (abstração unificada para 20+ provedores de IA como OpenAI, Anthropic, Gemini, Groq, Ollama local).
3. **Banco de Dados Híbrido:** SurrealDB v2 (combina modelo documental, grafos de relação, busca vetorial e busca full-text BM25 nativa).
4. **Processador em Segundo Plano:** `surreal-commands-worker` (gerencia filas assíncronas para vetorização de PDFs densos, transcrição de vídeos e síntese de áudio sem travar requisições HTTP).

---

## 2. Viabilidade Jurídica & Comercial: Licença MIT

O projeto é 100% distribuído sob a licença **MIT** (`LICENSE`), oferecendo máxima liberdade comercial:

* ✅ **Uso Comercial Irrestrito:** Você pode vender acessos, cobrar mensalidades, prestar consultoria ou vender licenças privadas.
* ✅ **White-Label e Código Fechado:** Você pode remover a marca original, aplicar sua própria marca, alterar o visual e fechar o código derivado sem obrigação de abrir alterações para a comunidade.
* ⚠️ **Único Requisito Legal:** Manter os créditos e o aviso de copyright original da licença no código-fonte interno.

---

## 3. Diferenciais Competitivos vs Google NotebookLM

| Funcionalidade | Open Notebook | Google NotebookLM | Vantagem Estratégica |
| :--- | :--- | :--- | :--- |
| **Privacidade / LGPD** | *Self-hosted* (on-premises / VPC privada) | Nuvem pública Google | Crucial para B2B e conformidade jurídica/médica |
| **Provedores de IA** | 20+ provedores ou 100% local (Ollama) | Apenas Google Gemini | Sem *vendor lock-in*; controle total de custos |
| **Audiocasts / Podcasts** | 1 a 4 interlocutores configuráveis | 2 vozes fixas | Permite criar debates, aulas professor-aluno, etc. |
| **Acesso a API** | API REST completa (FastAPI com 22 rotas) | Não possui API pública | Automação e integração direta com outros sistemas |
| **Customização** | Prompts, fluxos e design 100% editáveis | Sistema fechado | Pode virar um recurso nativo do seu próprio SaaS |

---

## 4. Modelos de Negócio Comerciais

### A. Consultoria e Implantação Enterprise / B2B (On-Premises)
* **Público:** Escritórios de advocacia, clínicas de saúde, contabilidades, consultorias financeiras e órgãos públicos.
* **Proposta:** Empresas com dados sigilosos não podem enviar contratos e relatórios para ferramentas em nuvem aberta. Implante o Open Notebook em servidores dedicados (com GPUs locais e Ollama, ou chaves privadas do Azure OpenAI).
* **Faturamento:** Setup de implantação (R$ 5.000 a R$ 25.000) + mensalidade de suporte, backup e SLA.

### B. Micro-SaaS Verticalizado de Nicho (*White-Label*)
* Customize o frontend e os prompts para resolver a dor de um nicho específico:
  1. **LegalNotebook:** RAG especializado em jurisprudência, peças processuais e editais.
  2. **MedResearch AI:** Leitura e síntese de papers médicos, diretrizes clínicas e PubMed.
  3. **ConcursoNotebook:** Focado em apostilas, resumos e questões comentadas.

### C. Motor RAG Headless para Sistemas Existentes
* Use a API do Open Notebook como o motor de inteligência por trás de ERPs, CRMs, portais internos ou bots de WhatsApp/Telegram (via n8n, Typebot ou Chatwoot).

---

## 5. Como Usar o Open Notebook com o Stratis Planner

O **Stratis Planner** já possui a funcionalidade de `NotebookSources.tsx` (aproximadamente 3.000 linhas no frontend React com Supabase e Gemini). 

O Open Notebook é o complemento perfeito para elevar o Stratis Planner ao nível de uma plataforma de estudos de alto rendimento de classe mundial.

### Por que o Open Notebook supera implementações simples:
1. **RAG Híbrido com SurrealDB:** Em vez de enviar textos gigantescos diretamente ao contexto do modelo (o que estoura tokens e causa alucinações), o Open Notebook quebra o documento em pedaços de 400 tokens com overlap de 60 tokens, cruzando busca vetorial com BM25 e gerando **citações precisas de páginas e notas**.
2. **Processamento Assíncrono:** Editais de 800 páginas e PDFs de bancas examinadoras (FGV, Cebraspe, FCC) não causam timeout na tela do estudante.
3. **Podcast Studio Profissional:** O template de diálogo entre apresentadores com papéis definidos (ex: professor experiente e aluno curioso) gera áudios de revisão extremamente naturais e engajantes.

---

### 3 Estratégias de Integração com o Stratis Planner

```
                          ┌────────────────────────┐
                          │     ESTUDANTE NO       │
                          │     STRATIS PLANNER    │
                          │   (React 19 / Vite)    │
                          └───────────┬────────────┘
                                      │
               ┌──────────────────────┴──────────────────────┐
               ▼                                             ▼
     [ Abordagem 1: Headless API ]                [ Abordagem 2: Módulo White-Label ]
    Stratis consome o Open Notebook               Open Notebook roda embutido como
    como um microsserviço de RAG / Áudio          notebook.stratisplanner.com (ou Iframe)
               │                                             │
               ▼                                             ▼
     ┌─────────────────────────────────────────────────────────────┐
     │                OPEN NOTEBOOK BACKEND (:5055)                │
     │   - POST /api/notebooks (Caderno por Edital/Disciplina)     │
     │   - POST /api/sources (Ingestão de PDFs, Links e YouTube)   │
     │   - POST /api/search/ask (Deep Search com Citação de Fonte) │
     │   - POST /api/podcasts/generate (Audiocast Multi-Speaker)   │
     │   - POST /api/transformations/execute (Mapas & Flashcards)  │
     └──────────────────────────────┬──────────────────────────────┘
                                    │
                                    ▼
                     [ SurrealDB v2 + Worker Assíncrono ]
```

#### Abordagem 1: Open Notebook como "Headless Knowledge Engine" (Mais Poderosa)
* O estudante continua dentro da interface do Stratis Planner.
* O backend Express ou o próprio cliente do Stratis faz chamadas à API do Open Notebook:
  * **Ao criar um Edital:** Chama `POST /api/notebooks` criando o caderno daquele concurso.
  * **Ao enviar PDFs e leis secas:** Chama `POST /api/sources` para indexação vetorial.
  * **No Chat com o Edital:** Chama `POST /api/search/ask` recebendo a resposta em streaming SSE com as fontes citadas.
  * **Na Central de Audiocasts:** Chama `POST /api/podcasts/generate` para gerar episódios com até 4 apresentadores discutindo a matéria.

#### Abordagem 2: Módulo Dedicado Embutido (Mais Rápida de Lançar)
* Suba o Open Notebook em um subdomínio (`notebook.stratisplanner.com`) ou dentro de um `<iframe>` protegido na aba "Stratis Notebook AI".
* Altere as cores do tema e o logo em `frontend/` para a identidade visual do Stratis.
* O recurso fica disponível imediatamente sem precisar alterar o código do `NotebookSources.tsx`.

#### Abordagem 3: Portabilidade de Prompts e Pipeline (100% no seu código)
Se preferir manter tudo no seu Node.js/Supabase atual:
* **Copie os Prompts de Podcasts:** Estude `prompts/podcast/outline.jinja` e `prompts/podcast/transcript.jinja`. Eles têm a estrutura exata de persona e dinâmica de fala para elevar a qualidade do seu gerador de áudio atual.
* **Copie o Mecanismo de Chunking:** Veja em `open_notebook/utils/chunking.py` como é feita a contagem exata de tokens e o cálculo de janelas sobrepostas de texto.

---

### Proposta de Monetização no Stratis Planner

* 🥉 **Plano Free / Básico:**
  * Chat simples com o edital usando o Gemini direto no frontend (respostas gerais).
* 🥇 **Plano PRO / Elite (Diferencial de Venda):**
  * **Deep Search no Edital:** RAG híbrido movido pelo Open Notebook com citação de página e parágrafo exato da lei ou edital.
  * **Audiocasts Avançados:** Podcast gerado com 2 apresentadores debatendo pegadinhas da banca e dúvidas comuns.
  * **Mapas Mentais & Flashcards Automatizados** gerados a partir dos chunks indexados.

---

## 6. Guia Prático de Execução Local

Para operar o Open Notebook localmente nesta máquina:

### Inicialização com Dois Cliques
* **`iniciar.bat`**: Inicia automaticamente o SurrealDB, a API FastAPI, o worker assíncrono, o frontend Next.js e abre o navegador em `http://localhost:3000`.
* **`parar.bat`**: Encerra com segurança todos os processos em execução.

### Endpoints Chave para Teste
* **Frontend:** `http://localhost:3000`
* **API Swagger / Documentação:** `http://localhost:5055/docs`
* **Health Check do Banco:** `http://localhost:5055/api/config`
* **Lista de Cadernos:** `http://localhost:5055/api/notebooks`

---

## 7. Próximos Passos Recomendados

1. **Testar na Prática:** Criar um caderno no Open Notebook, subir um edital denso (ex: PDF de concurso recente) e fazer perguntas no chat.
2. **Gerar um Audiocast:** Testar o recurso de podcast com 2 apresentadores configurados para sentir a qualidade do diálogo comparado ao Stratis atual.
3. **Mapear a Integração:** Decidir entre a **Abordagem 1** (API Headless no Stratis) ou a **Abordagem 2** (Módulo Embutido White-Label).

