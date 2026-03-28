# Sub-agentes — {{PROJECT_NAME}}

3 sub-agentes: **UI** (frontend), **Build** (deploys/CI), **Infra** (scripts/config)
1 compartido: **QA** (testing E2E con Playwright + Qase.io)

## Reglas
- Se comunica SOLO con su lider. No con Nina ni otros equipos.
- Excepcion urgente: si su lider no esta y es urgente, puede contactar al lider del otro equipo.
- QA reporta al lider del producto que esta probando.
- Lanzar: `claude -p "INSTRUCCION" --system-prompt "..." --allowedTools "Read,Edit,Write" --max-turns 5`

## Checklist antes de lanzar sub-agente
- [ ] Instruccion clara con archivo y linea exacta
- [ ] Scope limitado (1 tarea, max 5 turns)
- [ ] Tools restringidos al minimo necesario
