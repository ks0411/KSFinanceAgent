# KSFinanceAgent

KSFinanceAgent is a finance agent for Microsoft Teams and Microsoft 365 Copilot. It uses a Microsoft Foundry hosted agent for routing and finance tools, plus an Azure Functions channel for identity, acknowledgements, and delivery.

The sample finance dataset describes **Zava**, a fictional company. No real financial data is included in this repository.

## Capabilities

- Explains KPI definitions through a Copilot Studio agent.
- Returns deterministic financial statements from Fabric SQL.
- Sends open-ended analysis to a Microsoft Fabric data agent.
- Preserves the signed-in user's delegated identity with OAuth On-Behalf-Of.
- Resolves ambiguous KPI and organization names before querying.
- Returns downstream answers verbatim and appends a source footer.

## Architecture

```text
Microsoft Teams / Microsoft 365 Copilot
                  |
                  v
       Azure Functions channel
       identity, state, delivery
                  |
                  v
       Foundry hosted agent
       routing and native tools
          /       |       \
 Copilot Studio  Fabric SQL  Fabric Data Agent
```

## Repository layout

```text
src/KSFinanceAgent.Agent/     Foundry hosted agent and shared contracts
src/KSFinanceAgent.Channel/   Azure Functions channel
tests/KSFinanceAgent.Tests/   Unit, protocol, routing, and finance tests
appPackage/                   Teams and Microsoft 365 Copilot package
infra/                        Bicep infrastructure and environment templates
scripts/                      Publication, verification, and packaging scripts
docs/                         Deployment, data, and administration guidance
```

## Prerequisites

- .NET 10 SDK
- Azure CLI with an authenticated account
- Azure Developer CLI (`azd`) and the Foundry agent extension
- Access to Microsoft Foundry, Microsoft Fabric, Copilot Studio, and Microsoft Entra ID
- A Teams/Microsoft 365 app registration for channel publishing

## Build and test

```powershell
dotnet restore .\KSFinanceAgent.slnx
dotnet test .\KSFinanceAgent.slnx --configuration Release
```

The live routing evaluation is skipped unless `Foundry__ProjectEndpoint` and `Foundry__ModelDeployment` are configured and the current user is signed in with Azure CLI.

## Configuration

Copy the appropriate templates in `infra/environments` and provide your own tenant, application, Fabric, Foundry, and Search values. Do not commit secrets or live environment identifiers.

Important hosted-agent settings include:

- `OBO_CLIENT_ID`, `OBO_TENANT_ID`, `OBO_AUDIENCE`, and `OBO_CLIENT_SECRET`
- `COPILOT_STUDIO_ENVIRONMENT_ID` and `COPILOT_STUDIO_SCHEMA_NAME`
- `FABRIC_SQL_ENDPOINT`, `FABRIC_DATABASE`, `FABRIC_WORKSPACE_ID`, and `FABRIC_DATA_AGENT_ID`
- `RESOLVER_SEARCH_ENDPOINT` and `RESOLVER_EMBEDDING_ENDPOINT`
- `ORCHESTRATOR_SESSION_KEY_SALT`

See `docs/deployment.md`, `docs/resolver-data.md`, and `docs/it-admin-catalogue.md` for the full deployment and security contracts.

## Deploy

After configuring an `azd` environment with your own values:

```powershell
az login
azd auth login
azd provision
azd deploy
```

Build the Teams application package with:

```powershell
.\scripts\build-app-package.ps1
```

## Security

Every finance call uses the signed-in user's delegated identity. Fabric row-level security is therefore evaluated for that user. Runtime identities, publisher identities, and channel identities should remain separate and receive only the documented scoped roles.

## License

MIT. See [LICENSE](LICENSE).
