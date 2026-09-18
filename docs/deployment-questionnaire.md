# KSFinanceAgent deployment questionnaire

Complete the `Answer` fields and return this document for review. Do not enter passwords,
client secrets, certificates, access tokens or session salts. Record only the approved secret
store and the people or process responsible for supplying those values during deployment.

`Recommended` values describe the smallest practical path to a fully working development
environment. Replace them where your organization requires a different choice.

## 1. Goal and environment

**Q1. Which environment should be made fully operational first?**

- Recommended: Development only, followed by staging and production after acceptance.
- Answer: `Development only`

**Q2. What is the intended first release audience?**

- Examples: only me; named developers; finance pilot group; whole organization.
- Answer: `Only me`

**Q3. What date should the first working development release target?**

- Answer: `ASAP, while preserving every required deployment and acceptance gate`

## 2. Azure ownership and placement

**Q4. Which Microsoft Entra tenant will own the development environment?**

- Tenant display name: `Current signed-in development tenant; confirm during preflight`
- Tenant ID, if known: `Confirm during preflight`

**Q5. Which Azure subscription and resource groups should be used?**

- Subscription name: `Current signed-in development subscription; confirm during preflight`
- Subscription ID, if known: `Confirm during preflight`
- Channel resource group: `rg-ksfinanceagent-channel-dev`
- Foundry/model resource group: `rg-ksfinanceagent-foundry-dev`
- Search resource group: `rg-ksfinanceagent-search-dev`
- May new resource groups be created? `YES`

**Q6. Which Azure region or regions are approved?**

- Recommended development region: Sweden Central, subject to service and model availability.
- Primary region: `Sweden Central, subject to service and model availability preflight`
- Alternate region: `Choose during preflight only if a required service or model is unavailable`
- Data residency restrictions: `Keep development resources in the selected Azure/Fabric/Power Platform geography where supported`

**Q7. Who may approve Azure resource creation and role assignments?**

- Resource deployment owner: `Repository owner provisionally; confirm Azure permissions during preflight`
- RBAC approval owner: `Repository owner provisionally; identify tenant RBAC administrator during preflight`
- Budget/cost approval owner: `Repository owner provisionally`

## 3. Service and policy decisions

**Q8. Are preview components permitted?**

The current design uses Foundry hosted agents and Fabric Data Agent MCP capabilities whose
release contracts include preview components.

- Development: `YES`
- Staging: `APPROVAL NEEDED`
- Production: `APPROVAL NEEDED`
- Approval owner: `Repository owner for development; governance owner required before staging or production`

**Q9. What network posture is required?**

- Recommended development choice: public service endpoints protected by Entra authentication,
  with private Storage and explicitly approved ingress/egress.
- Choice: `PUBLIC endpoints protected by Entra authentication for development`
- Services that must use private endpoints: `Host/state Storage remains private as defined by the Channel template`
- Is public Bot Service ingress allowed? `YES`
- Are stable outbound IP addresses available? `UNKNOWN; verify during network preflight`
- Network/DNS owner: `Identify tenant network owner during preflight`
- Corporate proxy or TLS inspection requirements: `None known; verify during preflight`

**Q10. Are the planned starting SKUs acceptable?**

- Channel: P1v3, one development instance.
- Search: Standard S1, one replica and one partition for new development environments.
- Fabric: existing paid F2 or higher capacity.
- Approved or requested changes: `Provisional only; produce a cost estimate before provisioning`
- Monthly development budget limit: `No fixed limit yet; minimize cost and obtain approval for the estimate`

## 4. Development data

**Q11. Which data should the first deployment use?**

- Recommended: deterministic fictional Zava data for development acceptance.
- Choice: `FICTIONAL THEN EXISTING DATA`
- Answer notes: `Build and validate deterministic fictional Zava data first; map existing data only after development acceptance.`

**Q12. If existing data will be used, who owns its schema and access approval?**

- Data owner: `Deferred until fictional development acceptance`
- Fabric workspace/lakehouse: `Deferred until fictional development acceptance`
- Existing table names or mapping document: `Not collected during the fictional development phase`
- Data classification: `Treat as confidential financial data unless its eventual owner approves another classification`
- May data be used by AI services? `CONDITIONAL on later data-owner, security and AI-processing approval`

**Q13. What fictional data coverage is required?**

- Recommended: January 2024 through December 2026, all four regions, all departments,
  18 KPIs, budgets, headcount and enough variation for trends and anomaly questions.
- Date range: `January 2024 through December 2026`
- Required regions/departments: `All four regions and all documented departments`
- Additional scenarios or reference figures: `All 18 KPIs, budgets, headcount, trends, anomalies and deterministic reference results`

**Q14. Which development authorization personas should be represented?**

- Recommended: global finance user, EMEA-only user, APAC-only user and denied user.
- Personas and intended scopes: `Global finance, EMEA-only, APAC-only and denied users`
- Who can create or license the test accounts? `Identify Entra/M365 licensing administrator during preflight`

## 5. Microsoft Fabric

**Q15. What Fabric capacity and workspace should be used?**

- Capacity name/SKU: `Reuse an existing paid capacity; identify during inventory`
- Capacity region: `Identify during inventory and verify compatibility with the selected development geography`
- Existing or new workspace: `New isolated development workspace`
- Existing or new lakehouse: `New isolated development lakehouse`
- Fabric administrator: `Repository owner provisionally; confirm Fabric capacity administrator during inventory`
- Capacity may be paused outside testing: `YES, only when no other workspace or user depends on it`

**Q16. May the deployment create and seed the nine required source Delta tables?**

Required tables are `dim_region`, `dim_department`, `dim_kpi`, `dim_date`, `dim_account`,
`fact_finance_monthly`, `fact_kpi_monthly`, `fact_headcount_monthly` and
`fact_gl_transaction`.

- Answer: `YES`
- Naming or schema constraints: `Use the documented nine-table contract unless Fabric validation requires an explicit compatible adjustment`
- Reset/delete policy for fictional data: `Allow idempotent reset and reseed in development only`

**Q17. Who will approve Fabric SQL permissions and row-level security?**

- Owner: `Repository owner provisionally; confirm Fabric data/security owner during preflight`
- Required user/group model: `Global finance, EMEA-only, APAC-only and denied security groups or test users`
- Metadata visibility restrictions: `Users may see only organization catalogue entries and scopes backed by facts they are authorized to query`

**Q18. May a Fabric Data Agent be created and published?**

- Answer: `YES for development`
- Agent owner: `Repository owner provisionally; confirm Fabric item owner during preflight`
- Intended users/groups: `Owner and the four controlled authorization personas during acceptance`
- Cross-geo AI processing permitted: `UNKNOWN; verify the tenant setting and geography before enabling it`

## 6. Foundry and models

**Q19. Should Foundry resources be newly created or should existing resources be reused?**

- Choice: `Create a new isolated development project; reuse an account only if inventory and policy checks approve it`
- Existing account/project names, if applicable: `Identify candidate account during inventory`
- Foundry administrator: `Repository owner provisionally; confirm Foundry account administrator during preflight`

**Q20. Are these model deployments approved and available?**

- `gpt-4.1-mini` for routing and constrained reranking: `YES, subject to regional availability and quota preflight`
- `text-embedding-3-large` with 1536-dimensional requests: `YES, subject to regional availability and quota preflight`
- Approved deployment type, such as Standard or Global Standard: `Global Standard allowed for development`
- Quota owner: `Repository owner provisionally; confirm subscription quota administrator during preflight`

**Q21. Which container registry/build approach is approved?**

- Choice: `FOUNDRY-MANAGED build path when supported by the selected project`
- Registry name and permission mode, if existing: `Inventory the platform-selected or generated registry during Foundry preflight`
- Image scanning/signing requirements: `Use available vulnerability scanning and record the immutable image/source digest; no additional requirement known`

## 7. Entra, Bot and delegated identity

**Q22. May a new single-tenant Entra app registration be created per environment?**

- Answer: `YES for development`
- Entra application owner: `Repository owner provisionally; confirm Entra application administrator during preflight`
- Enterprise app assignment required: `YES`
- Allowed pilot users/groups: `Owner initially, then the controlled acceptance-test personas`

**Q23. Which OBO confidential-client credential policy applies?**

- Recommended for initial development: securely stored client secret, then evaluate managed
  identity federation before production.
- Choice: `CLIENT SECRET for development; evaluate managed identity federation before production`
- Credential rotation policy: `Define before deployment and rotate immediately if exposure is suspected`
- Approved secret store, without secret values: `Use the approved deployment secret store; select during preflight`
- Credential owner: `Repository owner provisionally; Entra credential administrator controls creation and rotation`

Certificate authentication requires a code change. Managed identity federation requires a
supported attached user-assigned identity and an Entra federated identity credential.

**Q24. Can tenant-wide admin consent be granted for the delegated permissions?**

The baseline needs Graph `User.Read`, Fabric/Power BI `Item.Execute.All`, Fabric SQL
`user_impersonation` and Copilot Studio invocation permission.

- Answer: `YES`
- Consent owner: `Identify tenant Entra consent administrator during preflight`
- Conditional Access constraints: `Discover and test applicable policies during preflight and acceptance`
- Guest or cross-tenant users required: `NO for initial development`

**Q25. May the Azure Bot OAuth connection named `mcs` be configured?**

- Answer: `YES`
- Bot administrator: `Repository owner provisionally; confirm Azure Bot/Entra administrator during preflight`

## 8. Copilot Studio KPIpedia

**Q26. Should KPIpedia be created in Copilot Studio or replaced by a local service?**

- Recommended: create the authenticated Copilot Studio agent for design fidelity.
- Choice: `COPILOT STUDIO`
- Power Platform environment: `New or approved isolated development environment; select during inventory`
- Power Platform administrator: `Repository owner provisionally; confirm environment administrator during preflight`

**Q27. What is the authoritative source for KPI definitions?**

- Recommended for fictional development: the 18 definitions and formulas supplied by this
  repository, reviewed against the generated data.
- Source owner/location: `The repository's 18 KPI definitions and formulas, reviewed against the generated data by the repository owner`
- Citation requirements: `KPIpedia must cite the approved definition source; the application must preserve returned citations`
- DLP or connector restrictions: `Treat finance and KPI sources as business data; verify tenant DLP before publication`

## 9. Teams and Microsoft 365 distribution

**Q28. Where will valid legal and developer pages be hosted?**

- Developer website URL: `Create a project-specific static HTTPS page; final host selected before package publication`
- Privacy statement URL: `Create a project-specific static HTTPS page; final host selected before package publication`
- Terms of use URL: `Create a project-specific static HTTPS page; final host selected before package publication`
- Content/legal owner: `Repository owner provisionally; obtain organizational legal approval before broader distribution`

**Q29. Which clients must pass acceptance?**

- Teams desktop: `YES`
- Teams web: `YES`
- Teams mobile: `NO for initial development acceptance`
- Microsoft 365 Copilot web: `YES`
- Microsoft 365 Copilot desktop/mobile: `NO for initial development acceptance`

**Q30. How may the application be distributed?**

- Choice: `Restricted pilot app catalog; initial pilot may contain only the owner`
- Teams/Microsoft 365 administrator: `Identify tenant app-catalog administrator during preflight`
- App approval policy or security review: `Complete the tenant's custom-app review before catalog publication`

## 10. Operations and release governance

**Q31. Which deployment automation is required?**

- Recommended: GitHub Actions with separate validate, infrastructure, data publication,
  application deployment and acceptance stages, each with environment approvals.
- Choice: `MANUAL DEVELOPMENT DEPLOYMENT, THEN GITHUB ACTIONS`
- Deployment owner: `Repository owner provisionally`
- Connected/private runner required: `NO for the selected public-endpoint development posture; reassess before production`

**Q32. What observability and retention requirements apply?**

- Log Analytics retention: `30 days for development unless policy requires longer`
- Alert recipients/on-call owner: `Repository owner for development`
- Required availability or latency targets: `Development baseline; measure statement and long-running agent paths before setting production SLOs`
- Prohibited telemetry fields beyond tokens and answer text: `No credentials, user assertions, access tokens, secrets, full prompts, financial answer text or clarification payloads`
- SIEM integration: `Not required for initial development unless tenant policy mandates it`

**Q33. What backup, deletion and rollback requirements apply?**

- Required recovery point objective: `Configuration, source and deterministic fictional data must be reproducible from versioned artifacts; no separate fictional-data backup required`
- Required recovery time objective: `One business day for the development environment`
- Conversation/state retention: `30 days for development unless tenant policy requires less`
- Fabric data retention: `Retain the active fictional dataset and immutable resolver versions until an approved reset or environment teardown`
- Search index retention: `Retain the active and immediately prior validated indexes for rollback`
- Legal deletion requirements: `No additional requirements known; apply tenant policy and delete development state during approved teardown`

**Q34. Who provides final acceptance?**

- Business/finance owner: `Repository owner for fictional development data`
- Security owner: `Repository owner provisionally; tenant security approval required before broader distribution`
- Data owner: `Repository owner for fictional development data`
- Platform/operations owner: `Repository owner for development`

## 11. Required acceptance scenarios

Mark each scenario required, optional or out of scope.

| Scenario | Decision |
|---|---|
| Exact KPI statement with independently calculated result | `REQUIRED` |
| Ambiguous KPI clarification, such as `margin` | `REQUIRED` |
| Organization hierarchy and global department scopes | `REQUIRED` |
| Open-ended analysis through Fabric Data Agent | `REQUIRED` |
| KPI definition and citation through KPIpedia | `REQUIRED` |
| Different results/visibility for two authorized users | `REQUIRED` |
| Fully denied user | `REQUIRED` |
| Expired, tampered and cross-user clarification rejection | `REQUIRED` |
| Expired token and Conditional Access reauthentication | `REQUIRED` |
| Duplicate delivery, retry and conversation reload | `REQUIRED` |
| Search runtime can read but cannot publish | `REQUIRED` |
| Logs contain no credentials, assertions or answer text | `REQUIRED` |
| Teams and Microsoft 365 Copilot both pass | `REQUIRED` |
| Load, throttling and dependency-failure behavior | `REQUIRED` |
| Rollback to the prior agent and resolver release | `REQUIRED` |

## 12. Additional constraints

**Q35. List any requirements not captured above.**

- Compliance standards: `No additional standards known; apply tenant policy discovery, least privilege, encryption and audit controls`
- Naming/tagging standards: `Use the documented KSFinanceAgent development naming and tags unless Azure Policy requires changes`
- Accessibility requirements: `Use accessible Teams and Microsoft 365 controls and validate keyboard and screen-reader behavior where supported`
- Procurement/licensing constraints: `No additional constraints known; verify Fabric, Foundry, Copilot Studio, Teams and Microsoft 365 licensing before provisioning`
- Other technical or business constraints: `None known`

## Submission check

- `[x]` No secrets, tokens, passwords or certificate material are included.
- `[ ]` Every `YES/NO` policy decision has an owner where approval is still needed.
- `[ ]` Azure, Fabric, Foundry, Entra, Power Platform and Teams owners are identified.
- `[x]` Data source and authorization personas are defined.
- `[ ]` Preview, networking, identity and legal URL decisions are complete.
- `[x]` Acceptance authority and required scenarios are confirmed.