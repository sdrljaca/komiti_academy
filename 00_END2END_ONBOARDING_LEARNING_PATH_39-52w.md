# KomITi End2End Onboarding Learning Path (0 -> Professional)

Document Owner: Project Manager
Product Scope Input: Product Manager
Business Context Input: Business Owner

Кандидат: нови члан тима  
Циљ: од потпуног почетника до самосталног Odoo/Python инжењера у KomITi начину рада.

Ово је канонски onboarding и learning документ. Служи истовремено као:
- roadmap учења,
- reading order,
- index learning библиотеке,
- објашњење шта сваки learning документ ради.

Кроз цијели onboarding постоји и једна трајна capstone нит:
- полазник постепено гради свој први модул `komiti_academy`,
- свака фаза додаје нови слој тог модула,
- до краја learning path-а модул мора бити готов, истестиран и документован,
- канонски product/project description је у `00_PROJECT_PRODUCT_DESCRIPTION_2h.md`,
- канонска capstone спецификација и execution plan су у `16_CAPSTONE_BUILD_YOUR_OWN_ODOO_MODULE_16h.md`.

Циљ овог сета није само да објасни Odoo, већ да нови члан тима кроз учење одмах усвоји:
- KomITi engineering начин рада,
- KomITi branch / promotion / documentation дисциплину,
- KomITi custom модуле и пословне flow-ове,
- начин дијагнозе, тестирања и испоруке измјена у овом репоу.

## 1) Реалан временски оквир

За кандидата без претходног програмерског искуства, реалан распон је:
- **Основна оперативна самосталност:** 8–12 седмица
- **Стабилан mid-level рад на пројекту:** 4–6 мјесеци
- **Професионалац који сам води сложеније измјене end-to-end:** 9–12 мјесеци

> Напомена: брзина зависи од менторске подршке, времена за вјежбу и броја реалних таскова.

## 2) Како се користи овај документ

Редослијед није случајан. Читање иде од потпуног почетника ка човјеку који разумије и Odoo и KomITi начин рада.

Значи:

1. прво учиш основне појмове,
  - документи: `00_PROJECT_PRODUCT_DESCRIPTION_2h.md`, `01_PROJECT_PRODUCT_MANAGEMENT_1h.md`, `02_DEVELOPER_QUICKSTART_1h.md`, `03_GIT_VSCODE_FOUNDATIONS_2h.md`, `04_INFRA_TERRAFORM_DOCKER_AWS_FOUNDATIONS_4h.md`, `05_ODOO_FOUNDATIONS_4h.md`
2. онда учиш како се чита модул и систем,
  - документи: `06_ANATOMY_OF_A_GOOD_ODOO_MODULE_2h.md`, `07_HOW_TO_READ_AN_ODOO_MODULE_3h.md`
3. онда учиш KomITi module/domain стварност,
  - документи: `08_KOMITI_DOMAIN_MODEL_MAP_2h.md`, `../custom-addons/komiti_timesheet/CODEX_ODOO_KOMITI_TIMESHEET.md`, `../custom-addons/komiti_gantt/CODEX_ODOO_KOMITI_GANTT.md`
4. тек онда читаш policy/codex слој пуним капацитетом,
  - документи: `../custom-addons/CODEX_ODOO.md`, `../ENGINEERING_CODEX.md`, `../SESSION_NOTES.md`
5. тек послије тога улазиш у debugging, testing, rollout и infra discipline.
  - документи: `09_ODOO_DEBUGGING_PLAYBOOK_3h.md`, `10_ODOO_TESTING_AND_VERIFICATION_HANDBOOK_3h.md`, `11_ODOO_DATA_AND_MIGRATION_SAFETY_3h.md`, `12_ODOO_CODE_REVIEW_CHECKLIST_1h.md`, `13_TASK_BREAKDOWN_AND_ROLLOUT_THINKING_2h.md`, `14_ODOO_WEBSITE_AND_FRONTEND_2h.md`, `15_PRACTICE_LADDER_20_EXERCISES_40h.md`, `16_CAPSTONE_BUILD_YOUR_OWN_ODOO_MODULE_16h.md`, `../infra/aws/CODEX_TERRAFORM.md`, `../infra/aws/odoo-dev-ec2-compose/RUNBOOK.md`

Ако током читања наиђеш на појам или акроним који ти није јасан, користи appendix документ `99_DICTIONARY_ACROMINS.md` као брзи индекс термина и упуту ка главним документима гдје је тај појам детаљније обрађен.

## 3) Фаза A — Foundations (седмице 1–4)

### 3.1 Циљ

Кандидат да разумије основе програмирања, Git-а, SQL-а и локалног Odoo workflow-а.

### 3.2 Теме

- Python основе: типови, функције, услови, петље, грешке
- Git основе: branch, commit, merge, pull request
- SQL основе: SELECT, JOIN, WHERE, GROUP BY
- AWS основе: EC2, security group, VPC, EIP, DNS thinking
- Docker основе: контејнер, image, `docker compose`
- Terraform основе: provider, resource, variables, state, `plan`/`apply`
- Odoo основе: model, view, action, security, module upgrade

### 3.2.1 Документи за ову фазу

- `02_DEVELOPER_QUICKSTART_1h.md`
- `03_GIT_VSCODE_FOUNDATIONS_2h.md`
- `04_INFRA_TERRAFORM_DOCKER_AWS_FOUNDATIONS_4h.md`
- `05_ODOO_FOUNDATIONS_4h.md`
- `06_ANATOMY_OF_A_GOOD_ODOO_MODULE_2h.md`
- `07_HOW_TO_READ_AN_ODOO_MODULE_3h.md`

### 3.3 Практични задаци

- Подигнути локално окружење из репоа
- Направити micro PR који мијења документацију
- Написати 5 SQL упита над локалном базом (уз објашњење резултата)
- Измјенити један label/field у Odoo view-у и пустити module upgrade
- Направити skeleton за `komiti_academy` према `16_CAPSTONE_BUILD_YOUR_OWN_ODOO_MODULE_16h.md`

### 3.4 Критеријум пролаза

- Може сам да подигне локално окружење
- Разумије где су `ENGINEERING_CODEX`, `custom-addons/CODEX_ODOO`, `SESSION_NOTES` и `learning/00_END2END_ONBOARDING_LEARNING_PATH_39-52w.md`
- Направио бар 1 чист PR по стандарду
- `komiti_academy` skeleton постоји и може бити објашњен без нагађања

## 4) Фаза B — Guided Odoo Development (седмице 5–8)

### 4.1 Циљ

Кандидат да умије да имплементира мали feature уз менторски review.

### 4.2 Теме

- Odoo ORM (fields, compute, related)
- XML view inheritance (xpath, стабилни anchor-и)
- Access rules / групе / security
- Тестирање UI flow-а по role-ама
- Документација након имплементације

### 4.2.1 Документи за ову фазу

- `08_KOMITI_DOMAIN_MODEL_MAP_2h.md`
- `../custom-addons/komiti_timesheet/CODEX_ODOO_KOMITI_TIMESHEET.md`
- `../custom-addons/komiti_gantt/CODEX_ODOO_KOMITI_GANTT.md`
- `../custom-addons/CODEX_ODOO.md`

### 4.3 Практични задаци

- Једна измјена у `komiti_timesheet` моделу
- Једна измјена у list/form/calendar view-у
- Једна исправка permission понашања
- Smoke test записник за `employee/manager/admin`
- Довести `komiti_academy` до installable MVP-а: model-и, view-ови, action/menu, basic security

### 4.4 Критеријум пролаза

- 2–3 merge-ована PR-а без критичних regression-а
- Samostalno прати `dev -> prod` flow уз менторску потврду
- `komiti_academy` се инсталира, отвара у UI-ју и покрива основни flow course -> session

## 5) Фаза C — Independent Delivery (седмице 9–12)

### 5.1 Циљ

Кандидат да испоручује мањи task самостално end-to-end.

### 5.2 Теме

- Root-cause debugging
- Hotfix дисциплина
- Release checklist (pre/deploy/post)
- Анализа impact-а измјена

### 5.2.1 Документи за ову фазу

- `09_ODOO_DEBUGGING_PLAYBOOK_3h.md`
- `10_ODOO_TESTING_AND_VERIFICATION_HANDBOOK_3h.md`
- `13_TASK_BREAKDOWN_AND_ROLLOUT_THINKING_2h.md`
- `../ENGINEERING_CODEX.md`
- `../SESSION_NOTES.md`

### 5.3 Практични задаци

- Самостално затвара 1 feature task
- Самостално затвара 1 quickfix
- Ради post-deploy smoke и пише handoff note
- Завршава business rules, verification note и docs delta за `komiti_academy`

### 5.4 Критеријум пролаза

- Самостално имплементира, тестира, документује и пушта мањи task
- Може објаснити зашто је нешто root-cause, а не симптом
- `komiti_academy` има manual verification proof и јасан Definition of Done status

## 6) Фаза D — Professional Growth (мјесеци 4–12)

### 6.1 Циљ

Кандидат да постаје стабилан носилац дијела система.

### 6.2 Фокус

- Напредни Odoo patterns
- Архитектура pipeline-а (Fabrick)
- Performance и data quality
- Incident response и техничко вођство мањих иницијатива

### 6.2.1 Документи за ову фазу

- `11_ODOO_DATA_AND_MIGRATION_SAFETY_3h.md`
- `12_ODOO_CODE_REVIEW_CHECKLIST_1h.md`
- `14_ODOO_WEBSITE_AND_FRONTEND_2h.md`
- `15_PRACTICE_LADDER_20_EXERCISES_40h.md`
- `16_CAPSTONE_BUILD_YOUR_OWN_ODOO_MODULE_16h.md`
- `../infra/aws/CODEX_TERRAFORM.md`
- `../infra/aws/odoo-dev-ec2-compose/RUNBOOK.md`

### 6.3 Излазни исход

- Води сложеније измјене са минималним надзором
- Прави технички план, процјену и rollout стратегију
- Менторише новог junior члана
- Има завршен `komiti_academy` као лични доказ да умије направити Odoo модул end-to-end

## 7) Дневни/седмични ритам учења

- **Дневно (2–3h фокус учења):**
  - 45 мин теорија
  - 90 мин практичан код/задатак
  - 15 мин journaling (шта је научено)

- **Седмично:**
  - 1 менторски review састанак (60–90 мин)
  - 1 mini demo урађеног
  - 1 ретроспектива: шта је било тешко, шта мијењамо

## 8) Проверa напретка (checkpoint-и)

- **Дан 14:** локално окружење + први PR
- **Дан 30:** један мали Odoo task уз review
- **Дан 60:** самосталан quickfix + smoke test
- **Дан 90:** самосталан end-to-end task у KomITi workflow-у
- **Мјесец 6:** стабилан mid-level delivery
- **Мјесец 12:** професионални ниво за већину Odoo/KomITi задатака

Capstone checkpoints:
- **Дан 14:** `komiti_academy` skeleton
- **Дан 30:** installable MVP
- **Дан 60:** business rules + negative tests
- **Дан 90:** documentation + verification + clean handoff

## 9) Definition of Done за „0 -> pro"

Кандидат се сматра „професионалцем“ кад:
- Самостално испоручује feature/quickfix са квалитетом
- Самостално ради root-cause debugging
- Самостално води `dev -> prod` промоцију уз верификацију
- Пише јасну документацију и handoff
- Не нарушава KomITi стандарде из `ENGINEERING_CODEX.md`
- Има један свој модул `komiti_academy` који је прошао install, upgrade, verification и documentation циклус

## 10) Напомена

Овај plan је реалан и амбициозан. Кључ успеха: континуитет, менторски feedback и рад на стварним задачама, не само теорији.

Learning документи у `learning/` нису генерички Odoo курс, него KomITi-centered curriculum. Нови члан тима кроз њих истовремено учи:
- Odoo основе,
- KomITi модуле,
- KomITi engineering дисциплину,
- начин размишљања који се очекује у стварном delivery-ју.