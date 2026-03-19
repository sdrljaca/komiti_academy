# KomITi End2End Onboarding Learning Path (0 -> Professional)

Document Owner: Project Manager
Product Scope Input: Product Manager
Business Context Input: Business Owner

Циљ документа: Ово је кровни за читав сет докумената у `komiti_academy` learning библиотеке. Циљ библиотеке је да од Кандидата направи од потпуног почетника до самосталног Odoo/Python инжењера у KomITi начину рада:
- KomITi engineering начин рада,
- KomITi branch / promotion / documentation дисциплину,
- KomITi custom модуле и пословне flow-ове,
- начин дијагнозе, тестирања и испоруке измјена у овом репоу.

Кроз цијели onboarding постоји и један трајни завршни практични пројекат који се гради кроз све фазе:
- полазник постепено гради свој први модул `komiti_academy`,
- свака фаза додаје нови слој тог модула,
- до краја learning path-а модул мора бити готов, истестиран и документован,
- полазник своју верзију пројекта ради у свом GitHub репоу `komiti_academy_ime_polaznika`,
- главни product description је у `00_ОПИС_ПРОИЗВОДА_2h.md`,
- главна спецификација завршног пројекта и execution plan су у `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`.

## Садржај

1\) Како се користe документи у овом komiti_academy repo<br>
2\) Пројектни план<br>
3\) Фаза A — Foundations (седмице 1–4)<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.1 Циљ<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.2 Теме<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.3 Критеријум пролаза<br>
4\) Фаза B — Guided Odoo Development (седмице 5–8)<br>
&nbsp;&nbsp;&nbsp;&nbsp;4.1 Циљ<br>
&nbsp;&nbsp;&nbsp;&nbsp;4.2 Теме<br>
&nbsp;&nbsp;&nbsp;&nbsp;4.3 Критеријум пролаза<br>
5\) Фаза C — Independent Delivery (седмице 9–12)<br>
&nbsp;&nbsp;&nbsp;&nbsp;5.1 Циљ<br>
&nbsp;&nbsp;&nbsp;&nbsp;5.2 Теме<br>
&nbsp;&nbsp;&nbsp;&nbsp;5.3 Критеријум пролаза<br>
6\) Фаза D — Professional Growth (мјесеци 4–12)<br>
&nbsp;&nbsp;&nbsp;&nbsp;6.1 Циљ<br>
&nbsp;&nbsp;&nbsp;&nbsp;6.2 Теме<br>
&nbsp;&nbsp;&nbsp;&nbsp;6.3 Излазни исход<br>
7\) Дневни/седмични ритам учења<br>
8\) Проверa напретка (checkpoint-и)<br>
9\) Definition of Done за „0 -> pro"<br>
10\) Напомена

## 1) Како се користe документи у овом komiti_academy repo

Редослијед није случајан. Читање иде од потпуног почетника ка раднику који разумије и Odoo и KomITi начин рада:
1. прочиташ како ће изгледати производ који ћеш направити кроз овај курс
  - документ: `00_ОПИС_ПРОИЗВОДА_2h.md`,
2. прво учиш основне појмове,
  - документи:  `01_УПРАВЉАЊЕ_ПРОЈЕКТОМ_И_ПРОИЗВОДОМ_2h.md`, `02_GIT_VSCODE_ОСНОВЕ_2h.md`, `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`, `04_ODOO_ОСНОВЕ_4h.md`, `05_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
3. онда учиш како се чита модул и систем,
  - документи: `06_АНАТОМИЈА_ДОБРОГ_ODOO_МОДУЛА_2h.md`, `07_КАКО_СЕ_ЧИТА_ODOO_МОДУЛ_3h.md`
4. онда учиш KomITi module/domain стварност,
  - документи: `08_KOMITI_МАПА_ДОМЕНСКОГ_МОДЕЛА_2h.md`, `../custom-addons/komiti_timesheet/CODEX_ODOO_KOMITI_TIMESHEET.md`, `../custom-addons/komiti_gantt/CODEX_ODOO_KOMITI_GANTT.md`
5. тек онда читаш policy/codex слој пуним капацитетом,
  - документи: `../custom-addons/CODEX_ODOO.md`, `../ENGINEERING_CODEX.md`, `../SESSION_NOTES.md`
6. тек послије тога улазиш у debugging, testing, rollout и infra discipline.
  - документи: `09_ODOO_ПРИРУЧНИК_ЗА_ОТКЛАЊАЊЕ_ГРЕШАКА_3h.md`, `10_ODOO_ПРИРУЧНИК_ЗА_ТЕСТИРАЊЕ_И_ПРОВЈЕРУ_3h.md`, `11_ODOO_БЕЗБЈЕДНОСТ_ПОДАТАКА_И_МИГРАЦИЈЕ_3h.md`, `12_ODOO_ЛИСТА_ПРОВЈЕРЕ_ЗА_ПРЕГЛЕД_КОДА_1h.md`, `13_РАЗЛАГАЊЕ_ЗАДАТКА_И_РАЗМИШЉАЊЕ_О_ИСПОРУЦИ_2h.md`, `14_ODOO_ВЕБСАЈТ_И_КОРИСНИЧКИ_ИНТЕРФЕЈС_2h.md`, `15_ЉЕСТВИЦА_ПРАКСЕ_20_ВЈЕЖБИ_40h.md`, `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`, `../infra/aws/CODEX_TERRAFORM.md`, `../infra/aws/odoo-dev-ec2-compose/RUNBOOK.md`

Ако током читања наиђеш на појам или акроним који ти није јасан, користи appendix документ `99_РЈЕЧНИК_АКРОНИМА.md` као брзи индекс термина и упуту ка главним документима гдје је тај појам детаљније обрађен.

## 2) Пројектни план

За кандидата без претходног програмерског искуства реалан распон је 39–52 седмице; овдје је тај исти временски оквир приказан кроз scope који треба да буде испоручен у свакој фази:
- Junior: Основна оперативна самосталност: 12 седмица (8–10 седмица само у убрзаном режиму=
  1.1) Фаза A — Foundations (седмице 1–4): 
      испорука основног разумијевања рада, локалног окружења, Odoo основа и првог `komiti_academy` skeleton-а.
  1.2) Фаза B — Guided Odoo Development (седмице 5–8): 
      испорука installable MVP-а са model-има, relation-има, view-овима, action/menu слојем и basic security.
  1.3) Фаза C — Independent Delivery (седмице 9–12):
      испорука business rules, verification note-а, docs delta и јасног Definition of Done status-а за `komiti_academy`.

- Mid-level рад на пројекту: 4–8 мјесеци
  1.4) Рани и средњи дио Фазе D — Professional Growth (мјесеци 4–8): 
      испорука стабилнијег, чистијег и review-safe модула који кандидат може самостално одржавати, проширивати и бранити кроз review.

- Senior: Сам води сложеније измјене end-to-end: 9–12 мјесеци
  1.5) Каснији дио Фазе D — Professional Growth (мјесеци 9–12): 
      испорука зреле верзије `komiti_academy` као личног доказа да кандидат умије водити сложенији scope, rollout и handoff готово без надзора.

Задаци у пројекту
Док читаш `komiti_academy` learning библиотеку, добијаћеш пројектне задатке који се налазе на крају сваког документа (у поглављима `99) Задатак на komiti_academy пројекту за кандидата` и `Рјешења:`).

Кад желиш једним читањем да видиш све task-ове који воде ка готовом `komiti_academy`, користи ове референце:

- `02_GIT_VSCODE_ОСНОВЕ_2h.md`: Git task-ови за feature branch, clean commit и push discipline, са упутом из workflow поглавља.
- `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`: runtime/infra reasoning task-ови, локални Terraform + Docker Desktop lab за `komiti_academy` dev runtime и упута како да разликујеш infra enablement од application проблема и core product scope-а.
- `04_ODOO_ОСНОВЕ_4h.md`: први стварни project task-ови за почетну структуру модула, model-е, relation-е, поља и UI, са упутом на foundations поглавља.
- `05_БРЗИ_ПОЧЕТАК_РАДА_1h.md`: project-specific почетни задатак и како да га operationalно припремиш након што савладаш Odoo основе.
- `06_АНАТОМИЈА_ДОБРОГ_ODOO_МОДУЛА_2h.md`: task-ови за module structure и упута која поглавља воде manifest, XML и security провјеру.
- `07_КАКО_СЕ_ЧИТА_ODOO_МОДУЛ_3h.md`: task-ови за читање властитог модула и упута којим редослиједом то радиш.
- `10_ODOO_ПРИРУЧНИК_ЗА_ТЕСТИРАЊЕ_И_ПРОВЈЕРУ_3h.md`: verification task-ови и јасна референца на testing, role-based testing и поглавља о провјери завршног пројекта.
- `12_ODOO_ЛИСТА_ПРОВЈЕРЕ_ЗА_ПРЕГЛЕД_КОДА_1h.md`: сопствена review провјера и упута како да прођеш review checklist корак по корак.
- `13_РАЗЛАГАЊЕ_ЗАДАТКА_И_РАЗМИШЉАЊЕ_О_ИСПОРУЦИ_2h.md`: planning/risk task-ови и директна упута на planning template и risk questions.
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`: главни implementation task-ови и најдиректнији step-by-step пут кроз scope, rules, UI, security, checkpoints и DoD.

## 3) Фаза A — Foundations (седмице 1–4)

### 3.1 Циљ

Кандидат да разумије основе програмирања, Git-а, SQL-а и локалног Odoo workflow-а.

### 3.2 Теме

- Python основе: типови, функције, услови, петље, грешке
  - нема засебног Python-only документа у овој фази;
  - Python основе се највише утврђују кроз `04_ODOO_ОСНОВЕ_4h.md`
    - На `komiti_academy` skeleton-у именуј која су поља input, која су derived, а гдје очекујеш business rule Python логику
  - `06_АНАТОМИЈА_ДОБРОГ_ODOO_МОДУЛА_2h.md`
    - У постојећем Odoo модулу пронађи једну Python model класу и објасни import-е, класу, метод и по један услов или петљу ако постоје
  - `07_КАКО_СЕ_ЧИТА_ODOO_МОДУЛ_3h.md`
    - Прочитај једну једноставну Python методу у модулу и објасни шта у њој раде параметри, услови, recordset loop и повратна вриједност
- Git основе: branch, commit, merge, pull request
  - уводни operational контекст из `05_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
    - Клонирај repo `komiti_academy_ime_polaznika` локално
  - `02_GIT_VSCODE_ОСНОВЕ_2h.md`
    - Отвори свој налог на GitHub и претплати се на услугу GitCopilot
    - Креирај свој GitHub repo `komiti_academy_ime_polaznika`
    - Направити micro PR који мијења документацију
- SQL основе: SELECT, JOIN, WHERE, GROUP BY
  - нема засебног SQL-only документа у овој фази; 
  - SQL reasoning се вјежба уз `05_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
    - Написати 5 SQL упита над локалном базом (уз објашњење резултата)
  - data/model контекст из `04_ODOO_ОСНОВЕ_4h.md`
    - Објасни резултате тих SQL упита кроз Odoo data/model контекст
- AWS основе: EC2, security group, VPC, EIP, DNS thinking
  - документи: `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
    - Објасни на једном кратком примјеру како су EC2 host, security group, јавна IP адреса и DNS повезани у један runtime пут до Odoo сервиса
- Docker основе: контејнер, image, `docker compose`
  - `05_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
    - Подигни локално окружење из repo-а `komiti_academy_ime_polaznika`
  - `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
- Terraform основе: provider, resource, variables, state, `plan`/`apply`
  - `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
    - Осмисли минимални Terraform lab за `komiti_academy` dev runtime и објасни улогу `provider`, `resource`, `variables`, `state`, `plan` и `apply` у том lab-у
- Odoo основе: model, view, action, security, module upgrade
  - `04_ODOO_ОСНОВЕ_4h.md`
    - Направити skeleton за `komiti_academy`
  - `06_АНАТОМИЈА_ДОБРОГ_ODOO_МОДУЛА_2h.md`
    - Дорадити skeleton за `komiti_academy` према структури доброг Odoo модула
  - `07_КАКО_СЕ_ЧИТА_ODOO_МОДУЛ_3h.md`
    - Измјенити један label/field у Odoo view-у и пустити module upgrade
  - `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`
    - напомена: касније служи као документ за сабирање и контролне тачке завршног пројекта

### 3.3 Критеријум пролаза

- Може сам да подигне локално окружење
- Разумије где су `ENGINEERING_CODEX`, `custom-addons/CODEX_ODOO`, `SESSION_NOTES` и `00_END2END_ONBOARDING_ПУТ_УЧЕЊА_39-52w.md`
- Направио бар 1 чист PR по стандарду
- `komiti_academy` skeleton постоји и може бити објашњен без нагађања

## 4) Фаза B — Guided Odoo Development (седмице 5–8)

### 4.1 Циљ

Кандидат да умије да имплементира мали feature уз менторски review.

### 4.2 Теме

- Odoo ORM (fields, compute, related)
  - `08_KOMITI_МАПА_ДОМЕНСКОГ_МОДЕЛА_2h.md`
    - Довести `komiti_academy` до installable MVP-а на нивоу model-а и основног flow-а
  - `../custom-addons/komiti_timesheet/CODEX_ODOO_KOMITI_TIMESHEET.md`
    - Урадити једну ORM измјену на `komiti_timesheet` моделу и објаснити зашто је то `fields/compute/related` problem
- XML view inheritance (xpath, стабилни anchor-и)
  - `../custom-addons/komiti_gantt/CODEX_ODOO_KOMITI_GANTT.md`
    - Урадити једну измјену у list/form/calendar view-у уз стабилан xpath anchor
  - `../custom-addons/CODEX_ODOO.md`
    - Довести `komiti_academy` до installable MVP-а на нивоу view-ова, action-а и menu-а
- Access rules / групе / security
  - `../custom-addons/CODEX_ODOO.md`
    - Исправити једно permission понашање у постојећем модулу
    - Довести `komiti_academy` до installable MVP-а на нивоу basic security
- Тестирање UI flow-а по role-ама
  - `../custom-addons/CODEX_ODOO.md`
    - Направити smoke test записник за `employee/manager/admin`
- Документација након имплементације
  - `../custom-addons/CODEX_ODOO.md`
    - Документовати шта је урађено и шта је ручно провјерено за `komiti_academy` MVP

### 4.3 Критеријум пролаза

- 2–3 merge-ована PR-а без критичних regression-а
- Самостално прати `staging -> main` flow уз менторску потврду
- `komiti_academy` се инсталира, отвара у UI-ју и покрива основни flow course -> session

## 5) Фаза C — Independent Delivery (седмице 9–12)

### 5.1 Циљ

Кандидат да испоручује мањи task самостално end-to-end.

### 5.2 Теме

- Root-cause debugging
  - `09_ODOO_ПРИРУЧНИК_ЗА_ОТКЛАЊАЊЕ_ГРЕШАКА_3h.md`
    - Самостално затвори 1 quickfix и укратко образложи root cause
- Hotfix дисциплина
  - `../ENGINEERING_CODEX.md`
    - Самостално затвори 1 feature task по KomITi delivery стандарду
    - Самостално затвори 1 quickfix без нарушавања hotfix discipline
  - `../SESSION_NOTES.md`
    - Напиши handoff note за испоручену измјену
- Release checklist (pre/deploy/post)
  - `10_ODOO_ПРИРУЧНИК_ЗА_ТЕСТИРАЊЕ_И_ПРОВЈЕРУ_3h.md`
    - Уради post-deploy smoke
    - Заврши verification note за `komiti_academy`
  - `../SESSION_NOTES.md`
    - Евидентирај резултат smoke-а и handoff
- Анализа impact-а измјена
  - `13_РАЗЛАГАЊЕ_ЗАДАТКА_И_РАЗМИШЉАЊЕ_О_ИСПОРУЦИ_2h.md`
    - Самостално затвори 1 feature task уз јасан impact reasoning
    - Заврши business rules и docs delta за `komiti_academy`

### 5.3 Критеријум пролаза

- Самостално имплементира, тестира, документује и пушта мањи task
- Може објаснити зашто је нешто root-cause, а не симптом
- `komiti_academy` има manual verification proof и јасан Definition of Done status

## 6) Фаза D — Professional Growth (мјесеци 4–12)

### 6.1 Циљ

Кандидат да постаје стабилан носилац дијела система.

### 6.2 Теме

- Напредни Odoo patterns
  - `14_ODOO_ВЕБСАЈТ_И_КОРИСНИЧКИ_ИНТЕРФЕЈС_2h.md`
    - Уради једну напреднију UI/website измјену и објасни зашто није само basic view change
  - `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`
    - Прошири `komiti_academy` једним напреднијим Odoo pattern-ом који тражи самосталан design choice и review reasoning
- Архитектура pipeline-а (Fabrick)
  - `../infra/aws/CODEX_TERRAFORM.md`
    - Објасни architecture/pipeline слој и наведи које промјене иду кроз Terraform discipline, а које не
  - `../infra/aws/odoo-dev-ec2-compose/RUNBOOK.md`
    - Симулирај један operational scenario и опиши који би runbook кораци били први
- Performance и data quality
  - `11_ODOO_БЕЗБЈЕДНОСТ_ПОДАТАКА_И_МИГРАЦИЈЕ_3h.md`
    - На једном примјеру објасни data quality risk, migration risk и како би то провјерио прије пуштања измјене
- Incident response и техничко вођство мањих иницијатива
  - `12_ODOO_ЛИСТА_ПРОВЈЕРЕ_ЗА_ПРЕГЛЕД_КОДА_1h.md`
    - Самостално уради review једне сложеније измјене по checklist-и и запиши findings
  - `15_ЉЕСТВИЦА_ПРАКСЕ_20_ВЈЕЖБИ_40h.md`
    - Изабери неколико вјежби које воде ка техничком вођству и повежи их са наредним корацима на `komiti_academy`

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

Контролне тачке завршног пројекта:
- **Дан 14:** `komiti_academy` skeleton
- **Дан 30:** installable MVP
- **Дан 60:** business rules + negative tests
- **Дан 90:** documentation + verification + clean handoff

## 9) Definition of Done за „0 -> pro"

Кандидат се сматра „професионалцем“ кад:
- Самостално испоручује feature/quickfix са квалитетом
- Самостално ради root-cause debugging
- Самостално води `staging -> main` промоцију уз верификацију
- Пише јасну документацију и handoff
- Не нарушава KomITi стандарде из `ENGINEERING_CODEX.md`
- Има један свој модул `komiti_academy` који је прошао install, upgrade, verification и documentation циклус

## 10) Напомена

Овај plan је реалан и амбициозан. Кључ успеха: континуитет, менторски feedback и рад на стварним задачама, не само теорији.

Learning документи у root-у `komiti_academy` repo-а нису генерички Odoo курс, него KomITi-centered curriculum. Нови члан тима кроз њих истовремено учи:
- Odoo основе,
- KomITi модуле,
- KomITi engineering дисциплину,
- начин размишљања који се очекује у стварном delivery-ју.

