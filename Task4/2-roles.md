| Роль | Права роли | Группы пользователей |
| --- | --- | --- |
| `cluster-admin` | Полные права на весь кластер (`*` на все ресурсы и verbs). | `system:masters` |
| `namespace-dev` | Полные права (`get`, `list`, `create`, `update`, `delete`, `watch`) на все ресурсы (`pods`, `deployments`, `services`, `ingresses`, `configmaps`) в определенном namespace. | `dev-group` |
| `secret-reader` | Право только на чтение (`get`, `list`, `watch`) ресурсов типа `secrets` в определенном namespace. | `secret-auditors` |
| `view` (стандартная роль) | Права только на просмотр (`get`, `list`, `watch`) большинства ресурсов в определенном namespace. | `view-group` |
| `edit` (стандартная роль) | Права на чтение и запись (но не на просмотр/изменение RBAC ресурсов или `secrets`) в определенном namespace. | `dev-group` |