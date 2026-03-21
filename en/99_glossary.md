# Dictionary Of Terms And Acronyms

This is an appendix document for the learning library.
Its purpose is not to replace the main learning documents, but to serve as a quick index of terms, abbreviations, and concepts that recur throughout the KomITi onboarding.
The reading rule is simple:
- check the brief meaning of a term here first,
- then go to the referenced canonical documents if you need a deeper explanation or a hands-on task.
`Where it appears` does not mean "every possible file in the repo", but the main learning/codex documents where the term matters most.

## Contents

A<br>
B<br>
C<br>
D<br>
E<br>
F<br>
G<br>
H<br>
I<br>
J<br>
K<br>
L<br>
M<br>
O<br>
P<br>
R<br>
S<br>
T<br>
U<br>
V<br>
W<br>
X<br>
0-9

## A

`ACL` stands for `Access Control List`.
In the Odoo context it is a table/rule that defines who can `read`, `write`, `create`, and `unlink` on a given model.
Where it appears:
- `05_ODOO_ОСНОВЕ_4h.md`
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`

`Action` is the Odoo UI wiring layer that connects a model, view, and menu so a user can actually open a given flow.
Where it appears:
- `05_ODOO_ОСНОВЕ_4h.md`
- `07_КАКО_СЕ_ЧИТА_ODOO_МОДУЛ_3h.md`
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`

`Addon` is an Odoo module package in the repo.
In the KomITi context these are e.g. `komiti_timesheet`, `komiti_project`, `komiti_dispatching`, `komiti_gantt`, and `komiti_academy`.
Where it appears:
- `02_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
- `06_АНАТОМИЈА_ДОБРОГ_ODOO_МОДУЛА_2h.md`
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`

`Apply` is a Terraform terminal command that applies the changes from a plan to actual infrastructure.
Where it appears:
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
- `../infra/aws/CODEX_TERRAFORM.md`

`Asset reset` is the discipline of refreshing frontend/website assets when a stale runtime state is still serving old JS/CSS/QWeb.
Where it appears:
- `02_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
- `12_ODOO_ЛИСТА_ПРОВЈЕРЕ_ЗА_ПРЕГЛЕД_КОДА_1h.md`
- `14_ODOO_ВЕБСАЈТ_И_КОРИСНИЧКИ_ИНТЕРФЕЈС_2h.md`

`AWS` stands for `Amazon Web Services`.
In this library it denotes the cloud layer on which the KomITi DEV/PROD runtimes live.
Where it appears:
- `00_END2END_ONBOARDING_ПУТ_УЧЕЊА_39-52w.md`
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
- `../infra/aws/CODEX_TERRAFORM.md`

## B

`Branch` is a Git line of development.
In the KomITi workflow it is important to distinguish feature, `staging`, and `main` branches and the promotion between them.
Where it appears:
- `00_END2END_ONBOARDING_ПУТ_УЧЕЊА_39-52w.md`
- `03_GIT_VSCODE_ОСНОВЕ_2h.md`
- `13_РАЗЛАГАЊЕ_ЗАДАТКА_И_РАЗМИШЉАЊЕ_О_ИСПОРУЦИ_2h.md`

## C

`Capstone` is the central hands-on project that the candidate builds throughout the onboarding.
In this library it is the `komiti_academy` module.
Where it appears:
- `00_END2END_ONBOARDING_ПУТ_УЧЕЊА_39-52w.md`
- `00_ОПИС_ПРОИЗВОДА_2h.md`
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`

`Caddy` is a reverse proxy/web server layer that appears in the infra/runtime context.
Where it appears:
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
- infra runbook documents under `../infra/`

`CLI` stands for `Command-Line Interface`.
It means working from a terminal through commands such as `docker compose`, `git`, `rg`, and `terraform`.
Where it appears:
- `02_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
- `03_GIT_VSCODE_ОСНОВЕ_2h.md`
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`

`CODEX` is the KomITi name for a canonical policy/discipline document for a given layer or domain.
Examples include `ENGINEERING_CODEX.md`, `custom-addons/CODEX_ODOO.md`, and `infra/aws/CODEX_TERRAFORM.md`.
Where it appears:
- `00_END2END_ONBOARDING_ПУТ_УЧЕЊА_39-52w.md`
- `02_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
- `../ENGINEERING_CODEX.md`

`Commit` is a Git snapshot of changes with a clear message explaining what was done.
Where it appears:
- `03_GIT_VSCODE_ОСНОВЕ_2h.md`
- `13_РАЗЛАГАЊЕ_ЗАДАТКА_И_РАЗМИШЉАЊЕ_О_ИСПОРУЦИ_2h.md`

`Compute field` is an Odoo field whose value is calculated from other fields or state.
Where it appears:
- `05_ODOO_ОСНОВЕ_4h.md`
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`

`Compose` in this library most often means the terminal command `docker compose` and the compose YAML that describes multiple services.
Where it appears:
- `02_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`

`Constraint` in the Odoo context most often means a server-side rule, frequently via `@api.constrains`.
Where it appears:
- `05_ODOO_ОСНОВЕ_4h.md`
- `10_ODOO_ПРИРУЧНИК_ЗА_ТЕСТИРАЊЕ_И_ПРОВЈЕРУ_3h.md`
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`

`Container` is a running instance of a Docker image.
Where it appears:
- `02_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`

`Context` is the Odoo runtime meta-layer for defaults, toggles, and auxiliary behavioural signals.
Where it appears:
- `05_ODOO_ОСНОВЕ_4h.md`
- `08_KOMITI_МАПА_ДОМЕНСКОГ_МОДЕЛА_2h.md`

`CSV` stands for `Comma-Separated Values`.
In the Odoo learning context it often appears as the `ir.model.access.csv` file for access rights.
Where it appears:
- `06_АНАТОМИЈА_ДОБРОГ_ODOO_МОДУЛА_2h.md`
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`

`Custom addon` is an Odoo module that is not upstream/core Odoo but a KomITi or project-specific extension.
Where it appears:
- `02_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
- `08_KOMITI_МАПА_ДОМЕНСКОГ_МОДЕЛА_2h.md`

## D

`Data source` is a Terraform construct for reading an existing resource without owning it.
Where it appears:
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`

`DB` is short for database — here most often the PostgreSQL database that Odoo uses.
Where it appears:
- `02_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
- `11_ODOO_БЕЗБЈЕДНОСТ_ПОДАТАКА_И_МИГРАЦИЈЕ_3h.md`

`Debugging` is the process of finding the root cause of a problem, not just its symptoms.
Where it appears:
- `00_END2END_ONBOARDING_ПУТ_УЧЕЊА_39-52w.md`
- `09_ODOO_ПРИРУЧНИК_ЗА_ОТКЛАЊАЊЕ_ГРЕШАКА_3h.md`

`Deploy` means releasing a change to a given runtime environment.
Where it appears:
- `13_РАЗЛАГАЊЕ_ЗАДАТКА_И_РАЗМИШЉАЊЕ_О_ИСПОРУЦИ_2h.md`
- `../ENGINEERING_CODEX.md`

`DNS` stands for `Domain Name System`.
It is the layer that maps a domain name to the actual host/IP endpoint.
Where it appears:
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`

`Docker` is a container runtime and packaging layer.
Where it appears:
- `00_END2END_ONBOARDING_ПУТ_УЧЕЊА_39-52w.md`
- `02_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`

`Domain` in the Odoo context means search/filter logic over a recordset.
In the broader KomITi context it can also mean a business domain, so the meaning is always read from context.
Where it appears:
- `05_ODOO_ОСНОВЕ_4h.md`
- `08_KOMITI_МАПА_ДОМЕНСКОГ_МОДЕЛА_2h.md`

`Drift` is the difference between what the Terraform state expects and what actually exists in the cloud runtime.
Where it appears:
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`

## E

`EC2` stands for `Elastic Compute Cloud`.
In practice it is the AWS virtual machine on which the runtime lives.
Where it appears:
- `00_END2END_ONBOARDING_ПУТ_УЧЕЊА_39-52w.md`
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`

`EIP` stands for `Elastic IP`.
It is a stable public IP address in AWS.
Where it appears:
- `00_END2END_ONBOARDING_ПУТ_УЧЕЊА_39-52w.md`
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`

`End2End` in the KomITi learning naming means the candidate goes through the entire path from foundations to independent delivery.
Where it appears:
- `00_END2END_ONBOARDING_ПУТ_УЧЕЊА_39-52w.md`
- `13_РАЗЛАГАЊЕ_ЗАДАТКА_И_РАЗМИШЉАЊЕ_О_ИСПОРУЦИ_2h.md`

`env` is the Odoo runtime accessor for models, the current user, the company, and the context.
Where it appears:
- `05_ODOO_ОСНОВЕ_4h.md`

`Engineering Codex` is the canonical repo-level policy document for way of working, verification, and delivery discipline.
Where it appears:
- `00_END2END_ONBOARDING_ПУТ_УЧЕЊА_39-52w.md`
- `02_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
- `../ENGINEERING_CODEX.md`

## F

`Feature branch` is a working Git branch on which a specific batch of changes is made before promotion to `staging` and `main`.
Where it appears:
- `03_GIT_VSCODE_ОСНОВЕ_2h.md`
- `13_РАЗЛАГАЊЕ_ЗАДАТКА_И_РАЗМИШЉАЊЕ_О_ИСПОРУЦИ_2h.md`

`Field` is an Odoo model attribute, e.g. `Char`, `Many2one`, `Selection`, or `Datetime`.
Where it appears:
- `05_ODOO_ОСНОВЕ_4h.md`
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`

`Form view` is an Odoo view for opening and editing a single record.
Where it appears:
- `05_ODOO_ОСНОВЕ_4h.md`
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`

## G

`Git` is a version control system used for branch, commit, merge, and promotion flow.
Where it appears:
- `00_END2END_ONBOARDING_ПУТ_УЧЕЊА_39-52w.md`
- `03_GIT_VSCODE_ОСНОВЕ_2h.md`

`Group` is an Odoo security concept for role/permission segmentation of users.
Where it appears:
- `05_ODOO_ОСНОВЕ_4h.md`
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`

## H

`Health check` is a quick verification that a service is actually running, e.g. `http://localhost:8069/web/health`.
Where it appears:
- `02_БРЗИ_ПОЧЕТАК_РАДА_1h.md`

`Hotfix` is a limited and fast fix for a specific production/runtime problem.
Where it appears:
- `00_END2END_ONBOARDING_ПУТ_УЧЕЊА_39-52w.md`
- `13_РАЗЛАГАЊЕ_ЗАДАТКА_И_РАЗМИШЉАЊЕ_О_ИСПОРУЦИ_2h.md`

## I

`Image` is a Docker template from which a container is created.
Where it appears:
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`

`Inheritance` in the Odoo context means extending an existing model or an existing XML view instead of building everything from scratch.
Where it appears:
- `05_ODOO_ОСНОВЕ_4h.md`
- `07_КАКО_СЕ_ЧИТА_ODOO_МОДУЛ_3h.md`

## J

`JS` stands for JavaScript.
In the Odoo/KomITi context it appears in the custom frontend/view layer such as `komiti_gantt`.
Where it appears:
- `07_КАКО_СЕ_ЧИТА_ODOO_МОДУЛ_3h.md`
- `14_ODOO_ВЕБСАЈТ_И_КОРИСНИЧКИ_ИНТЕРФЕЈС_2h.md`

## K

`Kanban` is one of the Odoo view types.
Where it appears:
- `05_ODOO_ОСНОВЕ_4h.md`
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`

`KomITi` is the organizational and project context of this repo, workflow, and learning library.
Where it appears:
- virtually all learning documents

## L

`Localhost` is the local development runtime environment on the developer's machine.
Where it appears:
- `02_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
- `10_ODOO_ПРИРУЧНИК_ЗА_ТЕСТИРАЊЕ_И_ПРОВЈЕРУ_3h.md`
- `../ENGINEERING_CODEX.md`

`Lock date` is a KomITi/Odoo study case frequently used to explain business rules, settings, and write discipline.
Where it appears:
- `02_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
- `05_ODOO_ОСНОВЕ_4h.md`
- `07_КАКО_СЕ_ЧИТА_ODOO_МОДУЛ_3h.md`

## M

`Manifest` is the Odoo file `__manifest__.py` that describes dependencies, data loading, and the basic identity of a module.
Where it appears:
- `06_АНАТОМИЈА_ДОБРОГ_ODOO_МОДУЛА_2h.md`
- `07_КАКО_СЕ_ЧИТА_ODOO_МОДУЛ_3h.md`
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`

`Merge` is a Git operation that joins the history and changes from one branch into another.
Where it appears:
- `03_GIT_VSCODE_ОСНОВЕ_2h.md`
- `13_РАЗЛАГАЊЕ_ЗАДАТКА_И_РАЗМИШЉАЊЕ_О_ИСПОРУЦИ_2h.md`

`Model` is an Odoo Python class that describes a business object.
Where it appears:
- `05_ODOO_ОСНОВЕ_4h.md`
- `06_АНАТОМИЈА_ДОБРОГ_ODOO_МОДУЛА_2h.md`
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`

`Module upgrade` is an Odoo terminal command and operational step by which the runtime loads module changes into the database and registry.
Where it appears:
- `02_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
- `05_ODOO_ОСНОВЕ_4h.md`
- `10_ODOO_ПРИРУЧНИК_ЗА_ТЕСТИРАЊЕ_И_ПРОВЈЕРУ_3h.md`

## O

`Odoo` is the framework and ERP platform on which this repo is based.
Where it appears:
- virtually all learning documents

`Onchange` is an Odoo UI helper pattern that modifies the form during input, but on its own is not sufficient as the sole business guarantee.
Where it appears:
- `05_ODOO_ОСНОВЕ_4h.md`
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`

`Output` is a Terraform output value that the stack displays after `apply`.
Where it appears:
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`

## P

`Plan` is a Terraform terminal command and the result of an analysis showing what will change if you run `apply`.
Where it appears:
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
- `../infra/aws/CODEX_TERRAFORM.md`

`PR` stands for `Pull Request`.
It is the review unit in which a change is presented, explained, and verified before a merge.
Where it appears:
- `00_END2END_ONBOARDING_ПУТ_УЧЕЊА_39-52w.md`
- `03_GIT_VSCODE_ОСНОВЕ_2h.md`

`Provider` is a Terraform plugin that gives Terraform the vocabulary and API bridge to a specific system, e.g. AWS.
Where it appears:
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`

## R

`Record rule` is an Odoo security mechanism that restricts which specific records a user can see or modify.
Where it appears:
- `05_ODOO_ОСНОВЕ_4h.md`
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`

`Recordset` is an Odoo collection of one or more records on which methods operate.
Where it appears:
- `05_ODOO_ОСНОВЕ_4h.md`
- `07_КАКО_СЕ_ЧИТА_ODOO_МОДУЛ_3h.md`

`Resource` is a Terraform object that Terraform manages throughout the infrastructure lifecycle.
Where it appears:
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`

`Reverse proxy` is a service that receives HTTP/HTTPS traffic and forwards it to the actual backend runtime.
Where it appears:
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
- infra compose/runbook documents under `../infra/`

`Rollout` is a planned release of a change to a runtime, with impact thinking and verification steps.
Where it appears:
- `13_РАЗЛАГАЊЕ_ЗАДАТКА_И_РАЗМИШЉАЊЕ_О_ИСПОРУЦИ_2h.md`

`Root cause` is the actual cause of a problem, not its surface-level symptom.
Where it appears:
- `00_END2END_ONBOARDING_ПУТ_УЧЕЊА_39-52w.md`
- `09_ODOO_ПРИРУЧНИК_ЗА_ОТКЛАЊАЊЕ_ГРЕШАКА_3h.md`

`Runbook` is an operational document that describes day-2 ops steps, verification, recovery, and routine procedures.
Where it appears:
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
- infra runbook documents under `../infra/`

`Runtime` is the actual running, live state of the system: processes, containers, database, loaded code, and behaviour that actually works.
Where it appears:
- `02_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
- `05_ODOO_ОСНОВЕ_4h.md`

## S

`Search view` is an Odoo view for filter and search controls in the UI.
Where it appears:
- `05_ODOO_ОСНОВЕ_4h.md`
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`

`Security group` is an AWS network firewall boundary for inbound/outbound rules.
Where it appears:
- `04_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
