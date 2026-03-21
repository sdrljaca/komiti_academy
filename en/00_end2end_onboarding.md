# KomITi End2End Onboarding Learning Path (0 -> Professional)

Document Owner: Project Manager
Product Scope Input: Product Manager
Business Context Input: Business Owner

Document objective: This is the umbrella document for the entire set of documents in the `komiti_academy` learning library. The goal of the library is to take a Candidate from a complete beginner to an independent Odoo/Python engineer in the KomITi way of working:
- KomITi engineering way of working,
- KomITi branch / promotion / documentation discipline,
- KomITi custom modules and business flows,
- the approach to diagnosis, testing and delivery of changes in this repo.

Throughout the entire onboarding there is also one ongoing final practical project that is built across all phases:
- the participant gradually builds their first module `komiti_academy`,
- each phase adds a new layer to that module,
- by the end of the learning path the module must be complete, tested and documented,
- the participant works on their version of the project in their own GitHub repo `komiti_academy_ime_polaznika`,
- the main product description is in `00_ОПИС_ПРОИЗВОДА_2h.md`,
- the main foundations/delivery mental model for the entire system is in `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`,
- the main Odoo learning path and execution sequence for the Odoo-only topic are in `04_ODOO_PLAN_UČENJA.md`,
- old AI Odoo materials have been moved to `xxx_odoo_tutorijali_AI_pravio_arhiva/` and are no longer the canonical learning path.

## Table of Contents

1\) How to use documents in this komiti_academy repo<br>
2\) Project plan<br>
3\) Phase A — Foundations (weeks 1–4)<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.1 Objective<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.2 Topics<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.3 Pass Criteria<br>
4\) Phase B — Guided Odoo Development (weeks 5–8)<br>
&nbsp;&nbsp;&nbsp;&nbsp;4.1 Objective<br>
&nbsp;&nbsp;&nbsp;&nbsp;4.2 Topics<br>
&nbsp;&nbsp;&nbsp;&nbsp;4.3 Pass Criteria<br>
5\) Phase C — Independent Delivery (weeks 9–12)<br>
&nbsp;&nbsp;&nbsp;&nbsp;5.1 Objective<br>
&nbsp;&nbsp;&nbsp;&nbsp;5.2 Topics<br>
&nbsp;&nbsp;&nbsp;&nbsp;5.3 Pass Criteria<br>
6\) Phase D — Professional Growth (months 4–12)<br>
&nbsp;&nbsp;&nbsp;&nbsp;6.1 Objective<br>
&nbsp;&nbsp;&nbsp;&nbsp;6.2 Topics<br>
&nbsp;&nbsp;&nbsp;&nbsp;6.3 Exit Outcome<br>
7\) Daily/weekly learning rhythm<br>
8\) Progress checks (checkpoints)<br>
9\) Definition of Done for "0 -> pro"<br>
10\) Note

## 1) How to use documents in this komiti_academy repo

The order is not accidental. Reading progresses from a complete beginner to a worker who understands both Odoo and the KomITi way of working:
1. you read what the product you will build through this course will look like
  - document: `00_ОПИС_ПРОИЗВОДА_2h.md`,
2. first you learn the basic concepts,
  - documents: `01_УПРАВЉАЊЕ_ПРОЈЕКТОМ_И_ПРОИЗВОДОМ_2h.md`, `02_GIT_VSCODE_ОСНОВЕ_2h.md`, `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
3. then through `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md` you adopt the umbrella mental model for the entire delivery system,
  - rule: whenever you are unsure whether the question is product, project, infra, runtime or application, first go back to `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
4. then you build the Odoo foundation through the canonical Odoo plan,
  - document: `04_ODOO_PLAN_UČENJA.md`
5. then you learn the KomITi module/domain reality,
  - documents: `../custom-addons/komiti_timesheet/CODEX_ODOO_KOMITI_TIMESHEET.md`, `../custom-addons/komiti_gantt/CODEX_ODOO_KOMITI_GANTT.md`
6. only then do you read the policy/codex layer at full capacity,
  - documents: `../custom-addons/CODEX_ODOO.md`, `../ENGINEERING_CODEX.md`, `../SESSION_NOTES.md`
7. only after that do you enter debugging, testing, rollout and infra discipline.
  - documents: `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`, `04_ODOO_PLAN_UČENJA.md`, `../custom-addons/CODEX_ODOO.md`, `../ENGINEERING_CODEX.md`, `../SESSION_NOTES.md`, `../infra/aws/CODEX_TERRAFORM.md`, `../infra/aws/odoo-dev-ec2-compose/RUNBOOK.md`

The archive `xxx_odoo_tutorijali_AI_pravio_arhiva/` remains only as historical/supplementary material. It is no longer treated as a mandatory onboarding path.

If while reading you encounter a term or acronym that is unclear, use the appendix document `99_РЈЕЧНИК_АКРОНИМА.md` as a quick index of terms and a pointer to the main documents where that concept is covered in more detail.

## 2) Project plan

For a candidate with no prior programming experience the realistic range is 39–52 weeks; here that same time frame is shown through the scope that needs to be delivered in each phase:
- Junior: Basic operational independence: 12 weeks (8–10 weeks only in accelerated mode=
  1.1) Phase A — Foundations (weeks 1–4): 
      delivery of basic understanding of the workflow, local environment, Odoo basics and the first `komiti_academy` skeleton.
  1.2) Phase B — Guided Odoo Development (weeks 5–8): 
      delivery of an installable MVP with models, relations, views, action/menu layer and basic security.
  1.3) Phase C — Independent Delivery (weeks 9–12):
      delivery of business rules, verification notes, docs delta and a clear Definition of Done status for `komiti_academy`.

- Mid-level work on the project: 4–8 months
  1.4) Early and middle part of Phase D — Professional Growth (months 4–8): 
      delivery of a more stable, cleaner and review-safe module that the candidate can independently maintain, extend and defend through review.

- Senior: Independently leads more complex changes end-to-end: 9–12 months
  1.5) Later part of Phase D — Professional Growth (months 9–12): 
      delivery of a mature version of `komiti_academy` as personal proof that the candidate can lead a more complex scope, rollout and handoff with almost no supervision.

Tasks in the project
While reading the `komiti_academy` learning library, you get the foundations/delivery mental model for all areas from `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`, the main Odoo tasks from `04_ODOO_PLAN_UČENJA.md`, and KomITi-specific implementation, review and delivery tasks from the product/codex documents.

When you want to see all tasks leading to a complete `komiti_academy` in a single reading, use these references:

- `02_GIT_VSCODE_ОСНОВЕ_2h.md`: Git tasks for feature branch, clean commit and push discipline, with guidance from the workflow chapter.
- `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`: canonical foundations/delivery document for the entire system; here you learn how to distinguish product, project, infra, runtime and application reasoning, how AWS/Docker/Terraform/Odoo form a single flow and how not to mix classes of problems.
- `04_ODOO_PLAN_UČENJA.md`: canonical Odoo tasks from setup and first module to testing, frontend, integration and OCA reading.
- `00_ОПИС_ПРОИЗВОДА_2h.md`: product scope and functional objectives that `komiti_academy` must cover.
- `../custom-addons/CODEX_ODOO.md`: implementation, security, testing and documentation discipline for real KomITi Odoo work.
- `../custom-addons/komiti_timesheet/CODEX_ODOO_KOMITI_TIMESHEET.md`: ORM/domain tasks on a real module.
- `../custom-addons/komiti_gantt/CODEX_ODOO_KOMITI_GANTT.md`: view/UI tasks on a real module.
- `../ENGINEERING_CODEX.md`: delivery, branch/promotion and hotfix discipline.
- `../SESSION_NOTES.md`: handoff, verification note and operational evidence.

## 3) Phase A — Foundations (weeks 1–4)

### 3.1 Objective

The candidate should understand the basics of programming, Git, SQL and the local Odoo workflow.

### 3.2 Topics

- Python basics: types, functions, conditions, loops, errors
  - there is no separate Python-only document in this phase;
  - Python basics are mostly reinforced through `04_ODOO_PLAN_UČENJA.md`
    - On the `komiti_academy` skeleton identify which fields are input, which are derived, and where you expect business rule Python logic
    - Through `Server framework 101` find one Python model class and explain the imports, class, method and one condition or loop if they exist
    - Read one simple Python method in a module and explain what the parameters, conditions, recordset loop and return value do in it
- Git basics: branch, commit, merge, pull request
  - operational context from `02_GIT_VSCODE_ОСНОВЕ_2h.md`
    - Clone the repo `komiti_academy_ime_polaznika` locally
  - `02_GIT_VSCODE_ОСНОВЕ_2h.md`
    - Open your account on GitHub and subscribe to the GitCopilot service
    - Create your GitHub repo `komiti_academy_ime_polaznika`
    - Create a micro PR that changes documentation
- SQL basics: SELECT, JOIN, WHERE, GROUP BY
  - there is no separate SQL-only document in this phase; 
  - SQL reasoning is practiced alongside `04_ODOO_PLAN_UČENJA.md`
    - Write 5 SQL queries against the local database (with explanation of results)
  - data/model context from `04_ODOO_PLAN_UČENJA.md`
    - Explain the results of those SQL queries through Odoo data/model context
- Project/Product foundations: scope, owners, sequencing, problem framing
  - `01_УПРАВЉАЊЕ_ПРОЈЕКТОМ_И_ПРОИЗВОДОМ_2h.md`
    - Explain the difference between Product Manager, Business Owner, Project Manager and Service Owner
  - `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
    - Explain why a delivery problem is not the same as an infra problem, and why a runtime issue is not automatically an Odoo bug
- AWS basics: EC2, security group, VPC, EIP, DNS thinking
  - documents: `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
    - Explain on one short example how an EC2 host, security group, public IP address and DNS are connected into a single runtime path to the Odoo service
- Docker basics: container, image, `docker compose`
  - `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
    - Bring up the local environment from the repo `komiti_academy_ime_polaznika`
    - Explain the difference between image, container, volume and compose wiring
- Terraform basics: provider, resource, variables, state, `plan`/`apply`
  - `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
    - Design a minimal Terraform lab for the `komiti_academy` dev runtime and explain the role of `provider`, `resource`, `variables`, `state`, `plan` and `apply` in that lab
- Odoo basics: model, view, action, security, module upgrade
  - `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
    - Explain where Odoo sits in the system/runtime flow and how to distinguish an infra/runtime problem from an Odoo functional problem
  - `04_ODOO_PLAN_UČENJA.md`
    - Go through `Setup guide`, `Server framework 101`, `Define module data`, `Restrict access to data` and `Safeguard your code with unit tests`
    - Create a skeleton for `komiti_academy`
    - Modify one label/field in an Odoo view and run a module upgrade
    - note: the same document later serves as the main Odoo roadmap for the final project checkpoints

### 3.3 Pass Criteria

- Can independently bring up the local environment
- Understands where `ENGINEERING_CODEX`, `custom-addons/CODEX_ODOO`, `SESSION_NOTES` and `00_END2END_ONBOARDING_ПУТ_УЧЕЊА_39-52w.md` are located
- Has created at least 1 clean PR following the standard
- `komiti_academy` skeleton exists and can be explained without guessing

## 4) Phase B — Guided Odoo Development (weeks 5–8)

### 4.1 Objective

The candidate should be able to implement a small feature with mentor review.

### 4.2 Topics

- Odoo ORM (fields, compute, related)
  - `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
    - Keep `03_...` as the canonical reference so you do not confuse an ORM change with the runtime/infra layer
  - `04_ODOO_PLAN_UČENJA.md`
    - Go through `ORM API`, `Server framework 101` and the corresponding chapters for relations, compute and onchange
  - `../custom-addons/komiti_timesheet/CODEX_ODOO_KOMITI_TIMESHEET.md`
    - Bring `komiti_academy` to an installable MVP at the model and basic flow level
    - Perform one ORM change on the `komiti_timesheet` model and explain why it is a `fields/compute/related` problem
- XML view inheritance (xpath, stable anchors)
  - `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
    - When the UI does not work, first distinguish whether the problem is runtime/startup, routing/proxy, or actually an XML/Odoo view problem
  - `04_ODOO_PLAN_UČENJA.md`
    - Go through `View records`, `View architectures` and the backend/UI parts of `Server framework 101`
  - `../custom-addons/komiti_gantt/CODEX_ODOO_KOMITI_GANTT.md`
    - Perform one change in a list/form/calendar view with a stable xpath anchor
  - `../custom-addons/CODEX_ODOO.md`
    - Bring `komiti_academy` to an installable MVP at the views, actions and menu level
- Access rules / groups / security
  - `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
    - Know that application security is not the same as network/security-group boundary
  - `04_ODOO_PLAN_UČENJA.md`
    - Go through `Access Rights`, `Record Rules`, `Field Access` and `Security Pitfalls`
  - `../custom-addons/CODEX_ODOO.md`
    - Fix one permission behavior in an existing module
    - Bring `komiti_academy` to an installable MVP at the basic security level
- Testing UI flows by roles
  - `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
    - Before role-based UI testing confirm that the runtime is healthy and that the problem is not in the infra/startup layer
  - `04_ODOO_PLAN_UČENJA.md`
    - Go through `Testing Python code` and `Integration Testing`
  - `../custom-addons/CODEX_ODOO.md`
    - Create a smoke test record for `employee/manager/admin`
- Documentation after implementation
  - `../custom-addons/CODEX_ODOO.md`
    - Document what was done and what was manually verified for the `komiti_academy` MVP

### 4.3 Pass Criteria

- 2–3 merged PRs without critical regressions
- Independently follows the `staging -> main` flow with mentor confirmation
- `komiti_academy` installs, opens in the UI and covers the basic flow course -> session

## 5) Phase C — Independent Delivery (weeks 9–12)

### 5.1 Objective

The candidate should deliver a smaller task independently end-to-end.

### 5.2 Topics

- Root-cause debugging
  - `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
    - Use it as the first document for classifying problems: infra, runtime, application, functional flow
  - `04_ODOO_PLAN_UČENJA.md`
    - Use `Reference`, `Profiling`, `Good practices` and the relevant backend/frontend reference pages as a working tool during diagnosis
  - `../custom-addons/CODEX_ODOO.md`
    - Independently close 1 quickfix and briefly explain the root cause
- Hotfix discipline
  - `../ENGINEERING_CODEX.md`
    - Independently close 1 feature task following the KomITi delivery standard
    - Independently close 1 quickfix without violating hotfix discipline
  - `../SESSION_NOTES.md`
    - Write a handoff note for the delivered change
- Release checklist (pre/deploy/post)
  - `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
    - Use it as the canonical basis for reasoning about the runtime, the plan/apply cycle and distinguishing deploy problems from Odoo verification problems
  - `04_ODOO_PLAN_UČENJA.md`
    - Rely on the testing/reference/how-to sections as the basis for verification
  - `../custom-addons/CODEX_ODOO.md`
    - Perform a post-deploy smoke
    - Complete the verification note for `komiti_academy`
  - `../SESSION_NOTES.md`
    - Record the smoke result and handoff
- Change impact analysis
  - `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
    - In impact reasoning first separate the system/runtime impact from the pure Odoo feature impact
  - `../ENGINEERING_CODEX.md`
    - Independently close 1 feature task with clear impact reasoning
    - Complete business rules and docs delta for `komiti_academy`

### 5.3 Pass Criteria

- Independently implements, tests, documents and deploys a smaller task
- Can explain why something is a root cause, not a symptom
- `komiti_academy` has manual verification proof and a clear Definition of Done status

## 6) Phase D — Professional Growth (months 4–12)

### 6.1 Objective

The candidate should become a stable owner of a part of the system.

### 6.2 Topics

- Advanced Odoo patterns
  - `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
    - Even in advanced Odoo changes keep it as the canonical document for the system mental model and problem classification
  - `04_ODOO_PLAN_UČENJA.md`
    - Go through `Discover the web framework`, `Master the web framework`, `Customize a field`, `Customize a view type`, `Create a client action`, `Website themes` and `Web Services`
    - Perform one more advanced UI/website change and explain why it is not just a basic view change
  - `../custom-addons/CODEX_ODOO.md`
    - Perform one more advanced UI/website change and explain why it is not just a basic view change
  - `04_ODOO_PLAN_UČENJA.md`
    - Extend `komiti_academy` with one more advanced Odoo pattern that requires an independent design choice and review reasoning
- Pipeline architecture (Fabrick)
  - `../infra/aws/CODEX_TERRAFORM.md`
    - Explain the architecture/pipeline layer and state which changes go through Terraform discipline and which do not
  - `../infra/aws/odoo-dev-ec2-compose/RUNBOOK.md`
    - Simulate one operational scenario and describe which runbook steps would come first
- Performance and data quality
  - `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
    - Distinguish a performance problem at the host/container/runtime layer from a performance problem in the Odoo ORM/UI layer
  - `04_ODOO_PLAN_UČENJA.md`
    - Go through `Profiling`, `Good practices`, `Upgrade a customized database` and `OpenUpgrade`
    - On one example explain data quality risk, migration risk and how you would verify that before releasing a change
- Incident response and technical leadership of smaller initiatives
  - `../ENGINEERING_CODEX.md`
    - Independently review one more complex change following the checklist and record findings
  - `04_ODOO_PLAN_UČENJA.md`
    - Choose several exercises/practical artifacts that lead toward technical leadership and connect them with the next steps on `komiti_academy`

### 6.3 Exit Outcome

- Leads more complex changes with minimal supervision
- Creates a technical plan, estimate and rollout strategy
- Mentors a new junior team member
- Has a completed `komiti_academy` as personal proof of being able to build an Odoo module end-to-end

## 7) Daily/weekly learning rhythm

- **Daily (2–3h focused learning):**
  - 45 min theory
  - 90 min practical code/task
  - 15 min journaling (what was learned)

- **Weekly:**
  - 1 mentor review meeting (60–90 min)
  - 1 mini demo of completed work
  - 1 retrospective: what was hard, what we change

## 8) Progress checks (checkpoints)

- **Day 14:** local environment + first PR
- **Day 30:** one small Odoo task with review
- **Day 60:** independent quickfix + smoke test
- **Day 90:** independent end-to-end task in the KomITi workflow
- **Month 6:** stable mid-level delivery
- **Month 12:** professional level for most Odoo/KomITi tasks

Final project checkpoints:
- **Day 14:** `komiti_academy` skeleton
- **Day 30:** installable MVP
- **Day 60:** business rules + negative tests
- **Day 90:** documentation + verification + clean handoff

## 9) Definition of Done for "0 -> pro"

The candidate is considered a "professional" when:
- Independently delivers feature/quickfix with quality
- Independently performs root-cause debugging
- Independently manages `staging -> main` promotion with verification
- Writes clear documentation and handoff
- Does not violate KomITi standards from `ENGINEERING_CODEX.md`
- Has one own module `komiti_academy` that has passed the install, upgrade, verification and documentation cycle

## 10) Note

This plan is realistic and ambitious. The key to success: continuity, mentor feedback and work on real tasks, not just theory.

Learning documents in the root of the `komiti_academy` repo are not a generic Odoo course, but a KomITi-centered curriculum. The canonical foundations/delivery document for the entire system is now `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`, the canonical Odoo learning document is `04_ODOO_PLAN_UČENJA.md`, while `xxx_odoo_tutorijali_AI_pravio_arhiva/` is only archival material. A new team member through this set simultaneously learns:
- Odoo basics,
- KomITi modules,
- KomITi engineering discipline,
- the way of thinking expected in real delivery.
