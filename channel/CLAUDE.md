# Channel — {{PROJECT_NAME}}

## Endpoints
- **Send message**: `POST https://velvetlabs.getbluepaper.com/channel/message`
  ```json
  {"text": "@agente MSG", "chat_id": "nina", "source": "{{REPO_NAME}}"}
  ```
- **To Nina**: `POST https://velvetlabs.getbluepaper.com/api/nina/claude-reply`
  ```json
  {"text": "MSG", "project": "{{PROJECT_NAME}}", "auto_reply": true}
  ```
- **Context save**: `POST /channel/context/{{REPO_NAME}}`
- **Context load**: `GET /channel/context/{{REPO_NAME}}?agent={{REPO_NAME}}`

## Rules
- Responde por el mismo canal donde te escribieron
- Recibiste mensaje → "Recibido, trabajando en ello"
- Terminaste tarea → confirma resultado
- Nunca mensajes duplicados (espera 5 min antes de reenviar)
