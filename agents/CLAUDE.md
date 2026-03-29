# Sub-agentes — Formato nuevo (--agents flag)

## Reglas generales
- Scope limitado. Solo trabaja en lo que dice su definicion.
- No guardan contexto en VPS. Al terminar, piden /clear.
- Comunicacion externa pasa por el lider. Nina no sabe que existen.
- Respuestas concisas. Solo codigo y confirmaciones.

## Definiciones de sub-agentes
Los sub-agentes se definen en `.claude/agents/` como archivos .md con frontmatter.
Claude auto-delega basado en la descripcion del agente.

### Agents disponibles
- `ui.md` — Frontend: componentes, pantallas, estilos, layouts
- `build.md` — CI/CD: builds, versionamiento, deploys
- `infra.md` — Infra: scripts, VPS, Docker, servicios, monitoreo
- `qa.md` — QA: tests E2E con Playwright + Maestro + Qase.io

### Effort por rol
| Agente | Effort | Model | Max turns |
|--------|--------|-------|-----------|
| Lideres | medium | sonnet | — |
| UI | low | haiku | 5 |
| Build | low | haiku | 5 |
| Infra | medium | sonnet | 10 |
| QA | low | haiku | 5 |

## Checklist pre-lanzamiento (OBLIGATORIO)
1. Prompt con **archivo y linea exacta** (no "mejora el auth")
2. Verbo de accion especifico (add/fix/remove/update, no "improve/handle")
3. Scope verificado: la tarea cabe en max-turns asignados
4. Contexto minimo: no pasar lo que el sub-agente no necesita
5. **NUNCA** pasar MCP ni credenciales a sub-agentes

## Anti-patrones
- Prompt vago sin archivo concreto
- Pasar contexto completo del proyecto al sub-agente
- Lanzar sub-agente para tareas de 1 linea (hazlo tu)
- Ratio input/output > 10:1 = contexto sobredimensionado

## Checklist post-sesion
- Si el prompt se repite → crear skill reutilizable en `.claude/skills/`

## Decisiones de arquitectura
Ver `docs/decisions/` para el historial de decisiones tecnicas.
