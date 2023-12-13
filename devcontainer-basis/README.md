# DevContainer Minimal - Docker Compose

## Vorbereitung
* Workspace-Folder muss vorher definiert werden! Bei WSL ist es `/workspaces/` + `aktueller Pfad`
* Definition vom workspace volume (siehe unten)
* DevContainer features müssen von Git geklont werden.

### Minimalbeispiel.
* GroupIT Base Image
* Container wird nicht als root ausgeführt
* kein Volume eingebunden
* Command History nur bis Re-Build verfügbar. 

VSCode Extensions müssen für den DevContainer erneut installiert werden. 

```
# Definition vom Workspace Volume im docker-compose file:
../../..:/workspaces:cached #bei "workspaceFolder": "/workspaces/folder1/folder2/folder3",
../..:/workspaces:cached #bei "workspaceFolder": "/workspaces/folder1/folder2",
..:/workspaces:cached #bei "workspaceFolder": "/workspaces/folder1",
```

Falls der Container nicht startet, kann man sich den Log ausgeben lassen. `STRG+Control+P` `Devcontainer Developer: Show all Logs`
