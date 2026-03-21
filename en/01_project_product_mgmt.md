# Project And Product Management Roles

This document briefly explains what the key roles around a project and product are, what their responsibilities are, and how those roles map to specific artifacts in the learning library.

The purpose is not for the candidate to become a project manager or product manager, but to understand:
- who makes which type of decision,
- who defines the problem and scope,
- who drives delivery,
- who is the owner of operational stability and service governance,
- whom the developer addresses which type of question to,
- how those questions are distributed across the new canonical learning path: `00_ОПИС_ПРОИЗВОДА_2h.md` for product shape, `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md` for the overarching delivery/runtime mental model, and `04_ODOO_PLAN_UČENJA.md` for the Odoo-specific learning path.

## Contents

1\) Why these roles matter<br>
2\) Product Manager<br>
3\) Business Owner<br>
4\) Project Manager<br>
5\) Service Owner<br>
6\) How these roles appear in the `komiti_academy` example<br>
7\) How roles map to documents<br>
&nbsp;&nbsp;&nbsp;&nbsp;`00_ОПИС_ПРОИЗВОДА_2h.md`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`04_ODOO_PLAN_UČENJA.md`<br>
&nbsp;&nbsp;&nbsp;&nbsp;maintenance / support operating model<br>
8\) What a developer should learn from this<br>
9\) Roles in later maintenance<br>
10\) Short version in one sentence

## 1) Why these roles matter

A junior developer often confuses:
- who decides what the product should do,
- who decides when and how something goes into delivery,
- who is responsible for business value,
- who is responsible for planning and coordination,
- who is responsible for the system actually working in a production/service context.

That is why it is important to distinguish at least these four roles early on:
- Product Manager,
- Business Owner,
- Project Manager,
- Service Owner.

Important: there is no single, universal, worldwide standard for these roles that everyone uses identically.

There are:
- formal standards,
- body-of-knowledge sources,
- widely accepted frameworks,
- industry schools of practice.

Therefore it is more accurate to say:
- for the Project Manager role the strongest formal standards exist,
- for the Product Manager role frameworks and industry practice exist more than a single formal standard,
- for the Business Owner role organizational, governance, and delivery practice most often exists rather than a single canonical global standard,
- for the Service Owner role the strongest reference framework is the service management discipline, especially `ITIL`.

## 2) Product Manager

Product Manager is the owner of product shape.

He/she typically defines:
- which problem the product solves,
- who the users are,
- what the scope of the first version is,
- what is in-scope and what is out-of-scope,
- what acceptance criteria a feature or module has.

Product Manager does not have to be someone who knows the technical details of implementation, but must know:
- what the product should do,
- for whom it is being built,
- what success looks like from a user and functional perspective.

The most important reference sources are:
- `Scrum Guide` — but it formally defines `Product Owner`, not `Product Manager`,
- `SAFe` — defines roles such as `Product Manager` and `Product Owner` in a scaling context,
- `AIPMM` body of knowledge / certification model,
- `Pragmatic Institute` and similar product schools,
- `SVPG` (`Silicon Valley Product Group`) as a strong industry reference, although it is not a formal standard.

Practically:
- if you are looking for a formal agile reference text, you look at the `Scrum Guide`,
- if you are looking for an enterprise/framework definition of the Product Manager role, you look at `SAFe`,
- if you are looking for broader product management practice, you look at `AIPMM`, `Pragmatic`, `SVPG`.

Questions that Product Manager answers:
- "Should this flow even exist?"
- "Should the attendee see X or is that only for the manager?"
- "Is calendar view a must-have or a nice-to-have?"

## 3) Business Owner

Business Owner is the owner of business meaning and business priorities.

He/she typically knows:
- why this module is important for the organization,
- what the real operational/business problem is,
- what the business risk is if something does not work,
- which rule is a real business obligation and what is just a technical idea.

Business Owner does not have to write tickets or a product spec personally, but is often crucial for:
- confirming that the problem actually exists,
- confirming that the solution is business-meaningful,
- setting priorities.

The closest relevant sources are:
- `SAFe` — has an explicit `Business Owner` role,
- `BABOK` (`Business Analysis Body of Knowledge`) — does not define exactly the same `Business Owner` role, but describes the stakeholder/business responsibility perspective very well,
- governance and operating model practices in enterprise delivery environments,
- sometimes `ITIL` / service governance context, when it concerns ownership of a business service.

Practically:
- if someone asks where the `Business Owner` role is most explicitly named, a good answer is `SAFe`,
- if they are looking for a broader business/stakeholder responsibility context, then `BABOK` and governance practices are a closer source.

Questions that Business Owner answers:
- "Is the instructor actually allowed to be an attendee?"
- "Does the state `cancelled` have to exist?"
- "Is overbooking forbidden in all cases or are there exceptions?"

## 4) Project Manager

Project Manager is the owner of delivery coordination.

He/she typically drives:
- planning,
- work sequencing,
- dependency management,
- who does what and when,
- communication and handoff,
- rollout/promotion coordination when needed.

Project Manager does not necessarily define business rules, but ensures that delivery has:
- a realistic scope,
- an agreed sequence,
- status visibility,
- a clear handoff.

The most well-known sources are:
- `PMBOK` (`Project Management Body of Knowledge`) from `PMI`,
- `PRINCE2`,
- `ISO 21502` for project, programme and portfolio management guidance.

These sources typically clearly describe:
- planning, scope, risk, stakeholder, schedule, and governance responsibilities,
- how delivery is driven through formal project management language.

Practically:
- if someone is looking for the closest world standard for the `Project Manager` role, these are the strongest answers.

Questions that Project Manager answers:
- "What goes into this phase and what do we leave for phase 2?"
- "Does this have to be in the same release?"
- "What is the next checkpoint?"
- "When is the expected demo / verification / promotion?"

## 5) Service Owner

Service Owner is the owner of the operational service after the software is already in use.

He/she typically drives:
- service ownership in production,
- coordination with a 3rd party vendor or internal support team,
- SLA / OLA tracking,
- incident, problem, and request coordination,
- ensuring tickets are collected, triaged, and tracked,
- ensuring the service operates in accordance with ITIL/service management rules.

Service Owner does not define product shape like Product Manager, nor the delivery plan like Project Manager.
But is crucial when the system is already live and when it matters:
- that a support model exists,
- that the vendor fulfills contractual obligations,
- that escalations have an owner,
- that availability, support response, and operational quality are not left to chance.

The most important reference points are:
- `ITIL` service management practice model,
- `ISO/IEC 20000` as a formal service management standard,
- `COBIT` for IT governance, controls, and management objectives,
- `SIAM` (`Service Integration and Management`) for multi-vendor service coordination,
- enterprise vendor/SLA governance practices,
- incident, problem, change, service level, and supplier management discipline,
- `SRE` and `DevOps` practices as a strong operational model reference, even though they are not the same type of standard as `ITIL`.

Practically:
- if someone is looking for the most well-known framework for this role, the first answer is `ITIL`,
- if they are looking for a formal standard for a service management system, then it is `ISO/IEC 20000`,
- if they are looking for a governance/control lens, then `COBIT` is important,
- if they are looking for an operating model for multiple external vendors, then `SIAM` is very important,
- if they are looking for modern operational reliability practice, then `SRE` and `DevOps` are relevant.

Questions that Service Owner answers:
- "Who tracks whether the external vendor is actually meeting the SLA?"
- "Who owns incident coordination when production goes down?"
- "Who runs the service review and recurring operational problems?"
- "Who collects tickets and ensures the support process actually works?"

## 6) How these roles appear in the `komiti_academy` example

On the `komiti_academy` module it roughly looks like this:

- Product Manager defines that the module should cover course + session flow, manager/instructor/attendee actors, and basic search/filter.
- Business Owner confirms that seats, overbooking, instructor/attendee separation, and session lifecycle are truly important business rules.
- Project Manager drives the work so that the skeleton is done first, then MVP, then business rules, then verification/documentation, instead of everything happening chaotically all at once.
- Service Owner would, once the module enters production usage, own the support model, ticket intake, vendor/SLA coordination, and operational review.

In the new learning path the candidate should also read documents this way:

- `00_ОПИС_ПРОИЗВОДА_2h.md` tells you what `komiti_academy` should be as a product.
- `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md` tells you in which system/runtime/delivery context that product actually lives and how not to confuse project, infra, runtime, and application problems.
- `04_ODOO_PLAN_UČENJA.md` tells you the Odoo sequence in which you learn backend, views, security, testing, frontend, and integration.

The practical rule for the candidate is:
- if you do not understand what the problem is and where it lives, first look at the product description and `03_...`;
- if you already know the question is purely about Odoo implementation learning, then look at `04_ODOO_PLAN_UČENJA.md`.

## 7) How roles map to documents

This is the minimal mapping across learning artifacts:

### `00_ОПИС_ПРОИЗВОДА_2h.md`
- Document Owner: Product Manager
- Accountable for business correctness: Business Owner
- Consulted for delivery sequencing: Project Manager

Why:
- this is the document that describes what the product is, who uses it, and which problem it solves.

### `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
- Document Owner: Project Manager (delivery/runtime mental model context)
- Product input: Product Manager (the functional flow must be understandable in delivery reasoning as well)
- Business context: Business Owner (when a runtime decision has business impact)

Why:
- this is the document that describes how the entire system works: which problem you classify where, how delivery is composed of AWS, Docker, Terraform, and Odoo together, and why you must distinguish product/project/infra/runtime/application reasoning.

### `04_ODOO_PLAN_UČENJA.md`
- Document Owner: Project Manager (Odoo learning path sequencing)
- Product input: Product Manager (functional requirements determine which Odoo topics are a priority)

Why:
- this is the canonical Odoo learning path document and serves as a roadmap for Odoo backend, views, security, testing, frontend, and integration.

### maintenance / support operating model
- Document Owner: Service Owner
- Input from: Product Manager, Business Owner, Project Manager

Why:
- when the software transitions to production, Service Owner is responsible for ticket intake, vendor coordination, SLA, and operational review.

## 8) What a developer should learn from this

- When you are not sure whether a feature should exist, you address the question to Product Manager.
- When you are not sure whether something is truly a business rule, you address the question to Business Owner.
- When you are not sure whether the delivery should go out in this release, you address the question to Project Manager.
- When you are not sure whether an incident or ticket has an owner and whether the SLA process works, you address the question to Service Owner.
- When you are not sure in which system or layer the problem lives, first read `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md` to distinguish delivery/infra/runtime/application/functional domain.
- Do not assume scope or rules. Document what you know and what you assume.

## 9) Roles in later maintenance

When the module lives in production, the roles still make sense:
- Product Manager evaluates whether a new feature request makes sense.
- Business Owner confirms business impact and priority.
- Project Manager coordinates release and handoff.
- Service Owner drives operational stability, incident response, and SLA.
- Developer delivers changes per `ENGINEERING_CODEX.md` standards, with a verification note and clean handoff.

## 10) Short version in one sentence

- **Product Manager**: defines what the product should do and for whom.
- **Business Owner**: confirms why it matters and whether the business rules make sense.
- **Project Manager**: coordinates when, how, and in what sequence delivery happens.
- **Service Owner**: ensures the system in production actually works, that a support model exists, and that SLA obligations are met.
